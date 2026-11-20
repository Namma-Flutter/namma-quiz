import 'dart:async';
import 'dart:convert';
import 'package:flutter_riverpod/legacy.dart';
import 'package:namma_kahoot_client/namma_kahoot_client.dart';
import '../../../main.dart';

class GameState {
  final GameSession? session;
  final Player? currentPlayer;
  final List<Player> players;
  final List<Question> questions;
  final GameEvent? lastEvent;
  final bool isConnected;
  final String? notice;
  final Map<int, int> answerCounts; // optionIndex -> count
  final int? submittedAnswerIndex; // answer chosen by this player
  final int? earnedPoints; // points awarded for current question
  final int? correctOptionIndex; // revealed correct answer
  final List<dynamic> leaderboard; // top players list
  final List<dynamic> podium; // top 3 players list
  final List<dynamic> allPlayers;

  GameState({
    this.session,
    this.currentPlayer,
    this.players = const [],
    this.questions = const [],
    this.lastEvent,
    this.isConnected = false,
    this.notice,
    this.answerCounts = const {},
    this.submittedAnswerIndex,
    this.earnedPoints,
    this.correctOptionIndex,
    this.leaderboard = const [],
    this.podium = const [],
    this.allPlayers = const [],
  });

  GameState copyWith({
    GameSession? session,
    Player? currentPlayer,
    List<Player>? players,
    List<Question>? questions,
    GameEvent? lastEvent,
    bool? isConnected,
    Object? notice = const Object(),
    Map<int, int>? answerCounts,
    Object? submittedAnswerIndex = const Object(),
    Object? earnedPoints = const Object(),
    Object? correctOptionIndex = const Object(),
    List<dynamic>? leaderboard,
    List<dynamic>? podium,
    List<dynamic>? allPlayers,
  }) {
    return GameState(
      session: session ?? this.session,
      currentPlayer: currentPlayer ?? this.currentPlayer,
      players: players ?? this.players,
      questions: questions ?? this.questions,
      lastEvent: lastEvent ?? this.lastEvent,
      isConnected: isConnected ?? this.isConnected,
      notice: notice == const Object() ? this.notice : (notice as String?),
      answerCounts: answerCounts ?? this.answerCounts,
      submittedAnswerIndex: submittedAnswerIndex == const Object()
          ? this.submittedAnswerIndex
          : (submittedAnswerIndex as int?),
      earnedPoints: earnedPoints == const Object()
          ? this.earnedPoints
          : (earnedPoints as int?),
      correctOptionIndex: correctOptionIndex == const Object()
          ? this.correctOptionIndex
          : (correctOptionIndex as int?),
      leaderboard: leaderboard ?? this.leaderboard,
      podium: podium ?? this.podium,
      allPlayers: allPlayers ?? this.allPlayers,
    );
  }
}

class GameNotifier extends StateNotifier<GameState> {
  StreamSubscription? _subscription;
  String? _playerToken;
  String? _hostToken;
  bool _isSubmittingAnswer = false;

  String? _activePin;
  bool? _activeIsHost;
  String? _activeToken;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  bool _intentionalClose = false;

  GameNotifier() : super(GameState());

  /// Reset game state
  void reset({String? notice}) {
    _intentionalClose = true;
    _reconnectTimer?.cancel();
    _subscription?.cancel();
    _playerToken = null;
    _hostToken = null;
    _activePin = null;
    _activeIsHost = null;
    _activeToken = null;
    _reconnectAttempts = 0;
    state = GameState(notice: notice);
  }

  /// Player joins game
  Future<bool> joinGame(String pin, String username) async {
    try {
      await client.openStreamingConnection();
      
      final result = await client.kahoot.joinGame(pin, username);
      if (result != null) {
        final session = await client.kahoot.getGameByPin(pin);
        if (session != null) {
          final player = Player(
            id: result.playerId,
            gameSessionId: result.gameSessionId,
            name: result.name,
            score: result.score,
          );
          _playerToken = result.token;
          state = state.copyWith(
            currentPlayer: player,
            session: session,
            isConnected: true,
          );
          _subscribeToGame(pin, isHost: false, token: result.token);
          return true;
        }
      }
    } catch (e) {
      // Print or log error
    }
    return false;
  }

  /// Host starts a game
  Future<void> hostGame(int quizId) async {
    try {
      await client.openStreamingConnection();

      final hostSession = await client.kahoot.createGame(quizId, 1);
      final questions = await client.admin.getQuestionsForQuiz(quizId);
      final existingPlayers = await client.kahoot.getPlayers(hostSession.pin);
      
      final session = GameSession(
        id: null,
        pin: hostSession.pin,
        quizId: hostSession.quizId,
        hostId: hostSession.hostId,
        status: hostSession.status,
        currentQuestionIndex: hostSession.currentQuestionIndex,
        startTime: hostSession.startTime,
      );

      _hostToken = hostSession.hostToken;
      state = state.copyWith(
        session: session,
        questions: questions,
        players: existingPlayers,
        isConnected: true,
      );
      
      _subscribeToGame(hostSession.pin, isHost: true, token: hostSession.hostToken);
    } catch (e) {
      // Handle error
    }
  }

