import 'dart:io';

import 'package:args/args.dart';
import 'package:glob/glob.dart';
import 'package:glob/list_local_fs.dart';
import 'package:inline_markdown_files/markdown_processor.dart';

void main(List<String> args) {
  final parser = ArgParser()
    ..addOption(
      'files',
      abbr: 'f',
      defaultsTo: '**.md',
      help: 'The glob pattern for the files to process',
    );

  final parsed = parser.parse(args);
  final files = Glob(parsed['files'] as String)
      .listSync()
      .whereType<File>()
      .where((f) => !f.path.contains('.dart_tool/'));

  for (final file in files) {
    print('Processing file: ${file.path}');

    final input = file.readAsStringSync();
    file.writeAsString(MarkdownProcessor().processMarkdown(input));

    print('Processed file: ${file.path}');
    print('-----------------------------------');
  }
}
