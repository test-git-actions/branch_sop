import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

import 'utils/local_file_comparator_with_threshold.dart';

bool shouldSetupUI = true;

/// This file is executed before any test in a Flutter application
/// This allows us to remove duplicate code, to be placed here, instead
Future<void> testExecutable(FutureOr<void> Function() testMain) async {
  /// Configures threshold for all the golden tests.
  const goldenTolerance = 0.001;

  return GoldenToolkit.runWithConfiguration(
    () async {
      if (goldenFileComparator is LocalFileComparator) {
        final testUrl = (goldenFileComparator as LocalFileComparator).basedir;

        goldenFileComparator = LocalFileComparatorWithThreshold(
          // flutter_test's LocalFileComparator expects the test's URI to be passed
          // as an argument, but it only uses it to parse the baseDir in order to
          // obtain the directory where the golden tests will be placed.
          // As such, we use the default `testUrl`, which is only the `baseDir` and
          // append a generically named `test.dart` so that the `baseDir` is
          // properly extracted.
          Uri.parse('$testUrl/test.dart'),
          goldenTolerance,
        );
      } else {
        throw Exception(
          'Expected `goldenFileComparator` to be of type `LocalFileComparator`, '
          'but it is of type `${goldenFileComparator.runtimeType}`',
        );
      }

      tearDown(() async {
        //await Env.sl.reset();
      });

      tearDownAll(() {
        shouldSetupUI = true;
      });
      // setupFonts() calls TestWidgetsFlutterBinding.ensureInitialized()
      // This line can break network testing, hence the flag
      if (shouldSetupUI) {
        await loadAppFonts();
      }

      await testMain();
    },
    config: GoldenToolkitConfiguration(
      deviceFileNameFactory: (name, device) => '$name - ${device.name}\n',
    ),
  );
}
