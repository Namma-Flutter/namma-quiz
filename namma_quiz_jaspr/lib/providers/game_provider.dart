import 'dart:async';
import 'dart:convert';

import 'package:jaspr/jaspr.dart' hide client;
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:namma_kahoot_client/namma_kahoot_client.dart';
import 'package:universal_web/web.dart' as web;

import 'client_provider.dart';

class GameState {
  final GameSession? session;
  final Player? currentPlayer;
  final List<Player> players;
  final List<Question> questions;
  final GameEvent? lastEvent;
  final bool isConnected;
  final bool isRestoring;
  final String? notice;
  final Map<int, int> answerCounts;
  final int? submittedAnswerIndex;
  final int? earnedPoints;
  final int? correctOptionIndex;
  final List<dynamic> leaderboard;
  final List<dynamic> podium;
  final List<dynamic> allPlayers;

  GameState({
    this.session,
    this.currentPlayer,
    this.players = const [],
    this.questions = const [],
    this.lastEvent,
    this.isConnected = false,
    this.isRestoring = false,
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
    bool? isRestoring,
    Object? notice = const _Sentinel(),
    Map<int, int>? answerCounts,
    Object? submittedAnswerIndex = const _Sentinel(),
    Object? earnedPoints = const _Sentinel(),
    Object? correctOptionIndex = const _Sentinel(),
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
      isRestoring: isRestoring ?? this.isRestoring,
      notice: notice is _Sentinel ? this.notice : (notice as String?),
      answerCounts: answerCounts ?? this.answerCounts,
      submittedAnswerIndex: submittedAnswerIndex is _Sentinel
          ? this.submittedAnswerIndex
          : (submittedAnswerIndex as int?),
      earnedPoints: earnedPoints is _Sentinel
          ? this.earnedPoints
          : (earnedPoints as int?),
      correctOptionIndex: correctOptionIndex is _Sentinel
          ? this.correctOptionIndex
          : (correctOptionIndex as int?),
      leaderboard: leaderboard ?? this.leaderboard,
      podium: podium ?? this.podium,
      allPlayers: allPlayers ?? this.allPlayers,
    );
  }
}

class _Sentinel {
  const _Sentinel();
}

class GameNotifier extends Notifier<GameState> {
  StreamSubscription? _subscription;
  bool _isSubmittingAnswer = false;
  String? _playerToken;
  String? _hostToken;

  String? _activePin;
  bool? _activeIsHost;
  String? _activeToken;
  Timer? _reconnectTimer;
  int _reconnectAttempts = 0;
  bool _intentionalClose = false;

  @override
  GameState build() => GameState();

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

  void _savePlayerSession(String pin, String token, String username) {
    if (kIsWeb) {
      try {
        web.window.sessionStorage.setItem('nq_pin', pin);
        web.window.sessionStorage.setItem('nq_token', token);
        web.window.sessionStorage.setItem('nq_user', username);
        web.window.sessionStorage.setItem('nq_role', 'player');
        web.window.sessionStorage.removeItem('nq_host_token');
      } catch (_) {}
    }
  }

  void _saveHostSession(String pin, String hostToken) {
    if (kIsWeb) {
      try {
        web.window.sessionStorage.setItem('nq_pin', pin);
        web.window.sessionStorage.setItem('nq_host_token', hostToken);
        web.window.sessionStorage.setItem('nq_role', 'host');
        web.window.sessionStorage.removeItem('nq_token');
        web.window.sessionStorage.removeItem('nq_user');
      } catch (_) {}
    }
  }

  void _clearSession() {
    _intentionalClose = true;
    _reconnectTimer?.cancel();
    _activePin = null;
    _activeIsHost = null;
    _activeToken = null;
    _reconnectAttempts = 0;
    if (kIsWeb) {
      try {
        web.window.sessionStorage.removeItem('nq_pin');
        web.window.sessionStorage.removeItem('nq_token');
        web.window.sessionStorage.removeItem('nq_user');
        web.window.sessionStorage.removeItem('nq_host_token');
        web.window.sessionStorage.removeItem('nq_role');
      } catch (_) {}
    }
    _playerToken = null;
    _hostToken = null;
  }

