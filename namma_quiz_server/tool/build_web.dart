import 'dart:io';

void main(List<String> args) async {
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final serverDir = scriptDir.parent;
  final rootDir = serverDir.parent;
  final jasprDir = Directory('${rootDir.path}/namma_quiz_jaspr');
  final targetJasprWeb = Directory('${serverDir.path}/web/jaspr');

  stdout.writeln('Building Jaspr web client...');
  stdout.writeln('Jaspr directory: ${jasprDir.path}');

  final serverUrl = Platform.environment['SERVER_URL'] ??
      'https://namma-quiz.api.serverpod.space/';

  // Run jaspr build using dart pub global run
  final process = await Process.start(
    Platform.executable,
    [
      'pub',
      'global',
      'run',
      'jaspr_cli:jaspr',
      'build',
      '--dart-define=SERVER_URL=$serverUrl',
    ],
    workingDirectory: jasprDir.path,
    mode: ProcessStartMode.inheritStdio,
  );

  final exitCode = await process.exitCode;
  if (exitCode != 0) {
    stderr.writeln('Jaspr build failed with exit code $exitCode');
    exit(exitCode);
  }

  // Copy build output to server's web/jaspr
  final jasprBuildDir = Directory('${jasprDir.path}/build/jaspr');
  if (!jasprBuildDir.existsSync()) {
    stderr.writeln('Jaspr build directory not found at ${jasprBuildDir.path}');
    exit(1);
  }

  if (targetJasprWeb.existsSync()) {
    targetJasprWeb.deleteSync(recursive: true);
  }
  targetJasprWeb.createSync(recursive: true);

  _copyDirectory(jasprBuildDir, targetJasprWeb);

  stdout.writeln(
      'Successfully built and copied Jaspr web client to ${targetJasprWeb.path}');
}

void _copyDirectory(Directory source, Directory destination) {
  for (final entity in source.listSync(recursive: false)) {
    final newPath =
        '${destination.path}/${entity.uri.pathSegments.where((s) => s.isNotEmpty).last}';
    if (entity is Directory) {
      final newDir = Directory(newPath)..createSync(recursive: true);
      _copyDirectory(entity, newDir);
    } else if (entity is File) {
      entity.copySync(newPath);
    }
  }
}
