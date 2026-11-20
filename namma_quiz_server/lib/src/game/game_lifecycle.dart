import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:crypto/crypto.dart';
import 'package:serverpod/serverpod.dart';

import '../generated/protocol.dart';
import 'room_registry.dart';

/// Length of a generated secret token in bytes (encoded as base64Url).
const _tokenBytes = 32;

final _secureRandom = Random.secure();

/// Generates a cryptographically secure resume token for a player or host.
String generateToken() {
  final bytes = List<int>.generate(_tokenBytes, (_) => _secureRandom.nextInt(256));
  return base64UrlEncode(bytes);
}

/// Hashes a token before it is stored or compared.
String hashToken(String token) =>
    sha256.convert(utf8.encode(token)).toString();

/// Builds a [GameEvent] with a JSON encoded payload.
GameEvent gameEvent(String type, Map<String, dynamic> data) =>
    GameEvent(eventType: type, dataJson: jsonEncode(data));

/// Looks up a game by its public PIN.
Future<GameSession?> findGame(Session session, String pin) {
  return GameSession.db.findFirstRow(
    session,
    where: (t) => t.pin.equals(pin),
  );
}

/// Returns true when [token] is the secret token issued to the host.
bool isHostToken(GameSession game, String token) {
  final stored = game.hostTokenHash;
  return stored != null && stored == hashToken(token);
}

/// Finds a player in [game] that owns [tokenHash].
Future<Player?> findPlayerByToken(
  Session session,
  GameSession game,
  String tokenHash,
) {
  return Player.db.findFirstRow(
    session,
    where: (t) =>
        t.gameSessionId.equals(game.id) & t.tokenHash.equals(tokenHash),
  );
}

/// Decodes the per-player answer map stored on [Player.answersJson].
Map<String, int> decodeAnswers(String? json) {
  if (json == null || json.isEmpty) return {};
  try {
    final decoded = jsonDecode(json);
    if (decoded is Map) {
      return decoded.map(
        (key, value) => MapEntry(key.toString(), (value as num).toInt()),
      );
    }
  } catch (_) {
    // Corrupt payloads are treated as "no answers".
  }
  return {};
}

/// Encodes the per-player answer map for storage on [Player.answersJson].
String encodeAnswers(Map<String, int> answers) => jsonEncode(answers);

/// Players that should currently be visible to the host.
///
/// A player is visible while their live connection is attached. Players that
/// have never connected yet are still shown (their row is marked `connected`
/// when they join).
Future<List<Map<String, dynamic>>> visiblePlayers(
  Session session,
  GameSession game,
  RoomRuntime runtime,
) async {
  final rows = await Player.db.find(
    session,
    where: (t) => t.gameSessionId.equals(game.id),
    orderBy: (t) => t.id,
  );

  return rows
      .where((player) {
        final presence = runtime.players[player.id];
        if (presence != null) return presence.connected;
        return player.status == 'connected';
      })
      .map(
        (player) => <String, dynamic>{
          'id': player.id,
          'name': player.name,
          'score': player.score,
        },
      )
      .toList();
}

/// Sends the host a full snapshot of the visible players.
Future<void> broadcastVisiblePlayers(
  Session session,
  GameSession game,
  RoomRuntime runtime,
) async {
  final players = await visiblePlayers(session, game, runtime);
  await session.messages.postMessage(
    'game-${game.pin}-host',
    gameEvent('VISIBLE_PLAYERS_SNAPSHOT', {'players': players}),
  );
}

/// Counts answers for the current question.
Future<Map<int, int>> answerCounts(Session session, GameSession game) async {
  final rows = await Player.db.find(
    session,
    where: (t) => t.gameSessionId.equals(game.id),
  );

  final key = game.currentQuestionIndex.toString();
  final counts = <int, int>{};
  for (final player in rows) {
    final option = decodeAnswers(player.answersJson)[key];
    if (option != null) counts[option] = (counts[option] ?? 0) + 1;
  }
  return counts;
}