  Future<bool> tryRestoreSession() async {
    if (!kIsWeb) return false;

    state = state.copyWith(isRestoring: true);
    try {
      final pin = web.window.sessionStorage.getItem('nq_pin');
      final role = web.window.sessionStorage.getItem('nq_role');
      if (pin == null || role == null) {
        state = state.copyWith(isRestoring: false);
        return false;
      }

      if (role == 'host') {
        final hostToken = web.window.sessionStorage.getItem('nq_host_token');
        if (hostToken == null) {
          _clearSession();
          state = state.copyWith(isRestoring: false);
          return false;
        }

        final session = await client.kahoot.getGameByPin(pin);
        if (session == null || session.status == 'finished') {
          _clearSession();
          state = state.copyWith(isRestoring: false);
          return false;
        }

        final questions = await client.admin.getQuestionsForQuiz(session.quizId);
        _hostToken = hostToken;
        state = GameState(
          session: session,
          questions: questions,
          isConnected: true,
        );
        _subscribeToGame(pin, isHost: true, token: hostToken);
        return true;
      }

      final token = web.window.sessionStorage.getItem('nq_token');
      if (token == null) {
        _clearSession();
        state = state.copyWith(isRestoring: false);
        return false;
      }

      final player = await client.kahoot.resumePlayer(pin, token);
      if (player == null) {
        _clearSession();
        state = state.copyWith(isRestoring: false);
        return false;
      }

      final session = await client.kahoot.getGameByPin(pin);
      if (session == null || session.status == 'finished') {
        _clearSession();
        state = state.copyWith(isRestoring: false);
        return false;
      }

      final questions = await client.admin.getQuestionsForQuiz(session.quizId);
      final hasAnswered = await client.kahoot.hasAnsweredQuestion(
        pin,
        token,
        session.currentQuestionIndex,
      );

      _playerToken = token;
      state = GameState(
        currentPlayer: player,
        session: session,
        questions: questions,
        isConnected: true,
        submittedAnswerIndex: hasAnswered ? -1 : null,
      );
      _subscribeToGame(pin, isHost: false, token: token);
      return true;
    } catch (e) {
      print('Error restoring session: $e');
      _clearSession();
      state = state.copyWith(isRestoring: false);
      return false;
    }
  }

  Future<String?> joinGame(String pin, String username) async {
    try {
      final session = await client.kahoot.getGameByPin(pin);
      if (session == null) {
        return 'Game PIN not found. Make sure the host has started the lobby.';
      }
      if (session.status != 'lobby') {
        return 'This game has already ${session.status == "finished" ? "finished" : "started"}. You cannot join now.';
      }

      final result = await client.kahoot.joinGame(pin, username);
      if (result == null) {
        return 'Could not join game session. Please check PIN and try again.';
      }

      final player = Player(
        id: result.playerId,
        gameSessionId: result.gameSessionId,
        name: result.name,
        score: result.score,
      );
      final questions = await client.admin.getQuestionsForQuiz(session.quizId);

      _playerToken = result.token;
      _savePlayerSession(pin, result.token, username);
      state = GameState(
        currentPlayer: player,
        session: session,
        questions: questions,
        isConnected: true,
      );
      _subscribeToGame(pin, isHost: false, token: result.token);
      return null;
    } catch (e) {
      print('Error joining game: $e');
      return 'Connection error: $e';
    }
  }

  Future<void> leaveGame() async {
    final pin = state.session?.pin;
    final token = _playerToken;
    if (pin != null && token != null) {
      try {
        await client.kahoot.leaveGame(pin, token);
      } catch (e) {
        print('Error leaving game: $e');
      }
    }
    _clearSession();
    reset();
  }

  Future<void> removePlayer(int playerId) async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;

