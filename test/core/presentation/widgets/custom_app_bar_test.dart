import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/env.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  tearDown(() => GetIt.instance.reset());

  testGoldens(
    'Custom App Bar on uat environment',
    (tester) async {
      Env().environment = Environment.uat;

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
            home: const Scaffold(
              appBar: CustomAppBar(
                title: 'Title',
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'uat_custom_app_bar',
      );
    },
  );

  testGoldens(
    'Custom App Bar on preprod environment',
    (tester) async {
      Env().environment = Environment.preProd;

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
            home: const Scaffold(
              appBar: CustomAppBar(
                title: 'Title',
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'preprod_custom_app_bar',
      );
    },
  );

  testGoldens(
    'Custom App Bar on qa4 environment',
    (tester) async {
      Env().environment = Environment.qa4;

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
            home: const Scaffold(
              appBar: CustomAppBar(
                title: 'Title',
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'qa4_custom_app_bar',
      );
    },
  );

  testGoldens(
    'Custom App Bar on prod environment',
    (tester) async {
      Env.test(Flavor.prod);

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
            home: const Scaffold(
              appBar: CustomAppBar(
                title: 'Title',
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'prod_custom_app_bar',
      );
    },
  );
}
