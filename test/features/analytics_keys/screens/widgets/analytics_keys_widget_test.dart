import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/analytics_keys/screens/widgets/analytics_keys_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:golden_toolkit/golden_toolkit.dart';

void main() {
  testGoldens(
    'Analytics Keys Widget',
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
            home: BlocProvider<AnalyticsKeysCubit>(
              create: (context) => AnalyticsKeysCubit(),
              child: const AnalyticsKeysWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'analytics_keys_widget_fields',
      );
    },
  );
}
