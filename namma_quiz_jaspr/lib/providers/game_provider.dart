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

  @override
  GameState build() => GameState();

  void reset() {
    _subscription?.cancel();
    state = GameState();
  }

  void _saveSession(String pin, int playerId, String username) {
    if (kIsWeb) {
      try {
        web.window.sessionStorage.setItem('nq_pin', pin);
        web.window.sessionStorage.setItem('nq_pid', playerId.toString());
        web.window.sessionStorage.setItem('nq_user', username);
      } catch (_) {}
    }
  }

  void _clearSession() {
    if (kIsWeb) {
      try {
        web.window.sessionStorage.removeItem('nq_pin');
        web.window.sessionStorage.removeItem('nq_pid');
        web.window.sessionStorage.removeItem('nq_user');
      } catch (_) {}
    }
  }

  Future<bool> tryRestoreSession() async {
    if (!kIsWeb) return false;
    try {
      final savedPin = web.window.sessionStorage.getItem('nq_pin');
      final savedPidStr = web.window.sessionStorage.getItem('nq_pid');
      final savedUser = web.window.sessionStorage.getItem('nq_user');

      if (savedPin == null || savedPidStr == null || savedUser == null) {
        return false;
      }

      final playerId = int.tryParse(savedPidStr);
      if (playerId == null) return false;

      // Reconnect with server
      final player = await client.kahoot.reconnectPlayer(savedPin, playerId);
      if (player == null) {
        _clearSession();
        return false;
      }

      final session = await client.kahoot.getGameByPin(savedPin);
      if (session == null || session.status == 'finished') {
        _clearSession();
        return false;
      }

      final questions = await client.admin.getQuestionsForQuiz(session.quizId);
      final hasAnswered = await client.kahoot.hasAnsweredQuestion(
        savedPin,
        playerId,
        session.currentQuestionIndex,
      );

      state = state.copyWith(
        currentPlayer: player,
        session: session,
        questions: questions,
        isConnected: true,
        submittedAnswerIndex: hasAnswered ? -1 : null,
      );

      _subscribeToGame(savedPin, isHost: false);
      return true;
    } catch (e) {
      print('Error restoring session: $e');
      _clearSession();
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

      final player = await client.kahoot.joinGame(pin, username);
      if (player == null) {
        return 'Could not join game session. Please check PIN and try again.';
      }

      final questions = await client.admin.getQuestionsForQuiz(session.quizId);
      state = state.copyWith(
        currentPlayer: player,
        session: session,
        questions: questions,
        isConnected: true,
      );
      _subscribeToGame(pin, isHost: false);
      _saveSession(pin, player.id!, username);
      return null;
    } catch (e) {
      print('Error joining game: $e');
      return 'Connection error: $e';
    }
  }

  Future<void> leaveGame() async {
    final pin = state.session?.pin;
    final playerId = state.currentPlayer?.id;
    if (pin != null && playerId != null) {
      try {
        await client.kahoot.leaveGame(pin, playerId);
      } catch (e) {
        print('Error leaving game: $e');
      }
    }
    _clearSession();
    reset();
  }

  Future<void> removePlayer(int playerId) async {
    final pin = state.session?.pin;
    if (pin != null) {
      try {
        await client.kahoot.removePlayer(pin, playerId);
        state = state.copyWith(
          players: state.players.where((p) => p.id != playerId).toList(),
        );
      } catch (e) {
        print('Error removing player: $e');
      }
    }
  }

  Future<void> hostGame(int quizId) async {
    try {
      final session = await client.kahoot.createGame(quizId, 1);
      final questions = await client.admin.getQuestionsForQuiz(quizId);
      final existingPlayers = await client.kahoot.getPlayers(session.pin);
      state = state.copyWith(
        session: session,
        questions: questions,
        players: existingPlayers,
        isConnected: true,
      );
      _subscribeToGame(session.pin, isHost: true);
    } catch (e) {
      print('Error starting game: $e');
    }
  }

  void _subscribeToGame(String pin, {bool isHost = false}) {
    _subscription?.cancel();
    _subscription = client.kahoot.gameStream(pin, isHost).listen((event) {
      _handleEvent(event);
    });
  }

  void _handleEvent(GameEvent event) {
    var updatedState = state.copyWith(lastEvent: event);

    if (event.eventType == 'PLAYER_JOINED') {
      final data = jsonDecode(event.dataJson);
      final newPlayer = Player(
        id: data['playerId'],
        gameSessionId: state.session!.id!,
        name: data['name'],
        score: 0,
      );
      final filtered = state.players.where((p) => p.id != newPlayer.id).toList();
      state = updatedState.copyWith(players: [...filtered, newPlayer]);
    } else if (event.eventType == 'PLAYER_LEFT') {
      final data = jsonDecode(event.dataJson);
      final leftPlayerId = data['playerId'] as int;
      state = updatedState.copyWith(
        players: state.players.where((p) => p.id != leftPlayerId).toList(),
      );
    } else if (event.eventType == 'PLAYER_REMOVED') {
      final data = jsonDecode(event.dataJson);
      final removedPlayerId = data['playerId'] as int;
      if (state.currentPlayer?.id == removedPlayerId) {
        _clearSession();
        reset();
      }
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

    _isSubmittingAnswer = true;
    // Optimistically lock the client immediately to prevent duplicate taps!
    state = state.copyWith(submittedAnswerIndex: optionIndex);

    final pin = state.session!.pin;
    final playerId = state.currentPlayer!.id!;
    try {
      final points = await client.kahoot.submitAnswer(pin, playerId, optionIndex);
      state = state.copyWith(
        earnedPoints: points,
      );
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
    if (state.session == null) return;
    await client.kahoot.startQuestion(state.session!.pin);
  }

  Future<void> nextQuestion() async {
    if (state.session == null) return;
    final updatedSession = await client.kahoot.nextQuestion(state.session!.pin);
    if (updatedSession != null) {
      state = state.copyWith(session: updatedSession);
    }
  }

  Future<void> endQuestion() async {
    if (state.session == null) return;
    await client.kahoot.endQuestion(state.session!.pin);
  }

  Future<void> showLeaderboard() async {
    if (state.session == null) return;
    await client.kahoot.showLeaderboard(state.session!.pin);
  }

  Future<void> finishGame() async {
    if (state.session == null) return;
    await client.kahoot.finishGame(state.session!.pin);
  }
}

final gameProvider = NotifierProvider<GameNotifier, GameState>(GameNotifier.new);