  void _subscribeToGame(String pin, {required bool isHost, required String token}) {
    _activePin = pin;
    _activeIsHost = isHost;
    _activeToken = token;
    _intentionalClose = false;
    _reconnectTimer?.cancel();

    _subscription?.cancel();
    _subscription = client.kahoot.gameStream(pin, isHost, token).listen(
      _handleEvent,
      onError: (Object error) {
        _handleStreamClosed();
      },
      onDone: () {
        _handleStreamClosed();
      },
    );
  }

  void _handleStreamClosed() {
    if (_intentionalClose || _activeToken == null || state.session == null) {
      return;
    }
    if (state.session?.status == 'finished') {
      return;
    }
    _reconnectTimer?.cancel();
    final delayMs = (_reconnectAttempts < 5) ? (1000 * (1 << _reconnectAttempts)) : 10000;
    _reconnectAttempts++;
    _reconnectTimer = Timer(Duration(milliseconds: delayMs), () {
      if (_intentionalClose || _activeToken == null || state.session == null) {
        return;
      }
      final pin = _activePin;
      final isHost = _activeIsHost;
      final token = _activeToken;
      if (pin != null && isHost != null && token != null) {
        _subscribeToGame(pin, isHost: isHost, token: token);
      }
    });
  }

  Player _playerFromJson(Map<String, dynamic> json, int? sessionId) {
    return Player(
      id: json['id'] as int?,
      gameSessionId: sessionId ?? 0,
      name: json['name'] as String? ?? 'Player',
      score: (json['score'] as num?)?.toInt() ?? 0,
    );
  }

  void _handleEvent(GameEvent event) {
    if (event.eventType == 'HEARTBEAT') {
      return;
    }

    _reconnectAttempts = 0;

    var updatedState = state.copyWith(lastEvent: event);

    if (event.eventType == 'STATE_SNAPSHOT') {
      final data = jsonDecode(event.dataJson) as Map<String, dynamic>;
      final sessionJson = data['session'] as Map<String, dynamic>;
      final session = GameSession(
        id: sessionJson['id'] as int?,
        pin: sessionJson['pin'] as String,
        quizId: sessionJson['quizId'] as int,
        hostId: sessionJson['hostId'] as int,
        status: sessionJson['status'] as String,
        currentQuestionIndex: sessionJson['currentQuestionIndex'] as int,
        startTime: sessionJson['startTime'] == null
            ? null
            : DateTime.tryParse(sessionJson['startTime'] as String),
      );

      final players = (data['players'] as List<dynamic>? ?? [])
          .map((e) => _playerFromJson(e as Map<String, dynamic>, session.id))
          .toList();

      final counts = <int, int>{};
      final rawCounts = data['answerCounts'] as Map<String, dynamic>? ?? {};
      rawCounts.forEach((key, value) {
        final index = int.tryParse(key);
        if (index != null) counts[index] = (value as num).toInt();
      });

      final me = data['you'] == null
          ? state.currentPlayer
          : _playerFromJson(data['you'] as Map<String, dynamic>, session.id);

      state = GameState(
        session: session,
        currentPlayer: me,
        players: players,
        questions: state.questions,
        lastEvent: state.lastEvent,
        isConnected: true,
        answerCounts: counts,
        submittedAnswerIndex: data['submittedAnswerIndex'] as int?,
        correctOptionIndex: data['correctOptionIndex'] as int?,
        leaderboard: data['leaderboard'] as List<dynamic>? ?? state.leaderboard,
        podium: data['podium'] as List<dynamic>? ?? state.podium,
        allPlayers: data['allPlayers'] as List<dynamic>? ?? state.allPlayers,
      );
      return;
    }

    if (event.eventType == 'VISIBLE_PLAYERS_SNAPSHOT') {
      final data = jsonDecode(event.dataJson) as Map<String, dynamic>;
      final players = (data['players'] as List<dynamic>? ?? [])
          .map((e) => _playerFromJson(e as Map<String, dynamic>, state.session?.id))
          .toList();
      state = updatedState.copyWith(players: players);
      return;
    }

    if (event.eventType == 'KICKED') {
      reset(notice: 'You were removed from the room by the host.');
      return;
    }

    if (event.eventType == 'REPLACED') {
      reset(notice: 'This session was opened in another tab. Please rejoin.');
      return;
    }

    if (event.eventType == 'ROOM_ENDED') {
      reset(notice: 'The room has ended.');
      return;
    }

    if (event.eventType == 'PLAYER_JOINED') {
      final data = jsonDecode(event.dataJson);
      final newPlayer = _playerFromJson(
        Map<String, dynamic>.from(data as Map),
        state.session?.id,
      );
      final filtered = state.players.where((p) => p.id != newPlayer.id).toList();
      state = updatedState.copyWith(players: [...filtered, newPlayer]);
    } else if (event.eventType == 'PLAYER_LEFT') {
      final data = jsonDecode(event.dataJson);
      final leftPlayerId = data['playerId'] as int;
      state = updatedState.copyWith(
        players: state.players.where((p) => p.id != leftPlayerId).toList(),
      );
    } else if (event.eventType == 'QUESTION_STARTED') {
      _isSubmittingAnswer = false;
      final data = jsonDecode(event.dataJson);
      final newIndex = data['questionIndex'] as int;
      
      if (state.session != null) {
        state.session!.currentQuestionIndex = newIndex;
        state.session!.status = 'active';
      }
      
      state = state.copyWith(
        lastEvent: event,
        answerCounts: {},
        submittedAnswerIndex: null,
        earnedPoints: null,
        correctOptionIndex: null,
      );
    } else if (event.eventType == 'ANSWER_RECEIVED') {
      final data = jsonDecode(event.dataJson);
      final optionIndex = data['optionIndex'] as int;
      final currentCounts = Map<int, int>.from(state.answerCounts);
      currentCounts[optionIndex] = (currentCounts[optionIndex] ?? 0) + 1;
      
      state = updatedState.copyWith(answerCounts: currentCounts);
    } else if (event.eventType == 'QUESTION_ENDED') {
      final data = jsonDecode(event.dataJson);
      final correctOptionIndex = data['correctOptionIndex'] as int;
      
      if (state.session != null) {
        state.session!.status = 'paused';
      }

      state = updatedState.copyWith(
        correctOptionIndex: correctOptionIndex,
      );
      
      if (state.currentPlayer != null) {
        _syncPlayerScore();
      }
    } else if (event.eventType == 'SHOW_LEADERBOARD') {
      final data = jsonDecode(event.dataJson);
      final topPlayers = data['topPlayers'] as List<dynamic>;
      if (state.session != null) {
        state.session!.status = 'paused';
      }
      state = updatedState.copyWith(leaderboard: topPlayers);
    } else if (event.eventType == 'GAME_FINISHED') {
      final data = jsonDecode(event.dataJson);
      final topPlayers = data['topPlayers'] as List<dynamic>? ?? [];
      final allList = data['allPlayers'] as List<dynamic>? ?? topPlayers;
      if (state.session != null) {
        state.session!.status = 'finished';
      }
      state = updatedState.copyWith(
        podium: topPlayers,
        allPlayers: allList,
      );
    } else {
      state = updatedState;
    }
  }

