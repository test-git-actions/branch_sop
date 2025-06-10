// ignore_for_file: avoid_print

import 'dart:io';

import 'package:args/args.dart';
import 'package:emit_pubspec_info/emit_pubspec_info.dart';

void main(List<String> args) async {
  final parser = ArgParser()
    ..addOption(
      'format',
      abbr: 'f',
      defaultsTo: 'github',
      help: 'The format to emit the pubspec information.',
      allowed: ['github', 'json'],
      allowedHelp: {
        'github': 'GitHub Actions output format',
        'json': 'JSON format',
      },
      mandatory: false,
    )
    ..addOption(
      'output',
      abbr: 'o',
      help: 'The output file path.',
      mandatory: false,
    )
    ..addOption(
      'pubspec',
      abbr: 'p',
      defaultsTo: './pubspec.yaml',
      help: 'The path to the pubspec.yaml file.',
      mandatory: false,
    );

  final parsed = parser.parse(args);
  final format = parsed['format'] as String;
  final output = parsed['output'] as String?;
  final pubspecPath = parsed['pubspec'] as String;

  print('''
ARGS:
  • format: $format 
  • output: $output
  • pubspec: $pubspecPath
''');

  final file = File(pubspecPath);

  await PubspecEmitter().emit(
    file,
    format: format,
    outputFile: output != null ? File(output) : null,
  );

  exit(0);
}
