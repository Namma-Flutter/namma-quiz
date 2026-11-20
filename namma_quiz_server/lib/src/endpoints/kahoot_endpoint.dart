import 'dart:async';
import 'dart:math';

import 'package:serverpod/serverpod.dart';

import '../game/game_lifecycle.dart';
import '../game/room_registry.dart';
import '../generated/protocol.dart';

class KahootEndpoint extends Endpoint {
  /// Create a new game session from a quiz and return the PIN plus the host's
  /// secret token. The token is required for every host action.
  Future<HostSession> createGame(Session session, int quizId, int hostId) async {
    final pin = await _generatePin(session);
    final hostToken = generateToken();

    var game = GameSession(
      pin: pin,
      quizId: quizId,
      hostId: hostId,
      status: 'lobby',
      currentQuestionIndex: 0,
      hostTokenHash: hashToken(hostToken),
    );

    game = await GameSession.db.insertRow(session, game);
    RoomRegistry.instance.room(pin);

    return HostSession(
      pin: game.pin,
      quizId: game.quizId,
      hostId: game.hostId,
      status: game.status,
      currentQuestionIndex: game.currentQuestionIndex,
      startTime: game.startTime,
      hostToken: hostToken,
    );
  }

  /// Get public game info by PIN. Never contains secret tokens.
  Future<GameSession?> getGameByPin(Session session, String pin) {
    return findGame(session, pin);
  }

  /// Players and hosts call this stream to receive real-time updates.
  ///
  /// The first event is always a `STATE_SNAPSHOT` (or `RESUME_REJECTED`). The
  /// secret [token] identifies the caller; it is never trusted from a name or
  /// player id.
  Stream<GameEvent> gameStream(
    Session session,
    String pin,
    bool isHost,
    String token,
  ) async* {
    final game = await getGameByPin(session, pin);
    if (game == null) {
      yield gameEvent('RESUME_REJECTED', {'reason': 'ROOM_NOT_FOUND'});
      return;
    }
    if (game.status == 'finished') {
      yield gameEvent('RESUME_REJECTED', {'reason': 'ROOM_ENDED'});
      return;
    }

    final runtime = RoomRegistry.instance.room(pin);
    if (runtime.ended) {
      yield gameEvent('RESUME_REJECTED', {'reason': 'ROOM_ENDED'});
      return;
    }

    final handle = ConnectionHandle(
      session is MethodStreamSession
          ? session.connectionId
          : UuidValue.fromString('00000000-0000-0000-0000-000000000000'),
    );
    Player? player;

    if (isHost) {
      if (!isHostToken(game, token)) {
        yield gameEvent('RESUME_REJECTED', {'reason': 'INVALID_HOST_TOKEN'});
        return;
      }
      runtime.host.cancelTimer();
      final previousHost = runtime.host.handle;
      runtime.host.handle = handle;
      if (previousHost != null && previousHost != handle) {
        previousHost.send(gameEvent('REPLACED', {'reason': 'REPLACED'}));
        unawaited(previousHost.close());
      }
    } else {
      final tokenHash = hashToken(token);
      if (runtime.bannedTokenHashes.contains(tokenHash)) {
        yield gameEvent('RESUME_REJECTED', {'reason': 'KICKED'});
        return;
      }

      player = await findPlayerByToken(session, game, tokenHash);
      if (player == null) {
        yield gameEvent('RESUME_REJECTED', {'reason': 'INVALID_TOKEN'});
        return;
      }

      final presence = runtime.presenceFor(player.id!);
      presence.cancelTimers();
      final previousHandle = presence.handle;
      presence.handle = handle;
      presence.connected = true;

      if (previousHandle != null && previousHandle != handle) {
        previousHandle.send(gameEvent('REPLACED', {'reason': 'REPLACED'}));
        unawaited(previousHandle.close());
      }

      if (player.status != 'connected') {
        player.status = 'connected';
        await Player.db.updateRow(session, player);
      }

      await session.messages.postMessage(
        'game-$pin-host',
        gameEvent('PLAYER_RETURNED', {
          'playerId': player.id,
          'name': player.name,
        }),
      );
      await broadcastVisiblePlayers(session, game, runtime);
    }

    yield await buildStateSnapshot(
      session,
      game,
      runtime,
      isHost: isHost,
      player: player,
    );

    final channel = isHost ? 'game-$pin-host' : 'game-$pin';
    final out = StreamController<GameEvent>();
    final channelStream = session.messages.createStream<GameEvent>(channel);
    final channelSub = channelStream.listen(out.add, onError: out.addError);
    final controlSub = handle.out.stream.listen(
      out.add,
      onDone: () {
        if (!out.isClosed) out.close();
      },
    );

    // Keep connection alive across idle intervals (host speaking, lobby waiting).
    // Serverpod client times out after 40s idle; proxies timeout around 60s.
    final heartbeatTimer = Timer.periodic(const Duration(seconds: 15), (_) {
      if (!out.isClosed) {
        out.add(gameEvent('HEARTBEAT', {'time': DateTime.now().toIso8601String()}));
      }
    });

    out.onCancel = () async {
      heartbeatTimer.cancel();
      await channelSub.cancel();
      await controlSub.cancel();
    };

    try {
      yield* out.stream;
    } finally {
      heartbeatTimer.cancel();
      await channelSub.cancel();
      await controlSub.cancel();
      if (!out.isClosed) await out.close();
      await handleConnectionClosed(
        pin: pin,
        isHost: isHost,
        playerId: player?.id,
        handle: handle,
      );
    }
  }

