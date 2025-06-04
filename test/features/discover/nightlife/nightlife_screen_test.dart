import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/discover/screens/nightlife/cubit/nightlife_cubit.dart';
import 'package:branch_links/features/discover/screens/nightlife/nightlife_screen.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mock_http_overrides.dart';

class MockPropertiesCubit extends MockCubit<PropertiesState>
    implements PropertiesCubit {}

class MockNightlifeCubit extends MockCubit<NightlifeState>
    implements NightlifeCubit {}

void main() {
  late MockPropertiesCubit mockPropertiesCubit;
  late MockNightlifeCubit mockNightlifeCubit;

  setUp(() async {
    mockPropertiesCubit = MockPropertiesCubit();
    mockNightlifeCubit = MockNightlifeCubit();

    registerFallbackValue(Uri());
    final imageByteData = await rootBundle.load('assets/images/image.jpeg');
    final imageIntList = imageByteData.buffer.asInt8List();

    HttpOverrides.global = MockHttpOverrides(imageIntList);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens(
    'NightlifeScreen - Loading properties',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loading());
      when(() => mockNightlifeCubit.state)
          .thenAnswer((_) => const NightlifeState.formData());
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.iphone11,
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: BlocProvider<AnalyticsKeysCubit>(
            create: (context) => AnalyticsKeysCubit(),
            child: MaterialApp(
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
              home: MultiBlocProvider(
                providers: [
                  BlocProvider<PropertiesCubit>(
                    create: (_) => mockPropertiesCubit,
                  ),
                  BlocProvider<NightlifeCubit>(
                    create: (_) => mockNightlifeCubit,
                  ),
                ],
                child: const NightlifeWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'nightlife_widget_properties_loading_state',
        // The custom pump (tester.pump) only show a frame of
        // a never-ended animation like `CircularProgressIndicator`,
        // otherwise the default pump (tester.pumpAndSettle) waits
        // until the animation ends (infinite) and it timeouts.
        customPump: (tester) async => await tester.pump(
          // We need to provide a duration to make the fake timer
          // advance, otherwise it remains on the 0 time slot and
          // raises an exception.
          const Duration(milliseconds: 250),
        ),
      );
    },
  );

  testGoldens(
    'NightlifeScreen - Error properties',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.error());
      when(() => mockNightlifeCubit.state)
          .thenAnswer((_) => const NightlifeState.formData());
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.iphone11,
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: BlocProvider<AnalyticsKeysCubit>(
            create: (context) => AnalyticsKeysCubit(),
            child: MaterialApp(
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
              home: MultiBlocProvider(
                providers: [
                  BlocProvider<PropertiesCubit>(
                    create: (_) => mockPropertiesCubit,
                  ),
                  BlocProvider<NightlifeCubit>(
                    create: (_) => mockNightlifeCubit,
                  ),
                ],
                child: const NightlifeWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'nightlife_widget_properties_error_state',
      );
    },
  );

  testGoldens(
    'NightlifeScreen - Loaded properties',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loaded([]));
      when(() => mockNightlifeCubit.state)
          .thenAnswer((_) => const NightlifeState.formData());
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.iphone11,
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: BlocProvider<AnalyticsKeysCubit>(
            create: (context) => AnalyticsKeysCubit(),
            child: MaterialApp(
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
              home: MultiBlocProvider(
                providers: [
                  BlocProvider<PropertiesCubit>(
                    create: (_) => mockPropertiesCubit,
                  ),
                  BlocProvider<NightlifeCubit>(
                    create: (_) => mockNightlifeCubit,
                  ),
                ],
                child: const NightlifeWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'nightlife_widget_properties_loaded_state',
      );
    },
  );

  testGoldens(
    'NightlifeScreen - creating deep link',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loaded([]));
      when(() => mockNightlifeCubit.state)
          .thenAnswer((_) => const NightlifeState.formData(isLoading: true));
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.iphone11,
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: BlocProvider<AnalyticsKeysCubit>(
            create: (context) => AnalyticsKeysCubit(),
            child: MaterialApp(
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
              home: MultiBlocProvider(
                providers: [
                  BlocProvider<PropertiesCubit>(
                    create: (_) => mockPropertiesCubit,
                  ),
                  BlocProvider<NightlifeCubit>(
                    create: (_) => mockNightlifeCubit,
                  ),
                ],
                child: const NightlifeWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'nightlife_widget_creating_deep_link',
        // The custom pump (tester.pump) only show a frame of
        // a never-ended animation like `CircularProgressIndicator`,
        // otherwise the default pump (tester.pumpAndSettle) waits
        // until the animation ends (infinite) and it timeouts.
        customPump: (tester) async => await tester.pump(
          // We need to provide a duration to make the fake timer
          // advance, otherwise it remains on the 0 time slot and
          // raises an exception.
          const Duration(milliseconds: 250),
        ),
      );
    },
  );

  testGoldens(
    'NightlifeScreen - error creating deep link',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loaded([]));
      when(() => mockNightlifeCubit.state).thenAnswer(
        (_) => const NightlifeState.formData(
          errorMessage: 'Unknown error.',
        ),
      );
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.iphone11,
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: BlocProvider<AnalyticsKeysCubit>(
            create: (context) => AnalyticsKeysCubit(),
            child: MaterialApp(
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
              home: MultiBlocProvider(
                providers: [
                  BlocProvider<PropertiesCubit>(
                    create: (_) => mockPropertiesCubit,
                  ),
                  BlocProvider<NightlifeCubit>(
                    create: (_) => mockNightlifeCubit,
                  ),
                ],
                child: const NightlifeWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'nightlife_widget_error_creating_deep_link',
      );
    },
  );

  testGoldens(
    'NightlifeScreen - deep link created',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loaded([]));
      when(() => mockNightlifeCubit.state).thenAnswer(
        (_) => const NightlifeState.formData(
          deepLinkURL: 'https://some-deep-link.com',
          metadata: OGMetadata(
            title: Constants.nightlife,
          ),
        ),
      );
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.iphone11,
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: BlocProvider<AnalyticsKeysCubit>(
            create: (context) => AnalyticsKeysCubit(),
            child: MaterialApp(
              theme: appTheme(),
              debugShowCheckedModeBanner: false,
              home: MultiBlocProvider(
                providers: [
                  BlocProvider<PropertiesCubit>(
                    create: (_) => mockPropertiesCubit,
                  ),
                  BlocProvider<NightlifeCubit>(
                    create: (_) => mockNightlifeCubit,
                  ),
                ],
                child: const NightlifeWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'nightlife_widget_deep_link_created',
      );
    },
  );
}