    try {
      await client.kahoot.kickPlayer(session.pin, hostToken, playerId);
      state = state.copyWith(
        players: state.players.where((p) => p.id != playerId).toList(),
      );
    } catch (e) {
      print('Error removing player: $e');
    }
  }

  Future<void> hostGame(int quizId) async {
    try {
      final hostSession = await client.kahoot.createGame(quizId, 1);
      final session = GameSession(
        id: null,
        pin: hostSession.pin,
        quizId: hostSession.quizId,
        hostId: hostSession.hostId,
        status: hostSession.status,
        currentQuestionIndex: hostSession.currentQuestionIndex,
        startTime: hostSession.startTime,
      );
      final questions = await client.admin.getQuestionsForQuiz(quizId);
      final existingPlayers = await client.kahoot.getPlayers(hostSession.pin);

      _hostToken = hostSession.hostToken;
      _saveHostSession(hostSession.pin, hostSession.hostToken);
      state = GameState(
        session: session,
        questions: questions,
        players: existingPlayers,
        isConnected: true,
      );
      _subscribeToGame(hostSession.pin, isHost: true, token: hostSession.hostToken);
    } catch (e) {
      print('Error starting game: $e');
    }
  }

  void _subscribeToGame(
    String pin, {
    required bool isHost,
    required String token,
  }) {
    _activePin = pin;
    _activeIsHost = isHost;
    _activeToken = token;
    _intentionalClose = false;
    _reconnectTimer?.cancel();

    _subscription?.cancel();
    _subscription = client.kahoot.gameStream(pin, isHost, token).listen(
      _handleEvent,
      onError: (Object error) {
        print('Game stream error: $error');
        _handleStreamClosed();
      },
      onDone: () {
        print('Game stream closed');
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
    print('Attempting stream reconnect in ${delayMs}ms (attempt $_reconnectAttempts)...');
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
      // Periodic server keepalive: prevents proxy/client idle timeouts while idle.
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
      _clearSession();
      state = GameState(notice: 'You were removed from the room by the host.');
      return;
    }

    if (event.eventType == 'REPLACED') {
      _clearSession();
      state = GameState(
        notice: 'This session was opened in another tab. Please rejoin.',
      );
      return;
    }

    if (event.eventType == 'ROOM_ENDED') {
      _clearSession();
      state = GameState(notice: 'The room has ended.');
      return;
    }

    if (event.eventType == 'RESUME_REJECTED') {
      _clearSession();
      state = GameState(
        notice: 'Your previous session is no longer valid. Please join again.',
      );
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
      final correctIdx = data['correctOptionIndex'] as int;
      final lb = data['leaderboard'] as List<dynamic>?;
      if (state.session != null) {
        state.session!.status = 'paused';
      }
      state = updatedState.copyWith(
        correctOptionIndex: correctIdx,
        leaderboard: lb ?? state.leaderboard,
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

  Future<void> submitAnswer(int optionIndex) async {
    if (state.session == null || state.currentPlayer == null) return;
    if (state.submittedAnswerIndex != null || _isSubmittingAnswer) return;

    final token = _playerToken;
    if (token == null) return;

    _isSubmittingAnswer = true;
    // Optimistically lock the client immediately to prevent duplicate taps!
    state = state.copyWith(submittedAnswerIndex: optionIndex);

    final pin = state.session!.pin;
    try {
      final points = await client.kahoot.submitAnswer(pin, token, optionIndex);
      state = state.copyWith(earnedPoints: points);
    } catch (e) {
      print('Error submitting answer: $e');
    } finally {
      _isSubmittingAnswer = false;
    }
  }

  Future<void> _syncPlayerScore() async {
    if (state.currentPlayer == null) return;
    try {
      final refreshed = await client.kahoot.getPlayer(state.currentPlayer!.id!);
      if (refreshed != null) {
        state = state.copyWith(currentPlayer: refreshed);
      }
    } catch (e) {
      print('Error syncing score: $e');
    }
  }

  Future<void> startQuestion() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    await client.kahoot.startQuestion(session.pin, hostToken);
  }

  Future<void> nextQuestion() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    final updatedSession =
        await client.kahoot.nextQuestion(session.pin, hostToken);
    if (updatedSession != null) {
      state = state.copyWith(session: updatedSession);
    }
  }

  Future<void> endQuestion() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    await client.kahoot.endQuestion(session.pin, hostToken);
  }

  Future<void> showLeaderboard() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    await client.kahoot.showLeaderboard(session.pin, hostToken);
  }

  Future<void> finishGame() async {
    final session = state.session;
    final hostToken = _hostToken;
    if (session == null || hostToken == null) return;
    await client.kahoot.finishGame(session.pin, hostToken);
  }
}

final gameProvider = NotifierProvider<GameNotifier, GameState>(GameNotifier.new);
