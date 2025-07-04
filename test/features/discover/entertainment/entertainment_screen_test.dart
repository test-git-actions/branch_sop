import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/discover/screens/entertainment/cubit/entertainment_cubit.dart';
import 'package:branch_links/features/discover/screens/entertainment/entertainment_screen.dart';
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

class MockEntertainmentCubit extends MockCubit<EntertainmentState>
    implements EntertainmentCubit {}

void main() {
  late MockPropertiesCubit mockPropertiesCubit;
  late MockEntertainmentCubit mockEntertainmentCubit;

  setUp(() async {
    mockPropertiesCubit = MockPropertiesCubit();
    mockEntertainmentCubit = MockEntertainmentCubit();

    registerFallbackValue(Uri());
    final imageByteData = await rootBundle.load('assets/images/image.jpeg');
    final imageIntList = imageByteData.buffer.asInt8List();

    HttpOverrides.global = MockHttpOverrides(imageIntList);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens(
    'EntertainmentScreen - Loading properties',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loading());
      when(() => mockEntertainmentCubit.state)
          .thenAnswer((_) => const EntertainmentState.formData());

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
                  BlocProvider<EntertainmentCubit>(
                    create: (_) => mockEntertainmentCubit,
                  ),
                ],
                child: const EntertainmentWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'entertainment_widget_properties_loading_state',
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
    'EntertainmentScreen - Error properties',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.error());
      when(() => mockEntertainmentCubit.state)
          .thenAnswer((_) => const EntertainmentState.formData());
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
                  BlocProvider<EntertainmentCubit>(
                    create: (_) => mockEntertainmentCubit,
                  ),
                ],
                child: const EntertainmentWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'entertainment_widget_properties_error_state',
      );
    },
  );

  testGoldens(
    'EntertainmentScreen - Loaded properties',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loaded([]));
      when(() => mockEntertainmentCubit.state)
          .thenAnswer((_) => const EntertainmentState.formData());

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
                  BlocProvider<EntertainmentCubit>(
                    create: (_) => mockEntertainmentCubit,
                  ),
                ],
                child: const EntertainmentWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'entertainment_widget_properties_loaded_state',
      );
    },
  );

  testGoldens(
    'EntertainmentScreen - creating deep link',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loaded([]));
      when(() => mockEntertainmentCubit.state).thenAnswer(
        (_) => const EntertainmentState.formData(isLoading: true),
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
                  BlocProvider<EntertainmentCubit>(
                    create: (_) => mockEntertainmentCubit,
                  ),
                ],
                child: const EntertainmentWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'entertainment_widget_creating_deep_link',
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
    'EntertainmentScreen - error creating deep link',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loaded([]));
      when(() => mockEntertainmentCubit.state).thenAnswer(
        (_) => const EntertainmentState.formData(
          errorMessage: 'Unknown error',
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
                  BlocProvider<EntertainmentCubit>(
                    create: (_) => mockEntertainmentCubit,
                  ),
                ],
                child: const EntertainmentWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'entertainment_widget_error_creating_deep_link',
      );
    },
  );

  testGoldens(
    'EntertainmentScreen - deep link created',
    (tester) async {
      when(() => mockPropertiesCubit.state)
          .thenAnswer((_) => const PropertiesState.loaded([]));
      when(() => mockEntertainmentCubit.state).thenAnswer(
        (_) => const EntertainmentState.formData(
          deepLinkURL: 'https://some-deep-link.com',
          metadata: OGMetadata(
            title: Constants.entertainment,
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
                  BlocProvider<EntertainmentCubit>(
                    create: (_) => mockEntertainmentCubit,
                  ),
                ],
                child: const EntertainmentWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'entertainment_widget_deep_link_created',
      );
    },
  );
}