  /// Join a lobby. Names are display-only and may repeat; identity is the
  /// secret token returned in [JoinResult].
  Future<JoinResult?> joinGame(
    Session session,
    String pin,
    String username,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null || game.status != 'lobby') return null;

    final token = generateToken();
    var player = Player(
      gameSessionId: game.id!,
      name: username,
      score: 0,
      status: 'connected',
      tokenHash: hashToken(token),
    );

    player = await Player.db.insertRow(session, player);

    final runtime = RoomRegistry.instance.room(pin);
    runtime.presenceFor(player.id!).connected = true;

    await session.messages.postMessage(
      'game-$pin-host',
      gameEvent('PLAYER_JOINED', {
        'playerId': player.id,
        'name': player.name,
      }),
    );
    await broadcastVisiblePlayers(session, game, runtime);

    return JoinResult(
      playerId: player.id!,
      gameSessionId: game.id!,
      name: player.name,
      score: player.score,
      token: token,
    );
  }

  /// Host starts the first question.
  Future<void> startQuestion(
    Session session,
    String pin,
    String hostToken,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null || !isHostToken(game, hostToken)) return;

    game.status = 'active';
    game.startTime = DateTime.now();
    await GameSession.db.updateRow(session, game);

    await _postBoth(
      session,
      pin,
      gameEvent('QUESTION_STARTED', {
        'questionIndex': game.currentQuestionIndex,
      }),
    );
  }

  /// Host transitions to the next question.
  Future<GameSession?> nextQuestion(
    Session session,
    String pin,
    String hostToken,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null || !isHostToken(game, hostToken)) return null;

    game.currentQuestionIndex += 1;
    game.status = 'active';
    game.startTime = DateTime.now();
    await GameSession.db.updateRow(session, game);

    await _postBoth(
      session,
      pin,
      gameEvent('QUESTION_STARTED', {
        'questionIndex': game.currentQuestionIndex,
      }),
    );

    return game;
  }

  /// Player submits an answer, returning points earned (or 0 if duplicate,
  /// invalid or the player is away).
  Future<int> submitAnswer(
    Session session,
    String pin,
    String token,
    int optionIndex,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null || game.status != 'active' || game.startTime == null) {
      return 0;
    }

    final player = await findPlayerByToken(session, game, hashToken(token));
    if (player == null || player.status == 'away') return 0;

    final answers = decodeAnswers(player.answersJson);
    final questionKey = game.currentQuestionIndex.toString();
    if (answers.containsKey(questionKey)) return 0;

    final question = await Question.db.findFirstRow(
      session,
      where: (t) =>
          t.quizId.equals(game.quizId) &
          t.orderIndex.equals(game.currentQuestionIndex),
    );
    if (question == null) return 0;
    if (optionIndex < 0 || optionIndex >= question.options.length) return 0;

    var points = 0;
    if (question.correctOptionIndex == optionIndex) {
      final timeTaken = DateTime.now().difference(game.startTime!).inSeconds;
      final timeLimit = question.timeLimitSeconds;
      if (timeTaken <= timeLimit) {
        points = (1000 * (1 - (timeTaken / (timeLimit * 2.0)))).round();
        if (points < 500) points = 500;
      } else {
        points = 500;
      }
    }

    answers[questionKey] = optionIndex;
    player.answersJson = encodeAnswers(answers);
    if (points > 0) player.score += points;
    await Player.db.updateRow(session, player);

    await session.messages.postMessage(
      'game-$pin-host',
      gameEvent('ANSWER_RECEIVED', {
        'playerId': player.id,
        'optionIndex': optionIndex,
        'points': points,
      }),
    );

    await _maybeNotifyAllAnswered(session, game, questionKey);
    return points;
  }

  /// Check if a player has already submitted an answer for a question.
  Future<bool> hasAnsweredQuestion(
    Session session,
    String pin,
    String token,
    int questionIndex,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null) return false;

    final player = await findPlayerByToken(session, game, hashToken(token));
    if (player == null) return false;

    return decodeAnswers(player.answersJson).containsKey(questionIndex.toString());
  }

  /// Validate a stored token and return the player it belongs to.
  Future<Player?> resumePlayer(
    Session session,
    String pin,
    String token,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null || game.status == 'finished') return null;

    final tokenHash = hashToken(token);
    final runtime = RoomRegistry.instance.existing(pin);
    if (runtime?.bannedTokenHashes.contains(tokenHash) ?? false) return null;

    return findPlayerByToken(session, game, tokenHash);
  }

  /// Get current player details (including updated score).
  Future<Player?> getPlayer(Session session, int playerId) {
    return Player.db.findById(session, playerId);
  }

  /// Get all players registered for a game session.
  Future<List<Player>> getPlayers(Session session, String pin) async {
    final game = await getGameByPin(session, pin);
    if (game == null) return [];

    return Player.db.find(
      session,
      where: (t) => t.gameSessionId.equals(game.id),
      orderBy: (t) => t.id,
    );
  }

  /// Player leaves the game.
  Future<bool> leaveGame(Session session, String pin, String token) async {
    final game = await getGameByPin(session, pin);
    if (game == null) return false;

    final player = await findPlayerByToken(session, game, hashToken(token));
    if (player == null) return false;

    final runtime = RoomRegistry.instance.existing(pin);
    if (runtime != null) {
      final presence = runtime.players.remove(player.id);
      if (presence != null) {
        presence.cancelTimers();
        presence.connected = false;
        await presence.handle?.close();
      }
    }

    await Player.db.deleteRow(session, player);
    await session.messages.postMessage(
      'game-$pin-host',
      gameEvent('PLAYER_LEFT', {
        'playerId': player.id,
        'name': player.name,
        'reason': 'left',
      }),
    );
    if (runtime != null) {
      await broadcastVisiblePlayers(session, game, runtime);
    }
    return true;
  }

  /// Host removes or kicks a player. The player's token is banned for the rest
  /// of the room's lifetime.
  Future<bool> kickPlayer(
    Session session,
    String pin,
    String hostToken,
    int playerId,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null || !isHostToken(game, hostToken)) return false;

    final player = await Player.db.findById(session, playerId);
    if (player == null || player.gameSessionId != game.id) return false;

    final runtime = RoomRegistry.instance.existing(pin);
    if (runtime != null) {
      final presence = runtime.players.remove(playerId);
      final tokenHash = player.tokenHash;
      if (tokenHash != null) runtime.bannedTokenHashes.add(tokenHash);

      if (presence != null) {
        presence.cancelTimers();
        presence.connected = false;
        presence.handle?.send(
          gameEvent('KICKED', {'playerId': playerId, 'reason': 'KICKED'}),
        );
        final handle = presence.handle;
        presence.handle = null;
        await handle?.close();
      }
    }

    await Player.db.deleteRow(session, player);
    await session.messages.postMessage(
      'game-$pin-host',
      gameEvent('PLAYER_LEFT', {
        'playerId': playerId,
        'name': player.name,
        'reason': 'kicked',
      }),
    );
    if (runtime != null) {
      await broadcastVisiblePlayers(session, game, runtime);
    }
    return true;
  }

  /// Host ends the question, locking responses and revealing the answer.
  Future<void> endQuestion(
    Session session,
    String pin,
    String hostToken,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null ||
        game.status != 'active' ||
        !isHostToken(game, hostToken)) {
      return;
    }

    game.status = 'paused';
    await GameSession.db.updateRow(session, game);

    final question = await Question.db.findFirstRow(
      session,
      where: (t) =>
          t.quizId.equals(game.quizId) &
          t.orderIndex.equals(game.currentQuestionIndex),
    );

    final leaderboard = await leaderboardRows(session, game);

    await _postBoth(
      session,
      pin,
      gameEvent('QUESTION_ENDED', {
        'questionIndex': game.currentQuestionIndex,
        'correctOptionIndex': question?.correctOptionIndex ?? 0,
        'leaderboard': leaderboard,
      }),
    );
  }

  /// Host shows leaderboard.
  Future<void> showLeaderboard(
    Session session,
    String pin,
    String hostToken,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null || !isHostToken(game, hostToken)) return;

    final topPlayers = await leaderboardRows(session, game, limit: 10);

    await _postBoth(
      session,
      pin,
      gameEvent('SHOW_LEADERBOARD', {'topPlayers': topPlayers}),
    );
  }

  /// Host finishes the game and reveals the podium (top 3) and full ranks.
  Future<void> finishGame(
    Session session,
    String pin,
    String hostToken,
  ) async {
    final game = await getGameByPin(session, pin);
    if (game == null || !isHostToken(game, hostToken)) return;

    game.status = 'finished';
    await GameSession.db.updateRow(session, game);

    final allPlayers = await leaderboardRows(session, game);

    await _postBoth(
      session,
      pin,
      gameEvent('GAME_FINISHED', {
        'topPlayers': allPlayers.take(3).toList(),
        'allPlayers': allPlayers,
      }),
    );

    scheduleRoomCleanup(pin);
  }

  Future<void> _maybeNotifyAllAnswered(
    Session session,
    GameSession game,
    String questionKey,
  ) async {
    final runtime = RoomRegistry.instance.existing(game.pin);
    if (runtime == null) return;

    final rows = await Player.db.find(
      session,
      where: (t) => t.gameSessionId.equals(game.id),
    );

    final active = rows.where((player) {
      final presence = runtime.players[player.id];
      if (presence != null) return presence.connected;
      return player.status == 'connected';
    }).toList();

    if (active.isEmpty) return;

    final answered = active
        .where((player) => decodeAnswers(player.answersJson).containsKey(questionKey))
        .length;

    if (answered >= active.length) {
      await session.messages.postMessage(
        'game-${game.pin}-host',
        gameEvent('ALL_ANSWERED', {
          'questionIndex': game.currentQuestionIndex,
        }),
      );
    }
  }

  Future<void> _postBoth(
    Session session,
    String pin,
    GameEvent event,
  ) async {
    await session.messages.postMessage('game-$pin', event);
    await session.messages.postMessage('game-$pin-host', event);
  }

  Future<String> _generatePin(Session session) async {
    final rng = Random.secure();
    for (var attempt = 0; attempt < 20; attempt++) {
      final pin = (rng.nextInt(900000) + 100000).toString();
      final existing = await GameSession.db.findFirstRow(
        session,
        where: (t) => t.pin.equals(pin),
      );
      if (existing == null) return pin;
    }
    return (rng.nextInt(900000) + 100000).toString();
  }
}