  /// Player submits an answer
  Future<void> submitAnswer(int optionIndex) async {
    if (state.session == null || state.currentPlayer == null) return;
    if (state.submittedAnswerIndex != null || _isSubmittingAnswer) return;

    final token = _playerToken;
    if (token == null) return;

    _isSubmittingAnswer = true;
    state = state.copyWith(submittedAnswerIndex: optionIndex);

    final pin = state.session!.pin;
    try {
      final points = await client.kahoot.submitAnswer(pin, token, optionIndex);
      state = state.copyWith(earnedPoints: points);
    } catch (e) {
      // Handle error
    } finally {
      _isSubmittingAnswer = false;
    }
  }

  /// Sync player score from server database
  Future<void> _syncPlayerScore() async {
    if (state.currentPlayer == null) return;
    try {
      final refreshed = await client.kahoot.getPlayer(state.currentPlayer!.id!);
      if (refreshed != null) {
        state = state.copyWith(currentPlayer: refreshed);
      }
    } catch (e) {
      // Handle error
    }
  }

  /// Host triggers first question
  Future<void> startQuestion() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    await client.kahoot.startQuestion(session.pin, hostToken);
  }

  /// Host triggers next question
  Future<void> nextQuestion() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    final updatedSession = await client.kahoot.nextQuestion(session.pin, hostToken);
    if (updatedSession != null) {
      state = state.copyWith(session: updatedSession);
    }
  }

  /// Host ends current question
  Future<void> endQuestion() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    await client.kahoot.endQuestion(session.pin, hostToken);
  }

  /// Host displays leaderboard
  Future<void> showLeaderboard() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    await client.kahoot.showLeaderboard(session.pin, hostToken);
  }

  /// Host finishes the game
  Future<void> finishGame() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    await client.kahoot.finishGame(session.pin, hostToken);
  }

  /// Player leaves the game
  Future<void> leaveGame() async {
    final pin = state.session?.pin;
    final token = _playerToken;
    if (pin != null && token != null) {
      try {
        await client.kahoot.leaveGame(pin, token);
      } catch (e) {
        // Handle error
      }
    }
    reset();
  }

  /// Host kicks a player
  Future<void> kickPlayer(int playerId) async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    try {
      await client.kahoot.kickPlayer(session.pin, hostToken, playerId);
      state = state.copyWith(
        players: state.players.where((p) => p.id != playerId).toList(),
      );
    } catch (e) {
      // Handle error
    }
  }

  /// Alias for kickPlayer
  Future<void> removePlayer(int playerId) => kickPlayer(playerId);

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

final gameProvider = StateNotifierProvider<GameNotifier, GameState>((ref) {
  return GameNotifier();
});
