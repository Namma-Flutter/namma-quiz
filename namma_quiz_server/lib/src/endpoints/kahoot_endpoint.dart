import 'package:serverpod/serverpod.dart';
import 'dart:math';
import '../generated/protocol.dart';

class KahootEndpoint extends Endpoint {
  /// In-memory cache to ensure each player can only submit ONE answer per question:
  /// "$pin-$questionIndex" -> Set of playerIds
  static final Map<String, Set<int>> _submittedAnswers = {};
  
  /// Create a new Game Session from a Quiz and return the PIN
  Future<GameSession> createGame(Session session, int quizId, int hostId) async {
    var rng = Random();
    var pin = (rng.nextInt(900000) + 100000).toString();

    var game = GameSession(
      pin: pin,
      quizId: quizId,
      hostId: hostId,
      status: 'lobby',
      currentQuestionIndex: 0,
    );

    game = await GameSession.db.insertRow(session, game);
    return game;
  }

  /// Get Game Info by PIN
  Future<GameSession?> getGameByPin(Session session, String pin) async {
    return await GameSession.db.findFirstRow(
      session,
      where: (t) => t.pin.equals(pin),
    );
  }

  /// Players and Host call this stream to receive real-time updates
  Stream<GameEvent> gameStream(Session session, String pin, bool isHost) async* {
    var channel = isHost ? 'game-$pin-host' : 'game-$pin';
    yield* session.messages.createStream<GameEvent>(channel);
  }

  /// Send an event manually over the channel
  Future<void> sendEvent(Session session, String pin, GameEvent event, bool toHostOnly) async {
    if (toHostOnly) {
      await session.messages.postMessage('game-$pin-host', event);
    } else {
      await session.messages.postMessage('game-$pin', event);
      await session.messages.postMessage('game-$pin-host', event);
    }
  }

  /// Join a game
  Future<Player?> joinGame(Session session, String pin, String username) async {
    var game = await getGameByPin(session, pin);
    if (game == null || game.status != 'lobby') return null;

    var player = Player(
      gameSessionId: game.id!,
      name: username,
      score: 0,
    );

    player = await Player.db.insertRow(session, player);

    // Notify ONLY the host that a player joined
    await session.messages.postMessage('game-$pin-host', GameEvent(
      eventType: 'PLAYER_JOINED',
      dataJson: '{"playerId": ${player.id}, "name": "$username"}',
    ));

    return player;
  }

  /// Host starts the first question
  Future<void> startQuestion(Session session, String pin) async {
    var game = await getGameByPin(session, pin);
    if (game != null) {
      game.status = 'active';
      game.startTime = DateTime.now();
      await GameSession.db.updateRow(session, game);

      final event = GameEvent(
        eventType: 'QUESTION_STARTED',
        dataJson: '{"questionIndex": ${game.currentQuestionIndex}}',
      );
      
      // Notify both host and players
      await session.messages.postMessage('game-$pin', event);
      await session.messages.postMessage('game-$pin-host', event);
    }
  }

  /// Host transitions to the next question
  Future<GameSession?> nextQuestion(Session session, String pin) async {
    var game = await getGameByPin(session, pin);
    if (game == null) return null;

    game.currentQuestionIndex += 1;
    game.status = 'active';
    game.startTime = DateTime.now();
    
    await GameSession.db.updateRow(session, game);

    final event = GameEvent(
      eventType: 'QUESTION_STARTED',
      dataJson: '{"questionIndex": ${game.currentQuestionIndex}}',
    );

    // Notify both host and players
    await session.messages.postMessage('game-$pin', event);
    await session.messages.postMessage('game-$pin-host', event);

    return game;
  }

  /// Player submits an answer, returning points earned (or 0 if duplicate/invalid)
  Future<int> submitAnswer(Session session, String pin, int playerId, int optionIndex) async {
    var game = await getGameByPin(session, pin);
    if (game == null || game.status != 'active' || game.startTime == null) return 0;

    // Prevent multiple submissions: check if this player already answered this question
    final questionKey = '$pin-${game.currentQuestionIndex}';
    final answeredPlayers = _submittedAnswers.putIfAbsent(questionKey, () => <int>{});
    if (answeredPlayers.contains(playerId)) {
      return 0; // Already submitted! Reject duplicate.
    }
    answeredPlayers.add(playerId);

    var question = await Question.db.findFirstRow(
      session,
      where: (t) => t.quizId.equals(game.quizId) & t.orderIndex.equals(game.currentQuestionIndex),
    );

    if (question == null) return 0;

    int points = 0;
    if (question.correctOptionIndex == optionIndex) {
       final timeTaken = DateTime.now().difference(game.startTime!).inSeconds;
       final timeLimit = question.timeLimitSeconds;
       if (timeTaken <= timeLimit) {
           // Fast answer gives more points (Kahoot-like scaling)
           points = (1000 * (1 - (timeTaken / (timeLimit * 2.0)))).round();
           if (points < 500) points = 500; // Base points for correct answer
       } else {
           points = 500; // Correct but slow
       }
    }

    if (points > 0) {
        var player = await Player.db.findById(session, playerId);
        if (player != null) {
            player.score += points;
            await Player.db.updateRow(session, player);
        }
    }

    // Send answer received to the host for real-time charts
    await session.messages.postMessage('game-$pin-host', GameEvent(
      eventType: 'ANSWER_RECEIVED',
      dataJson: '{"playerId": $playerId, "optionIndex": $optionIndex, "points": $points}',
    ));

    return points;
  }

  /// Check if a player has already submitted an answer for a question
  Future<bool> hasAnsweredQuestion(Session session, String pin, int playerId, int questionIndex) async {
    final questionKey = '$pin-$questionIndex';
    return _submittedAnswers[questionKey]?.contains(playerId) ?? false;
  }

