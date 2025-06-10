// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

class BuildNumberIncrementer {
  const BuildNumberIncrementer({
    this.branch = 'build_number',
    this.fileName = 'build.number',
  });

  final String branch;
  final String fileName;

  Future<int> updateBuildNumber() async {
    var number = 1;

    Process.runSync(
      'git',
      ['fetch', 'origin'],
      runInShell: true,
    );

    print('[checkout]: $branch');
    var result = Process.runSync(
      'git',
      ['checkout', branch],
      runInShell: true,
    );
    if (result.exitCode != 0) {
      print('[create]: orphan branch: $branch');
      result = Process.runSync(
        'git',
        ['checkout', '--orphan', branch],
        runInShell: Platform.isWindows,
        stderrEncoding: utf8,
        stdoutEncoding: utf8,
      );
      if (result.exitCode != 0) {
        print('Unable to checkout branch: $branch');
        print(result.stdout);
        print(result.stderr);
        exit(1);
      }
      print('[delete]: existing files');
      result = Process.runSync(
        'git',
        ['rm', '-rf', '.'],
        runInShell: Platform.isWindows,
        stderrEncoding: utf8,
        stdoutEncoding: utf8,
      );
      if (result.exitCode != 0) {
        print('Unable to clear existing content');
        print(result.stdout);
        print(result.stderr);
        exit(1);
      }
    }

    final file = File(fileName);
    if (!file.existsSync()) {
      print('[create]: file: $fileName');
      file.createSync(recursive: true);
    }
    final existing = int.tryParse(file.readAsStringSync().trim());
    if (existing != null) {
      number = existing + 1;
    }
    file.writeAsStringSync('$number');

    print('[git]: add');
    result = Process.runSync(
      'git',
      ['add', fileName],
      runInShell: Platform.isWindows,
    );
    if (result.exitCode != 0) {
      print('Unable to add files');
      print(result.stdout);
      print(result.stderr);
      exit(1);
    }
    print('[git]: commit');
    result = Process.runSync(
      'git',
      ['commit', '-m', '[actions_skip]: increment build number'],
      runInShell: Platform.isWindows,
    );
    if (result.exitCode != 0) {
      print('Unable to commit to git');
      print(result.stdout);
      print(result.stderr);
      exit(1);
    }
    print('[git]: push to branch: $branch');
    result = Process.runSync(
      'git',
      ['push', '--set-upstream', 'origin', branch],
      runInShell: Platform.isWindows,
    );
    if (result.exitCode != 0) {
      print('Unable to push to git');
      print(result.stdout);
      print(result.stderr);
      exit(1);
    }

    final ghActionEnvFile = Platform.environment['GITHUB_OUTPUT'];
    if (ghActionEnvFile != null) {
      print('[output]: Env File: [$ghActionEnvFile]');
      final file = File(ghActionEnvFile);
      if (!file.existsSync()) {
        file.createSync(recursive: true);
      }
      file.writeAsStringSync(
        'BUILD_NUMBER=$number\n',
        flush: true,
        mode: FileMode.append,
      );

      final contents = file.readAsStringSync();
      print(contents);
    } else {
      print('[missing]: No Env File defined!');
    }

    print('[done]: complete!');
    return number;
  }
}
