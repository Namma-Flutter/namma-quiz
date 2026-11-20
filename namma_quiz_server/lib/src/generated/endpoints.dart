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
import 'package:namma_kahoot_server/src/generated/kahoot/game_event.dart'
    as _i68w0vuw;
import 'package:namma_kahoot_server/src/generated/kahoot/question.dart'
    as _iih33dk0;
import 'package:namma_kahoot_server/src/generated/kahoot/quiz.dart'
    as _iiv8jun1;
import 'package:serverpod/serverpod.dart' as _is;
import 'package:serverpod_auth_core_server/serverpod_auth_core_server.dart'
    as _iacs;
import 'package:serverpod_auth_idp_server/serverpod_auth_idp_server.dart'
    as _iais;
import '../auth/email_idp_endpoint.dart' as _iuc1hd5t;
import '../auth/jwt_refresh_endpoint.dart' as _inwq3ztq;
import '../endpoints/admin_endpoint.dart' as _i5t1w2d2;
import '../endpoints/kahoot_endpoint.dart' as _ixijk5ye;

class Endpoints extends _is.EndpointDispatch {
  @override
  void initializeEndpoints(_is.Server server) {
    initializeOwnEndpoints(server);
    modules['serverpod_auth_idp'] = _iais.Endpoints()
      ..initializeOwnEndpoints(server);
    modules['serverpod_auth_core'] = _iacs.Endpoints()
      ..initializeOwnEndpoints(server);
  }