  /// Reconnect an existing player across page refresh or tab reconnection
  Future<Player?> reconnectPlayer(Session session, String pin, int playerId) async {
    var game = await getGameByPin(session, pin);
    if (game == null || game.status == 'finished') return null;

    var player = await Player.db.findById(session, playerId);
    if (player == null || player.gameSessionId != game.id) return null;

    return player;
  }

  /// Get current player details (including updated score)
  Future<Player?> getPlayer(Session session, int playerId) async {
    return await Player.db.findById(session, playerId);
  }

  /// Get all players currently registered for a game session
  Future<List<Player>> getPlayers(Session session, String pin) async {
    var game = await getGameByPin(session, pin);
    if (game == null) return [];

    return await Player.db.find(
      session,
      where: (t) => t.gameSessionId.equals(game.id),
      orderBy: (t) => t.id,
    );
  }

  /// Player leaves the game (e.g. clicked Leave or closed browser)
  Future<bool> leaveGame(Session session, String pin, int playerId) async {
    var game = await getGameByPin(session, pin);
    if (game == null) return false;

    var player = await Player.db.findById(session, playerId);
    if (player != null && player.gameSessionId == game.id) {
      await Player.db.deleteRow(session, player);

      await session.messages.postMessage('game-$pin-host', GameEvent(
        eventType: 'PLAYER_LEFT',
        dataJson: '{"playerId": $playerId, "name": "${player.name}"}',
      ));
      return true;
    }
    return false;
  }

  /// Host removes or kicks a player from the lobby / game
  Future<bool> removePlayer(Session session, String pin, int playerId) async {
    var game = await getGameByPin(session, pin);
    if (game == null) return false;

    var player = await Player.db.findById(session, playerId);
    if (player != null && player.gameSessionId == game.id) {
      await Player.db.deleteRow(session, player);

      // Notify player they were removed
      await session.messages.postMessage('game-$pin', GameEvent(
        eventType: 'PLAYER_REMOVED',
        dataJson: '{"playerId": $playerId}',
      ));

      // Notify host to update player list
      await session.messages.postMessage('game-$pin-host', GameEvent(
        eventType: 'PLAYER_LEFT',
        dataJson: '{"playerId": $playerId, "name": "${player.name}"}',
      ));
      return true;
    }
    return false;
  }

  /// Host ends the question, locking responses and revealing the answer
  Future<void> endQuestion(Session session, String pin) async {
    var game = await getGameByPin(session, pin);
    if (game == null || game.status != 'active') return;

    game.status = 'paused';
    await GameSession.db.updateRow(session, game);

    var question = await Question.db.findFirstRow(
      session,
      where: (t) => t.quizId.equals(game.quizId) & t.orderIndex.equals(game.currentQuestionIndex),
    );

    final correctIndex = question?.correctOptionIndex ?? 0;

    // Get current leaderboard standings ordered by score descending
    var allPlayers = await Player.db.find(
      session,
      where: (t) => t.gameSessionId.equals(game.id),
      orderBy: (t) => t.score.desc(),
    );
    var leaderboardList = allPlayers
        .map((p) => '{"id": ${p.id}, "name": "${p.name}", "score": ${p.score}}')
        .toList();

    final event = GameEvent(
      eventType: 'QUESTION_ENDED',
      dataJson: '{"questionIndex": ${game.currentQuestionIndex}, "correctOptionIndex": $correctIndex, "leaderboard": $leaderboardList}',
    );

    // Notify both host and players
    await session.messages.postMessage('game-$pin', event);
    await session.messages.postMessage('game-$pin-host', event);
  }

  /// Host shows leaderboard
  Future<void> showLeaderboard(Session session, String pin) async {
    var game = await getGameByPin(session, pin);
    if (game == null) return;

    // Get top 10 players
    var topPlayers = await Player.db.find(
      session,
      where: (t) => t.gameSessionId.equals(game.id),
      orderBy: (t) => t.score.desc(),
      limit: 10,
    );
    
    var leaderboardList = topPlayers.map((p) => '{"id": ${p.id}, "name": "${p.name}", "score": ${p.score}}').toList();
    var dataJson = '{"topPlayers": $leaderboardList}';

    final event = GameEvent(
      eventType: 'SHOW_LEADERBOARD',
      dataJson: dataJson,
    );

    await session.messages.postMessage('game-$pin', event);
    await session.messages.postMessage('game-$pin-host', event);
  }

  /// Host finishes the game and reveals the podium (top 3) and full ranks for all players
  Future<void> finishGame(Session session, String pin) async {
    var game = await getGameByPin(session, pin);
    if (game == null) return;

    game.status = 'finished';
    await GameSession.db.updateRow(session, game);

    // Get all players for this game ordered by score descending
    var allPlayers = await Player.db.find(
      session,
      where: (t) => t.gameSessionId.equals(game.id),
      orderBy: (t) => t.score.desc(),
    );

    var podiumPlayers = allPlayers.take(3).toList();
    var podiumList = podiumPlayers.map((p) => '{"id": ${p.id}, "name": "${p.name}", "score": ${p.score}}').toList();
    var allList = allPlayers.map((p) => '{"id": ${p.id}, "name": "${p.name}", "score": ${p.score}}').toList();

    var dataJson = '{"topPlayers": $podiumList, "allPlayers": $allList}';

    final event = GameEvent(
      eventType: 'GAME_FINISHED',
      dataJson: dataJson,
    );

    // Clean up submitted answers cache for this pin
    _submittedAnswers.removeWhere((key, _) => key.startsWith('$pin-'));

    await session.messages.postMessage('game-$pin', event);
    await session.messages.postMessage('game-$pin-host', event);
  }
}
