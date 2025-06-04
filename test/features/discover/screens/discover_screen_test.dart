//Goldens
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/discover/screens/discover_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  setUp(() {});

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens(
    'Show Discover Screen - Show Static ListView',
    (tester) async {
      await loadAppFonts();
      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.iphone11,
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: const DiscoverScreen(),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'discover_screen_show_static_listview');
    },
  );
}
