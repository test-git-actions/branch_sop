import 'package:args/args.dart';
import 'package:auto_build_number/build_number_incrementer.dart';

void main(List<String> args) async {
  final parser = ArgParser();
  parser.addOption(
    'branch',
    abbr: 'b',
    defaultsTo: 'build_number',
    mandatory: false,
  );
  parser.addOption(
    'file',
    abbr: 'f',
    defaultsTo: 'build.number',
    mandatory: false,
  );

  final parsed = parser.parse(args);
  final inc = BuildNumberIncrementer(
    branch: parsed['branch'],
    fileName: parsed['file'],
  );

  final number = await inc.updateBuildNumber();
  // ignore: avoid_print
  print('[Build Number]: $number');
}
