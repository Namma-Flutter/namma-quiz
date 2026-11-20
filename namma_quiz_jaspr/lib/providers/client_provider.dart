import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:namma_kahoot_client/namma_kahoot_client.dart';
import 'package:universal_web/web.dart' as web;

String _determineServerUrl() {
  const envUrl = String.fromEnvironment('SERVER_URL');
  if (envUrl.isNotEmpty) {
    return envUrl;
  }
  if (kIsWeb) {
    final host = web.window.location.host;
    if (host.contains('serverpod.space')) {
      return 'https://namma-quiz.api.serverpod.space/';
    }
  }
  return 'http://localhost:8080/';
}

final serverUrl = _determineServerUrl();

final client = Client(serverUrl);

final clientProvider = Provider<Client>((ref) {
  return client;
});
