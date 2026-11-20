import 'dart:io';

import 'package:serverpod/serverpod.dart';
import 'package:serverpod_auth_idp_server/core.dart';
import 'package:serverpod_auth_idp_server/providers/email.dart';

import 'src/generated/endpoints.dart';
import 'src/generated/protocol.dart';

/// The starting point of the Serverpod server.
void run(List<String> args) async {
  // Initialize Serverpod and connect it with your generated code.
  final pod = Serverpod(args, Protocol(), Endpoints());

  // Initialize authentication services for the server.
  // Token managers will be used to validate and issue authentication keys,
  // and the identity providers will be the authentication options available for users.
  pod.initializeAuthServices(
    tokenManagerBuilders: [
      // Use JWT for authentication keys towards the server.
      JwtConfigFromPasswords(),
    ],
    identityProviderBuilders: [
      // Configure the email identity provider for email/password authentication.
      EmailIdpConfigFromPasswords(
        sendRegistrationVerificationCode: _sendRegistrationCode,
        sendPasswordResetVerificationCode: _sendPasswordResetCode,
      ),
    ],
  );

  // Build the web server routes (Jaspr Web SPA)
  final jasprDir = Directory('web/jaspr');
  final jasprIndex = File('web/jaspr/index.html');
  if (jasprIndex.existsSync()) {
    pod.webServer.addRoute(
      SpaRoute(
        jasprDir,
        fallback: jasprIndex,
      ),
      '/',
    );
  } else {
    stderr.writeln(
      'WARNING: web/jaspr/index.html not found. Jaspr web app will not be served.',
    );
  }

  // Start the server.
  await pod.start();

  // Live rooms only exist in memory, so any room left behind by a previous
  // process can no longer be resumed.
  await _sweepStaleRooms(pod);

  // Seed default quiz
  await _seedDefaultQuiz(pod);
}

Future<void> _sweepStaleRooms(Serverpod pod) async {
  final session = await pod.createSession();
  try {
    final stale = await GameSession.db.find(
      session,
      where: (t) => t.status.notEquals('finished'),
    );

    for (final game in stale) {
      game.status = 'finished';
      await GameSession.db.updateRow(session, game);
      await Player.db.deleteWhere(
        session,
        where: (t) => t.gameSessionId.equals(game.id),
      );
    }
  } catch (e) {
    stderr.writeln('Failed to sweep stale game rooms: $e');
  } finally {
    await session.close();
  }
}

Future<void> _seedDefaultQuiz(Serverpod pod) async {
  final session = await pod.createSession();
  try {
    final quizzes = await Quiz.db.find(session, limit: 1);
    if (quizzes.isEmpty) {
      stdout.writeln('Seeding default trivia quiz...');
      var quiz = Quiz(
        title: 'General Trivia Spark',
        creatorId: 1,
        description: 'Test your general knowledge with these fun questions!',
        createdAt: DateTime.now(),
      );
      quiz = await Quiz.db.insertRow(session, quiz);

      final questions = [
        Question(
          quizId: quiz.id!,
          text: 'Which planet is known as the Red Planet?',
          options: ['Earth', 'Mars', 'Jupiter', 'Venus'],
          correctOptionIndex: 1,
          timeLimitSeconds: 20,
          orderIndex: 0,
        ),
        Question(
          quizId: quiz.id!,
          text: 'What is the chemical symbol for gold?',
          options: ['Gd', 'Au', 'Ag', 'Fe'],
          correctOptionIndex: 1,
          timeLimitSeconds: 15,
          orderIndex: 1,
        ),
        Question(
          quizId: quiz.id!,
          text: 'Who painted the Mona Lisa?',
          options: ['Vincent van Gogh', 'Pablo Picasso', 'Leonardo da Vinci', 'Claude Monet'],
          correctOptionIndex: 2,
          timeLimitSeconds: 20,
          orderIndex: 2,
        ),
        Question(
          quizId: quiz.id!,
          text: 'How many bones are there in an adult human body?',
          options: ['106', '206', '306', '406'],
          correctOptionIndex: 1,
          timeLimitSeconds: 20,
          orderIndex: 3,
        ),
      ];

      for (var q in questions) {
        await Question.db.insertRow(session, q);
      }
      stdout.writeln('Seeding complete!');
    }
  } catch (e) {
    stderr.writeln('Failed to seed default quiz: $e');
  } finally {
    await session.close();
  }
}

void _sendRegistrationCode(
  Session session, {
  required String email,
  required UuidValue accountRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Registration code ($email): $verificationCode');
}

void _sendPasswordResetCode(
  Session session, {
  required String email,
  required UuidValue passwordResetRequestId,
  required String verificationCode,
  required Transaction? transaction,
}) {
  // NOTE: Here you call your mail service to send the verification code to
  // the user. For testing, we will just log the verification code.
  session.log('[EmailIdp] Password reset code ($email): $verificationCode');
}