  @override
  void initializeOwnEndpoints(_is.Server server) {
    var endpoints = <String, _is.Endpoint>{
      'emailIdp': _iuc1hd5t.EmailIdpEndpoint()
        ..initialize(
          server,
          'emailIdp',
          null,
        ),
      'jwtRefresh': _inwq3ztq.JwtRefreshEndpoint()
        ..initialize(
          server,
          'jwtRefresh',
          null,
        ),
      'admin': _i5t1w2d2.AdminEndpoint()
        ..initialize(
          server,
          'admin',
          null,
        ),
      'kahoot': _ixijk5ye.KahootEndpoint()
        ..initialize(
          server,
          'kahoot',
          null,
        ),
    };
    connectors['emailIdp'] = _is.EndpointConnector(
      name: 'emailIdp',
      endpoint: endpoints['emailIdp']!,
      methodConnectors: {
        'login': _is.MethodConnector(
          name: 'login',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint).login(
                    session,
                    email: params['email'],
                    password: params['password'],
                  ),
        ),
        'startRegistration': _is.MethodConnector(
          name: 'startRegistration',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startRegistration(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyRegistrationCode': _is.MethodConnector(
          name: 'verifyRegistrationCode',
          params: {
            'accountRequestId': _is.ParameterDescription(
              name: 'accountRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyRegistrationCode(
                    session,
                    accountRequestId: params['accountRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishRegistration': _is.MethodConnector(
          name: 'finishRegistration',
          params: {
            'registrationToken': _is.ParameterDescription(
              name: 'registrationToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'password': _is.ParameterDescription(
              name: 'password',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishRegistration(
                    session,
                    registrationToken: params['registrationToken'],
                    password: params['password'],
                  ),
        ),
        'startPasswordReset': _is.MethodConnector(
          name: 'startPasswordReset',
          params: {
            'email': _is.ParameterDescription(
              name: 'email',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .startPasswordReset(
                    session,
                    email: params['email'],
                  ),
        ),
        'verifyPasswordResetCode': _is.MethodConnector(
          name: 'verifyPasswordResetCode',
          params: {
            'passwordResetRequestId': _is.ParameterDescription(
              name: 'passwordResetRequestId',
              type: _is.getType<_is.UuidValue>(),
              nullable: false,
            ),
            'verificationCode': _is.ParameterDescription(
              name: 'verificationCode',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .verifyPasswordResetCode(
                    session,
                    passwordResetRequestId: params['passwordResetRequestId'],
                    verificationCode: params['verificationCode'],
                  ),
        ),
        'finishPasswordReset': _is.MethodConnector(
          name: 'finishPasswordReset',
          params: {
            'finishPasswordResetToken': _is.ParameterDescription(
              name: 'finishPasswordResetToken',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'newPassword': _is.ParameterDescription(
              name: 'newPassword',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .finishPasswordReset(
                    session,
                    finishPasswordResetToken:
                        params['finishPasswordResetToken'],
                    newPassword: params['newPassword'],
                  ),
        ),
        'hasAccount': _is.MethodConnector(
          name: 'hasAccount',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['emailIdp'] as _iuc1hd5t.EmailIdpEndpoint)
                  .hasAccount(session),
        ),
      },
    );
    connectors['jwtRefresh'] = _is.EndpointConnector(
      name: 'jwtRefresh',
      endpoint: endpoints['jwtRefresh']!,
      methodConnectors: {
        'refreshAccessToken': _is.MethodConnector(
          name: 'refreshAccessToken',
          params: {
            'refreshToken': _is.ParameterDescription(
              name: 'refreshToken',
              type: _is.getType<String?>(),
              nullable: true,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['jwtRefresh'] as _inwq3ztq.JwtRefreshEndpoint)
                      .refreshAccessToken(
                        session,
                        refreshToken: params['refreshToken'],
                      ),
        ),
      },
    );
    connectors['admin'] = _is.EndpointConnector(
      name: 'admin',
      endpoint: endpoints['admin']!,
      methodConnectors: {
        'createQuiz': _is.MethodConnector(
          name: 'createQuiz',
          params: {
            'quiz': _is.ParameterDescription(
              name: 'quiz',
              type: _is.getType<_iiv8jun1.Quiz>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).createQuiz(
                    session,
                    params['quiz'],
                  ),
        ),
        'getQuizzes': _is.MethodConnector(
          name: 'getQuizzes',
          params: {},
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _i5t1w2d2.AdminEndpoint)
                  .getQuizzes(session),
        ),
        'getQuiz': _is.MethodConnector(
          name: 'getQuiz',
          params: {
            'id': _is.ParameterDescription(
              name: 'id',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).getQuiz(
                    session,
                    params['id'],
                  ),
        ),
        'addQuestion': _is.MethodConnector(
          name: 'addQuestion',
          params: {
            'question': _is.ParameterDescription(
              name: 'question',
              type: _is.getType<_iih33dk0.Question>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).addQuestion(
                    session,
                    params['question'],
                  ),
        ),
        'getQuestionsForQuiz': _is.MethodConnector(
          name: 'getQuestionsForQuiz',
          params: {
            'quizId': _is.ParameterDescription(
              name: 'quizId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['admin'] as _i5t1w2d2.AdminEndpoint)
                  .getQuestionsForQuiz(
                    session,
                    params['quizId'],
                  ),
        ),
        'deleteQuiz': _is.MethodConnector(
          name: 'deleteQuiz',
          params: {
            'quizId': _is.ParameterDescription(
              name: 'quizId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['admin'] as _i5t1w2d2.AdminEndpoint).deleteQuiz(
                    session,
                    params['quizId'],
                  ),
        ),
      },
    );
    connectors['kahoot'] = _is.EndpointConnector(
      name: 'kahoot',
      endpoint: endpoints['kahoot']!,
      methodConnectors: {
        'createGame': _is.MethodConnector(
          name: 'createGame',
          params: {
            'quizId': _is.ParameterDescription(
              name: 'quizId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'hostId': _is.ParameterDescription(
              name: 'hostId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).createGame(
                    session,
                    params['quizId'],
                    params['hostId'],
                  ),
        ),
        'getGameByPin': _is.MethodConnector(
          name: 'getGameByPin',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint)
                  .getGameByPin(
                    session,
                    params['pin'],
                  ),
        ),
        'sendEvent': _is.MethodConnector(
          name: 'sendEvent',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'event': _is.ParameterDescription(
              name: 'event',
              type: _is.getType<_i68w0vuw.GameEvent>(),
              nullable: false,
            ),
            'toHostOnly': _is.ParameterDescription(
              name: 'toHostOnly',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).sendEvent(
                    session,
                    params['pin'],
                    params['event'],
                    params['toHostOnly'],
                  ),
        ),
        'joinGame': _is.MethodConnector(
          name: 'joinGame',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'username': _is.ParameterDescription(
              name: 'username',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).joinGame(
                    session,
                    params['pin'],
                    params['username'],
                  ),
        ),
        'startQuestion': _is.MethodConnector(
          name: 'startQuestion',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint)
                  .startQuestion(
                    session,
                    params['pin'],
                  ),
        ),
        'nextQuestion': _is.MethodConnector(
          name: 'nextQuestion',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint)
                  .nextQuestion(
                    session,
                    params['pin'],
                  ),
        ),
        'submitAnswer': _is.MethodConnector(
          name: 'submitAnswer',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'playerId': _is.ParameterDescription(
              name: 'playerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'optionIndex': _is.ParameterDescription(
              name: 'optionIndex',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint)
                  .submitAnswer(
                    session,
                    params['pin'],
                    params['playerId'],
                    params['optionIndex'],
                  ),
        ),
        'hasAnsweredQuestion': _is.MethodConnector(
          name: 'hasAnsweredQuestion',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'playerId': _is.ParameterDescription(
              name: 'playerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
            'questionIndex': _is.ParameterDescription(
              name: 'questionIndex',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint)
                  .hasAnsweredQuestion(
                    session,
                    params['pin'],
                    params['playerId'],
                    params['questionIndex'],
                  ),
        ),
        'reconnectPlayer': _is.MethodConnector(
          name: 'reconnectPlayer',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'playerId': _is.ParameterDescription(
              name: 'playerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint)
                  .reconnectPlayer(
                    session,
                    params['pin'],
                    params['playerId'],
                  ),
        ),
        'getPlayer': _is.MethodConnector(
          name: 'getPlayer',
          params: {
            'playerId': _is.ParameterDescription(
              name: 'playerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).getPlayer(
                    session,
                    params['playerId'],
                  ),
        ),
        'getPlayers': _is.MethodConnector(
          name: 'getPlayers',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).getPlayers(
                    session,
                    params['pin'],
                  ),
        ),
        'leaveGame': _is.MethodConnector(
          name: 'leaveGame',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'playerId': _is.ParameterDescription(
              name: 'playerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).leaveGame(
                    session,
                    params['pin'],
                    params['playerId'],
                  ),
        ),
        'removePlayer': _is.MethodConnector(
          name: 'removePlayer',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'playerId': _is.ParameterDescription(
              name: 'playerId',
              type: _is.getType<int>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint)
                  .removePlayer(
                    session,
                    params['pin'],
                    params['playerId'],
                  ),
        ),
        'endQuestion': _is.MethodConnector(
          name: 'endQuestion',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).endQuestion(
                    session,
                    params['pin'],
                  ),
        ),
        'showLeaderboard': _is.MethodConnector(
          name: 'showLeaderboard',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint)
                  .showLeaderboard(
                    session,
                    params['pin'],
                  ),
        ),
        'finishGame': _is.MethodConnector(
          name: 'finishGame',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
          },
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
              ) async =>
                  (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).finishGame(
                    session,
                    params['pin'],
                  ),
        ),
        'gameStream': _is.MethodStreamConnector(
          name: 'gameStream',
          params: {
            'pin': _is.ParameterDescription(
              name: 'pin',
              type: _is.getType<String>(),
              nullable: false,
            ),
            'isHost': _is.ParameterDescription(
              name: 'isHost',
              type: _is.getType<bool>(),
              nullable: false,
            ),
          },
          streamParams: {},
          returnType: _is.MethodStreamReturnType.streamType,
          call:
              (
                _is.Session session,
                Map<String, dynamic> params,
                Map<String, Stream> streamParams,
              ) => (endpoints['kahoot'] as _ixijk5ye.KahootEndpoint).gameStream(
                session,
                params['pin'],
                params['isHost'],
              ),
        ),
      },
    );
  }
}
