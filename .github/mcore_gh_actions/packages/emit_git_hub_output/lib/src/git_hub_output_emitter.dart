// ignore_for_file: avoid_print

import 'dart:io';

import 'package:meta/meta.dart';

class GitHubOutputEmitter {
  Future<File> emit(
    Map<String, String> values, {
    @visibleForTesting File? outputFile,
  }) async {
    final ghActionEnvFile = Platform.environment['GITHUB_OUTPUT'];
    if (ghActionEnvFile != null || outputFile != null) {
      final file = outputFile ?? File(ghActionEnvFile!);
      print('[output]: Env File: [${file.path}]');
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      for (final entry in values.entries) {
        file.writeAsStringSync(
          '${entry.key}=${entry.value}\n',
          flush: true,
          mode: FileMode.append,
        );
      }
      return file;
    } else {
      throw Exception('[missing]: No Env File defined!');
    }
  }
}
