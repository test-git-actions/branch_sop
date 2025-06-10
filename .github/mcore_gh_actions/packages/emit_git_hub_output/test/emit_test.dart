import 'dart:io';

import 'package:emit_git_hub_output/emit_git_hub_output.dart';
import 'package:test/test.dart';

void main() {
  tearDown(() {
    final output = Directory('output');
    if (output.existsSync()) {
      output.deleteSync(recursive: true);
    }
  });

  test('emits values', () async {
    final emitter = GitHubOutputEmitter();

    final values = <String, String>{
      'one': '1',
      'bool': 'true',
      'json': '{"key": "value"}',
      'empty': '',
    };

    final outputFile = File('output/outputs.txt');
    final emittedFile = await emitter.emit(
      values,
      outputFile: outputFile,
    );

    expect(outputFile, emittedFile);
    expect(emittedFile.existsSync(), true);
    expect(
      emittedFile.readAsStringSync(),
      '''
one=1
bool=true
json={"key": "value"}
empty=
''',
    );
  });
}
