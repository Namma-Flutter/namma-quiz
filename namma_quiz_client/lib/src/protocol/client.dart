/* AUTOMATICALLY GENERATED CODE DO NOT MODIFY */
/*   To generate run: "serverpod generate"    */

// ignore_for_file: implementation_imports
// ignore_for_file: library_private_types_in_public_api
// ignore_for_file: non_constant_identifier_names
// ignore_for_file: public_member_api_docs
// ignore_for_file: type_literal_in_constant_pattern
// ignore_for_file: use_super_parameters
// ignore_for_file: invalid_use_of_internal_member

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _ida;
import 'package:http/http.dart' as _i85jenna;
import 'package:namma_kahoot_client/src/protocol/kahoot/game_event.dart'
    as _i43ngwq2;
import 'package:namma_kahoot_client/src/protocol/kahoot/game_session.dart'
    as _i5juiv7o;
import 'package:namma_kahoot_client/src/protocol/kahoot/host_session.dart'
    as _i2o97f7q;
import 'package:namma_kahoot_client/src/protocol/kahoot/join_result.dart'
    as _ivnq836k;
import 'package:namma_kahoot_client/src/protocol/kahoot/player.dart'
    as _iowcd9iw;
import 'package:namma_kahoot_client/src/protocol/kahoot/question.dart'
    as _imhbbxog;
import 'package:namma_kahoot_client/src/protocol/kahoot/quiz.dart' as _ibf9eeue;
import 'package:serverpod_auth_core_client/serverpod_auth_core_client.dart'
    as _iacc;
import 'package:serverpod_auth_idp_client/serverpod_auth_idp_client.dart'
    as _iaic;
import 'package:serverpod_client/serverpod_client.dart' as _isc;
import 'protocol.dart' as _il2as5qe;

/// By extending [EmailIdpBaseEndpoint], the email identity provider endpoints
/// are made available on the server and enable the corresponding sign-in widget
/// on the client.
/// {@category Endpoint}
class EndpointEmailIdp extends _iaic.EndpointEmailIdpBase {
  EndpointEmailIdp(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'emailIdp';

  /// Logs in the user and returns a new session.
  ///
  /// Throws an [EmailAccountLoginException] in case of errors, with reason:
  /// - [EmailAccountLoginExceptionReason.invalidCredentials] if the email or
  ///   password is incorrect.
  /// - [EmailAccountLoginExceptionReason.tooManyAttempts] if there have been
  ///   too many failed login attempts.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<_iacc.AuthSuccess> login({
    required String email,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'login',
    {
      'email': email,
      'password': password,
    },
  );

