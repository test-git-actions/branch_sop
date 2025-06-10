// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:emit_git_hub_output/emit_git_hub_output.dart';
import 'package:emit_pubspec_info/src/pubspec_scanner.dart';

class PubspecEmitter {
  Future<File> emit(
    File file, {
    String format = 'github',
    File? outputFile,
  }) async {
    final scanner = PubspecScanner();
    final values = scanner.scan(file);

    final jsonFormat = format == 'json';

    late final File oFile;
    if (jsonFormat) {
      oFile = outputFile ?? File('${file.parent.path}/output/output.json');
      if (!oFile.existsSync()) {
        oFile.createSync(recursive: true);
      }
      oFile.writeAsStringSync(
        JsonEncoder.withIndent('  ').convert(values.toMap()),
        flush: true,
      );
      print('Wrote JSON to ${oFile.path}');
    } else {
      oFile = await GitHubOutputEmitter().emit(
        values.toMap(),
        // ignore: invalid_use_of_visible_for_testing_member
        outputFile: outputFile,
      );
    }

    return oFile;
  }
}