/// Returns leaderboard rows ordered by score descending.
Future<List<Map<String, dynamic>>> leaderboardRows(
  Session session,
  GameSession game, {
  int? limit,
}) async {
  final rows = await Player.db.find(
    session,
    where: (t) => t.gameSessionId.equals(game.id),
    orderBy: (t) => t.score.desc(),
    limit: limit,
  );

  return rows
      .map(
        (player) => <String, dynamic>{
          'id': player.id,
          'name': player.name,
          'score': player.score,
        },
      )
      .toList();
}

/// Builds the first event a client receives after connecting or reconnecting.
Future<GameEvent> buildStateSnapshot(
  Session session,
  GameSession game,
  RoomRuntime runtime, {
  required bool isHost,
  Player? player,
}) async {
  final visible = await visiblePlayers(session, game, runtime);
  final counts = await answerCounts(session, game);

  final data = <String, dynamic>{
    'role': isHost ? 'host' : 'player',
    'session': <String, dynamic>{
      'id': game.id,
      'pin': game.pin,
      'quizId': game.quizId,
      'hostId': game.hostId,
      'status': game.status,
      'currentQuestionIndex': game.currentQuestionIndex,
      'startTime': game.startTime?.toUtc().toIso8601String(),
    },
    'players': visible,
    'answerCounts': counts.map((key, value) => MapEntry(key.toString(), value)),
  };

  if (!isHost && player != null) {
    final answers = decodeAnswers(player.answersJson);
    data['you'] = <String, dynamic>{
      'id': player.id,
      'name': player.name,
      'score': player.score,
    };
    data['answeredIndexes'] = answers.keys
        .map(int.tryParse)
        .whereType<int>()
        .toList();
    data['submittedAnswerIndex'] =
        answers[game.currentQuestionIndex.toString()];
  }

  if (game.status == 'paused') {
    final question = await Question.db.findFirstRow(
      session,
      where: (t) =>
          t.quizId.equals(game.quizId) &
          t.orderIndex.equals(game.currentQuestionIndex),
    );
    data['correctOptionIndex'] = question?.correctOptionIndex;
    data['leaderboard'] = await leaderboardRows(session, game);
  } else if (game.status == 'finished') {
    final all = await leaderboardRows(session, game);
    data['podium'] = all.take(3).toList();
    data['allPlayers'] = all;
    data['leaderboard'] = all;
  }

  return gameEvent('STATE_SNAPSHOT', data);
}

/// Handles the socket for a player or host going away.
///
/// The [handle] guard makes sure a late `finally` from an old connection does
/// not detach the newer connection that already replaced it.
Future<void> handleConnectionClosed({
  required String pin,
  required bool isHost,
  required int? playerId,
  required ConnectionHandle handle,
}) async {
  if (handle.disconnectHandled) return;
  handle.disconnectHandled = true;

  final runtime = RoomRegistry.instance.existing(pin);
  if (runtime == null || runtime.ended) return;

  if (isHost) {
    if (runtime.host.handle != handle) return;
    runtime.host.handle = null;
    runtime.host.cancelTimer();
    runtime.host.graceTimer = _schedule(
      hostGracePeriod,
      () => _expireHost(pin),
    );
    return;
  }

  if (playerId == null) return;
  final presence = runtime.players[playerId];
  if (presence == null || presence.handle != handle) return;

  presence.handle = null;
  presence.connected = false;
  presence.cancelTimers();

  final session = await Serverpod.instance.createSession();
  try {
    final game = await findGame(session, pin);
    if (game == null || game.status == 'finished') return;

    presence.hideTimer = _schedule(hideDelay, () async {
      final timerSession = await Serverpod.instance.createSession();
      try {
        await broadcastVisiblePlayers(timerSession, game, runtime);
      } finally {
        await timerSession.close();
      }
    });

    if (game.status == 'lobby') {
      presence.graceTimer = _schedule(
        lobbyGracePeriod,
        () => _expireLobbyPlayer(pin, playerId, handle),
      );
    } else {
      presence.graceTimer = _schedule(
        questionGracePeriod,
        () => _markPlayerAway(pin, playerId, handle),
      );
    }
  } finally {
    await session.close();
  }
}

