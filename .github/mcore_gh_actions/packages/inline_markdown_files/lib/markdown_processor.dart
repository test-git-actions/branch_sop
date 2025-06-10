import 'dart:io';

import 'package:path/path.dart' as path;
import 'package:yaon/yaon.dart';

class MarkdownProcessor {
  String processMarkdown(String input) {
    input = _replaceDescription(input);
    input = _replaceFile(input);
    input = _replaceInputs(input);
    input = _replaceOutputs(input);
    return input;
  }

  Map<String, dynamic> _loadActionYaml(RegExpMatch match) {
    final action = match.namedGroup('action');
    if (action == null) {
      throw Exception('Action not found on line: [${match.group(0)}]');
    }

    final actionFile = File(action);
    if (!actionFile.existsSync()) {
      throw Exception('Action file [$action] does not exist');
    }
    return yaon.parse(
      actionFile.readAsStringSync(),
      normalize: true,
    );
  }

  String _replace(
    String input, {
    required RegExp endRegEx,
    required String Function(RegExpMatch match) processor,
    required RegExp startRegEx,
  }) {
    final result = <String>[];
    final lines = input.split('\n');

    for (var i = 0; i < lines.length; i++) {
      final line = lines[i];
      result.add(line);
      final match = startRegEx.firstMatch(line);
      if (match != null) {
        for (; i < lines.length; i++) {
          final line = lines[i];
          if (endRegEx.hasMatch(line)) {
            result.add(processor(match));
            result.add(line);
            break;
          }
        }
      }
    }
    return result.join('\n');
  }

  String _replaceDescription(String input) {
    final startRegEx =
        RegExp(r'<!--\s*action_description:\s*(?<action>\S*)\s*-->');
    final endRegEx = RegExp(r'<!--\s*/action_description\s*-->');

    return _replace(
      input,
      endRegEx: endRegEx,
      processor: (match) {
        final actionYaml = _loadActionYaml(match);
        var description = actionYaml['description'].toString();

        description = description
            .replaceAll('\n\n', '<br/><br/>')
            .replaceAll('\n', ' ')
            .replaceAll('<br/><br/>', '\n\n');

        return description;
      },
      startRegEx: startRegEx,
    );
  }

  String _replaceFile(String input) {
    final startRegEx = RegExp(r'<!--\s*file:\s*(?<file>\S*)\s*-->');
    final endRegEx = RegExp(r'<!--\s*/file\s*-->');

    return _replace(
      input,
      endRegEx: endRegEx,
      processor: (match) {
        final fileName = match.namedGroup('file');
        if (fileName == null) {
          throw Exception('File not found on line: [${match.group(0)}]');
        }

        final file = File(fileName);
        if (!file.existsSync()) {
          throw Exception('File [$fileName] does not exist');
        }

        return '''

```${path.extension(file.path).substring(1)}
${file.readAsStringSync()}
```

''';
      },
      startRegEx: startRegEx,
    );
  }

  String _replaceInputs(String input) {
    final startRegEx = RegExp(r'<!--\s*action_inputs:\s*(?<action>\S*)\s*-->');
    final endRegEx = RegExp(r'<!--\s*/action_inputs\s*-->');

    return _replace(
      input,
      endRegEx: endRegEx,
      processor: (match) {
        final actionYaml = _loadActionYaml(match);
        final lines = <String>[];

        final inputs = actionYaml['inputs'] as Map<String, dynamic>;

        lines.add('Name | Required | Default | Description');
        lines.add('--- | --- | --- | ---');
        for (final entry in inputs.entries) {
          final name = entry.key;
          final value = entry.value;
          final required = value['required'] ?? false;
          final defaultValue = value['default'] ?? '';
          final description = value['description'] ?? '';

          lines.add(
            '`$name` | ${required ? '**Yes**' : 'No'} | ${defaultValue.isEmpty ? '_<n/a>_' : '`$defaultValue`'} | $description',
          );
        }
        return lines.join('\n');
      },
      startRegEx: startRegEx,
    );
  }

  String _replaceOutputs(String input) {
    final startRegEx = RegExp(r'<!--\s*action_outputs:\s*(?<action>\S*)\s*-->');
    final endRegEx = RegExp(r'<!--\s*/action_outputs\s*-->');

    return _replace(
      input,
      endRegEx: endRegEx,
      processor: (match) {
        final actionYaml = _loadActionYaml(match);

        final outputs = (actionYaml['outputs'] ?? <String, dynamic>{})
            as Map<String, dynamic>;

        if (outputs.isEmpty) {
          return 'No outputs';
        }
        final lines = <String>[];
        lines.add('Name | Description');
        lines.add('--- | ---');
        for (final entry in outputs.entries) {
          final name = entry.key;
          final value = entry.value;
          final description = value['description'] ?? '';

          lines.add(
            '`$name` | $description',
          );
        }
        return lines.join('\n');
      },
      startRegEx: startRegEx,
    );
  }
}