  /// Starts the registration for a new user account with an email-based login
  /// associated to it.
  ///
  /// Upon successful completion of this method, an email will have been
  /// sent to [email] with a verification link, which the user must open to
  /// complete the registration.
  ///
  /// Always returns a account request ID, which can be used to complete the
  /// registration. If the email is already registered, the returned ID will not
  /// be valid.
  @override
  _ida.Future<_isc.UuidValue> startRegistration({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startRegistration',
        {'email': email},
      );

  /// Verifies an account request code and returns a token
  /// that can be used to complete the account creation.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if no request exists
  ///   for the given [accountRequestId] or [verificationCode] is invalid.
  @override
  _ida.Future<String> verifyRegistrationCode({
    required _isc.UuidValue accountRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyRegistrationCode',
    {
      'accountRequestId': accountRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a new account registration, creating a new auth user with a
  /// profile and attaching the given email account to it.
  ///
  /// Throws an [EmailAccountRequestException] in case of errors, with reason:
  /// - [EmailAccountRequestExceptionReason.expired] if the account request has
  ///   already expired.
  /// - [EmailAccountRequestExceptionReason.policyViolation] if the password
  ///   does not comply with the password policy.
  /// - [EmailAccountRequestExceptionReason.invalid] if the [registrationToken]
  ///   is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  ///
  /// Returns a session for the newly created user.
  @override
  _ida.Future<_iacc.AuthSuccess> finishRegistration({
    required String registrationToken,
    required String password,
  }) => caller.callServerEndpoint<_iacc.AuthSuccess>(
    'emailIdp',
    'finishRegistration',
    {
      'registrationToken': registrationToken,
      'password': password,
    },
  );

  /// Requests a password reset for [email].
  ///
  /// If the email address is registered, an email with reset instructions will
  /// be send out. If the email is unknown, this method will have no effect.
  ///
  /// Always returns a password reset request ID, which can be used to complete
  /// the reset. If the email is not registered, the returned ID will not be
  /// valid.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to request a password reset.
  ///
  @override
  _ida.Future<_isc.UuidValue> startPasswordReset({required String email}) =>
      caller.callServerEndpoint<_isc.UuidValue>(
        'emailIdp',
        'startPasswordReset',
        {'email': email},
      );

  /// Verifies a password reset code and returns a finishPasswordResetToken
  /// that can be used to finish the password reset.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.tooManyAttempts] if the user has
  ///   made too many attempts trying to verify the password reset.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// If multiple steps are required to complete the password reset, this endpoint
  /// should be overridden to return credentials for the next step instead
  /// of the credentials for setting the password.
  @override
  _ida.Future<String> verifyPasswordResetCode({
    required _isc.UuidValue passwordResetRequestId,
    required String verificationCode,
  }) => caller.callServerEndpoint<String>(
    'emailIdp',
    'verifyPasswordResetCode',
    {
      'passwordResetRequestId': passwordResetRequestId,
      'verificationCode': verificationCode,
    },
  );

  /// Completes a password reset request by setting a new password.
  ///
  /// The [verificationCode] returned from [verifyPasswordResetCode] is used to
  /// validate the password reset request.
  ///
  /// Throws an [EmailAccountPasswordResetException] in case of errors, with reason:
  /// - [EmailAccountPasswordResetExceptionReason.expired] if the password reset
  ///   request has already expired.
  /// - [EmailAccountPasswordResetExceptionReason.policyViolation] if the new
  ///   password does not comply with the password policy.
  /// - [EmailAccountPasswordResetExceptionReason.invalid] if no request exists
  ///   for the given [passwordResetRequestId] or [verificationCode] is invalid.
  ///
  /// Throws an [AuthUserBlockedException] if the auth user is blocked.
  @override
  _ida.Future<void> finishPasswordReset({
    required String finishPasswordResetToken,
    required String newPassword,
  }) => caller.callServerEndpoint<void>(
    'emailIdp',
    'finishPasswordReset',
    {
      'finishPasswordResetToken': finishPasswordResetToken,
      'newPassword': newPassword,
    },
  );

  @override
  _ida.Future<bool> hasAccount() => caller.callServerEndpoint<bool>(
    'emailIdp',
    'hasAccount',
    {},
  );
}

/// By extending [RefreshJwtTokensEndpoint], the JWT token refresh endpoint
/// is made available on the server and enables automatic token refresh on the client.
/// {@category Endpoint}
class EndpointJwtRefresh extends _iacc.EndpointRefreshJwtTokens {
  EndpointJwtRefresh(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'jwtRefresh';

  /// Creates a new token pair for the given [refreshToken].
  ///
  /// If [refreshToken] is omitted, cookie-mode web clients fall back to the
  /// configured HttpOnly refresh cookie. When neither source is present this
  /// throws [RefreshTokenNotFoundException], the same public "no usable refresh
  /// credential" exception used for unknown refresh tokens.
  ///
  /// Can throw the following exceptions:
  /// -[RefreshTokenMalformedException]: refresh token is malformed and could
  ///   not be parsed. Not expected to happen for tokens issued by the server.
  /// -[RefreshTokenNotFoundException]: refresh token is unknown to the server.
  ///   Either the token was deleted or generated by a different server.
  /// -[RefreshTokenExpiredException]: refresh token has expired. Will happen
  ///   only if it has not been used within configured `refreshTokenLifetime`.
  /// -[RefreshTokenInvalidSecretException]: refresh token is incorrect, meaning
  ///   it does not refer to the current secret refresh token. This indicates
  ///   either a malfunctioning client or a malicious attempt by someone who has
  ///   obtained the refresh token. In this case the underlying refresh token
  ///   will be deleted, and access to it will expire fully when the last access
  ///   token is elapsed.
  ///
  /// This endpoint is unauthenticated, meaning the client won't include any
  /// authentication information with the call.
  @override
  _ida.Future<_iacc.AuthSuccess> refreshAccessToken({String? refreshToken}) =>
      caller.callServerEndpoint<_iacc.AuthSuccess>(
        'jwtRefresh',
        'refreshAccessToken',
        {'refreshToken': refreshToken},
        authenticated: false,
      );
}

/// {@category Endpoint}
class EndpointAdmin extends _isc.EndpointRef {
  EndpointAdmin(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'admin';

  /// Create a new Quiz
  _ida.Future<_ibf9eeue.Quiz> createQuiz(_ibf9eeue.Quiz quiz) =>
      caller.callServerEndpoint<_ibf9eeue.Quiz>(
        'admin',
        'createQuiz',
        {'quiz': quiz},
      );

  /// Get all quizzes
  _ida.Future<List<_ibf9eeue.Quiz>> getQuizzes() =>
      caller.callServerEndpoint<List<_ibf9eeue.Quiz>>(
        'admin',
        'getQuizzes',
        {},
      );

  /// Get a single quiz by ID
  _ida.Future<_ibf9eeue.Quiz?> getQuiz(int id) =>
      caller.callServerEndpoint<_ibf9eeue.Quiz?>(
        'admin',
        'getQuiz',
        {'id': id},
      );

  /// Add a Question to a Quiz
  _ida.Future<_imhbbxog.Question> addQuestion(_imhbbxog.Question question) =>
      caller.callServerEndpoint<_imhbbxog.Question>(
        'admin',
        'addQuestion',
        {'question': question},
      );

  /// Get questions for a quiz
  _ida.Future<List<_imhbbxog.Question>> getQuestionsForQuiz(int quizId) =>
      caller.callServerEndpoint<List<_imhbbxog.Question>>(
        'admin',
        'getQuestionsForQuiz',
        {'quizId': quizId},
      );

  /// Delete a Quiz
  _ida.Future<void> deleteQuiz(int quizId) => caller.callServerEndpoint<void>(
    'admin',
    'deleteQuiz',
    {'quizId': quizId},
  );
}

/// {@category Endpoint}
class EndpointKahoot extends _isc.EndpointRef {
  EndpointKahoot(_isc.EndpointCaller caller) : super(caller);

  @override
  String get name => 'kahoot';

  /// Create a new game session from a quiz and return the PIN plus the host's
  /// secret token. The token is required for every host action.
  _ida.Future<_i2o97f7q.HostSession> createGame(
    int quizId,
    int hostId,
  ) => caller.callServerEndpoint<_i2o97f7q.HostSession>(
    'kahoot',
    'createGame',
    {
      'quizId': quizId,
      'hostId': hostId,
    },
  );

  /// Get public game info by PIN. Never contains secret tokens.
  _ida.Future<_i5juiv7o.GameSession?> getGameByPin(String pin) =>
      caller.callServerEndpoint<_i5juiv7o.GameSession?>(
        'kahoot',
        'getGameByPin',
        {'pin': pin},
      );

  /// Players and hosts call this stream to receive real-time updates.
  ///
  /// The first event is always a `STATE_SNAPSHOT` (or `RESUME_REJECTED`). The
  /// secret [token] identifies the caller; it is never trusted from a name or
  /// player id.
  _ida.Stream<_i43ngwq2.GameEvent> gameStream(
    String pin,
    bool isHost,
    String token,
  ) =>
      caller.callStreamingServerEndpoint<
        _ida.Stream<_i43ngwq2.GameEvent>,
        _i43ngwq2.GameEvent
      >(
        'kahoot',
        'gameStream',
        {
          'pin': pin,
          'isHost': isHost,
          'token': token,
        },
        {},
      );

  /// Join a lobby. Names are display-only and may repeat; identity is the
  /// secret token returned in [JoinResult].
  _ida.Future<_ivnq836k.JoinResult?> joinGame(
    String pin,
    String username,
  ) => caller.callServerEndpoint<_ivnq836k.JoinResult?>(
    'kahoot',
    'joinGame',
    {
      'pin': pin,
      'username': username,
    },
  );

  /// Host starts the first question.
  _ida.Future<void> startQuestion(
    String pin,
    String hostToken,
  ) => caller.callServerEndpoint<void>(
    'kahoot',
    'startQuestion',
    {
      'pin': pin,
      'hostToken': hostToken,
    },
  );

  /// Host transitions to the next question.
  _ida.Future<_i5juiv7o.GameSession?> nextQuestion(
    String pin,
    String hostToken,
  ) => caller.callServerEndpoint<_i5juiv7o.GameSession?>(
    'kahoot',
    'nextQuestion',
    {
      'pin': pin,
      'hostToken': hostToken,
    },
  );

  /// Player submits an answer, returning points earned (or 0 if duplicate,
  /// invalid or the player is away).
  _ida.Future<int> submitAnswer(
    String pin,
    String token,
    int optionIndex,
  ) => caller.callServerEndpoint<int>(
    'kahoot',
    'submitAnswer',
    {
      'pin': pin,
      'token': token,
      'optionIndex': optionIndex,
    },
  );

  /// Check if a player has already submitted an answer for a question.
  _ida.Future<bool> hasAnsweredQuestion(
    String pin,
    String token,
    int questionIndex,
  ) => caller.callServerEndpoint<bool>(
    'kahoot',
    'hasAnsweredQuestion',
    {
      'pin': pin,
      'token': token,
      'questionIndex': questionIndex,
    },
  );

  /// Validate a stored token and return the player it belongs to.
  _ida.Future<_iowcd9iw.Player?> resumePlayer(
    String pin,
    String token,
  ) => caller.callServerEndpoint<_iowcd9iw.Player?>(
    'kahoot',
    'resumePlayer',
    {
      'pin': pin,
      'token': token,
    },
  );

  /// Get current player details (including updated score).
  _ida.Future<_iowcd9iw.Player?> getPlayer(int playerId) =>
      caller.callServerEndpoint<_iowcd9iw.Player?>(
        'kahoot',
        'getPlayer',
        {'playerId': playerId},
      );

  /// Get all players registered for a game session.
  _ida.Future<List<_iowcd9iw.Player>> getPlayers(String pin) =>
      caller.callServerEndpoint<List<_iowcd9iw.Player>>(
        'kahoot',
        'getPlayers',
        {'pin': pin},
      );

  /// Player leaves the game.
  _ida.Future<bool> leaveGame(
    String pin,
    String token,
  ) => caller.callServerEndpoint<bool>(
    'kahoot',
    'leaveGame',
    {
      'pin': pin,
      'token': token,
    },
  );

  /// Host removes or kicks a player. The player's token is banned for the rest
  /// of the room's lifetime.
  _ida.Future<bool> kickPlayer(
    String pin,
    String hostToken,
    int playerId,
  ) => caller.callServerEndpoint<bool>(
    'kahoot',
    'kickPlayer',
    {
      'pin': pin,
      'hostToken': hostToken,
      'playerId': playerId,
    },
  );

  /// Host ends the question, locking responses and revealing the answer.
  _ida.Future<void> endQuestion(
    String pin,
    String hostToken,
  ) => caller.callServerEndpoint<void>(
    'kahoot',
    'endQuestion',
    {
      'pin': pin,
      'hostToken': hostToken,
    },
  );

  /// Host shows leaderboard.
  _ida.Future<void> showLeaderboard(
    String pin,
    String hostToken,
  ) => caller.callServerEndpoint<void>(
    'kahoot',
    'showLeaderboard',
    {
      'pin': pin,
      'hostToken': hostToken,
    },
  );

  /// Host finishes the game and reveals the podium (top 3) and full ranks.
  _ida.Future<void> finishGame(
    String pin,
    String hostToken,
  ) => caller.callServerEndpoint<void>(
    'kahoot',
    'finishGame',
    {
      'pin': pin,
      'hostToken': hostToken,
    },
  );
}

class Modules {
  Modules(Client client) {
    serverpod_auth_idp = _iaic.Caller(client);
    serverpod_auth_core = _iacc.Caller(client);
  }

  late final _iaic.Caller serverpod_auth_idp;

  late final _iacc.Caller serverpod_auth_core;
}

class Client extends _isc.ServerpodClientShared {
  Client(
    String host, {
    dynamic securityContext,
    Duration? streamingConnectionTimeout,
    Duration? connectionTimeout,
    Function(
      _isc.MethodCallContext,
      Object,
      StackTrace,
    )?
    onFailedCall,
    Function(_isc.MethodCallContext)? onSucceededCall,
    bool? disconnectStreamsOnLostInternetConnection,
    _i85jenna.Client? httpClientOverride,
  }) : super(
         host,
         _il2as5qe.Protocol(),
         securityContext: securityContext,
         streamingConnectionTimeout: streamingConnectionTimeout,
         connectionTimeout: connectionTimeout,
         onFailedCall: onFailedCall,
         onSucceededCall: onSucceededCall,
         disconnectStreamsOnLostInternetConnection:
             disconnectStreamsOnLostInternetConnection,
         httpClientOverride: httpClientOverride,
       ) {
    emailIdp = EndpointEmailIdp(this);
    jwtRefresh = EndpointJwtRefresh(this);
    admin = EndpointAdmin(this);
    kahoot = EndpointKahoot(this);
    modules = Modules(this);
  }

  late final EndpointEmailIdp emailIdp;

  late final EndpointJwtRefresh jwtRefresh;

  late final EndpointAdmin admin;

  late final EndpointKahoot kahoot;

  late final Modules modules;

  @override
  Map<String, _isc.EndpointRef> get endpointRefLookup => {
    'emailIdp': emailIdp,
    'jwtRefresh': jwtRefresh,
    'admin': admin,
    'kahoot': kahoot,
  };

  @override
  Map<String, _isc.ModuleEndpointCaller> get moduleLookup => {
    'serverpod_auth_idp': modules.serverpod_auth_idp,
    'serverpod_auth_core': modules.serverpod_auth_core,
  };
}