/// Removes a lobby player that did not reconnect within the grace period.
Future<void> _expireLobbyPlayer(
  String pin,
  int playerId,
  ConnectionHandle handle,
) async {
  final runtime = RoomRegistry.instance.existing(pin);
  if (runtime == null || runtime.ended) return;

  final presence = runtime.players[playerId];
  if (presence == null || presence.handle != null) return;

  final session = await Serverpod.instance.createSession();
  try {
    final game = await findGame(session, pin);
    if (game == null) {
      await RoomRegistry.instance.remove(pin);
      return;
    }
    if (game.status != 'lobby') return;

    final player = await Player.db.findById(session, playerId);
    if (player == null || player.gameSessionId != game.id) return;

    await Player.db.deleteRow(session, player);
    runtime.players.remove(playerId);

    await session.messages.postMessage(
      'game-$pin-host',
      gameEvent('PLAYER_LEFT', {
        'playerId': playerId,
        'name': player.name,
        'reason': 'disconnected',
      }),
    );
    await broadcastVisiblePlayers(session, game, runtime);
  } finally {
    await session.close();
  }
}

/// Marks a player as away after they miss the question grace period.
Future<void> _markPlayerAway(
  String pin,
  int playerId,
  ConnectionHandle handle,
) async {
  final runtime = RoomRegistry.instance.existing(pin);
  if (runtime == null || runtime.ended) return;

  final presence = runtime.players[playerId];
  if (presence == null || presence.handle != null) return;

  final session = await Serverpod.instance.createSession();
  try {
    final game = await findGame(session, pin);
    if (game == null || game.status == 'finished') return;

    final player = await Player.db.findById(session, playerId);
    if (player == null) return;

    player.status = 'away';
    await Player.db.updateRow(session, player);

    await session.messages.postMessage(
      'game-$pin-host',
      gameEvent('PLAYER_AWAY', {
        'playerId': playerId,
        'name': player.name,
      }),
    );
    await broadcastVisiblePlayers(session, game, runtime);
  } finally {
    await session.close();
  }
}

/// Closes the room if the host does not reconnect in time.
Future<void> _expireHost(String pin) async {
  final runtime = RoomRegistry.instance.existing(pin);
  if (runtime == null || runtime.ended) return;
  if (runtime.host.handle != null) return;

  await endRoom(pin, reason: 'HOST_DISCONNECTED');
}

/// Finishes the room, notifies every client and removes durable player rows.
Future<void> endRoom(String pin, {required String reason}) async {
  final runtime = RoomRegistry.instance.existing(pin);
  if (runtime == null || runtime.ended) return;

  runtime.ended = true;
  runtime.cancelTimers();

  final session = await Serverpod.instance.createSession();
  try {
    final game = await findGame(session, pin);
    if (game != null) {
      game.status = 'finished';
      await GameSession.db.updateRow(session, game);

      final event = gameEvent('ROOM_ENDED', {'reason': reason});
      await session.messages.postMessage('game-$pin', event);
      await session.messages.postMessage('game-$pin-host', event);

      for (final presence in runtime.players.values) {
        await presence.handle?.close();
      }
      await runtime.host.handle?.close();

      await Player.db.deleteWhere(
        session,
        where: (t) => t.gameSessionId.equals(game.id),
      );
    }
  } finally {
    await RoomRegistry.instance.remove(pin);
    await session.close();
  }
}

/// Schedules the room to be torn down after it has been idle.
void scheduleRoomCleanup(String pin) {
  final runtime = RoomRegistry.instance.existing(pin);
  if (runtime == null) return;

  runtime.cleanupTimer?.cancel();
  runtime.cleanupTimer = Timer(
    const Duration(minutes: 5),
    () => unawaited(endRoom(pin, reason: 'ROOM_TIMEOUT')),
  );
}

Timer _schedule(Duration duration, Future<void> Function() action) {
  return Timer(duration, () {
    action().catchError((Object error, StackTrace stackTrace) {
      // Timers are best effort. A failed DB write must not crash the server.
    });
  });
}
