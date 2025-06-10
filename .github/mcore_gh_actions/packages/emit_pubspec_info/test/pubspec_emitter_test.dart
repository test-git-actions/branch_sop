import 'package:emit_pubspec_info/emit_pubspec_info.dart';
import 'package:file/memory.dart';
import 'package:test/test.dart';

void main() {
  test('emit formats', () async {
    final file = MemoryFileSystem().file('pubspec.yaml');

    final content = '''
name: emit_pubspec_info
description: 'Scans a pubspec file and emits the information to a GitHub output'
version: 1.0.0
publish_to: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
repository: https://github.com/mgmri-dge/mcore_gh_actions

environment:
  sdk: ^3.6.0

dependencies:
  args: ^2.5.0
  emit_git_hub_output:
    hosted: https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
    version: ^1.0.0
  file: ^7.0.1
  meta: ^1.17.0
  pubspec_parse: ^1.5.0

dev_dependencies:
  flutter_lints: ^5.0.0
  test: ^1.26.1

dependency_overrides:
  emit_git_hub_output:
    path: ../emit_git_hub_output
''';
    file.writeAsStringSync(content);

    final emitter = PubspecEmitter();
    expect(
        (await emitter.emit(
          file,
          outputFile: MemoryFileSystem().file('output.txt'),
        ))
            .readAsStringSync(),
        '''
PUBSPEC_DESCRIPTION=Scans a pubspec file and emits the information to a GitHub output
PUBSPEC_FLUTTER_SDK=false
PUBSPEC_NAME=emit_pubspec_info
PUBSPEC_PUBLISH_TO=https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub
PUBSPEC_REPOSITORY=https://github.com/mgmri-dge/mcore_gh_actions
PUBSPEC_VERSION=1.0.0
PUBSPEC_VERSION_MAJOR=1
PUBSPEC_VERSION_MINOR=0
PUBSPEC_VERSION_PATCH=0
PUBSPEC_VERSION_PRE_RELEASE=
''');

    expect(
        (await emitter.emit(
          file,
          format: 'json',
          outputFile: MemoryFileSystem().file('output.json'),
        ))
            .readAsStringSync(),
        '''
{
  "PUBSPEC_DESCRIPTION": "Scans a pubspec file and emits the information to a GitHub output",
  "PUBSPEC_FLUTTER_SDK": "false",
  "PUBSPEC_NAME": "emit_pubspec_info",
  "PUBSPEC_PUBLISH_TO": "https://mgmresorts.jfrog.io/artifactory/api/pub/dge-pub",
  "PUBSPEC_REPOSITORY": "https://github.com/mgmri-dge/mcore_gh_actions",
  "PUBSPEC_VERSION": "1.0.0",
  "PUBSPEC_VERSION_MAJOR": "1",
  "PUBSPEC_VERSION_MINOR": "0",
  "PUBSPEC_VERSION_PATCH": "0",
  "PUBSPEC_VERSION_PRE_RELEASE": ""
}''');
  });
}
