import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/checkin/cubit/create_checkin_link_cubit.dart';
import 'package:branch_links/features/checkin/models/create_checkin_link.dart';
import 'package:branch_links/features/checkin/screens/create_checkin_link_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';
import 'package:bloc_test/bloc_test.dart';

class MockCreateCheckinLinkCubit extends MockCubit<CreateCheckinLinkState>
    implements CreateCheckinLinkCubit {}

void main() {
  late MockCreateCheckinLinkCubit mockCreateCheckinLinkCubit;

  setUp(() {
    mockCreateCheckinLinkCubit = MockCreateCheckinLinkCubit();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens(
    'Create CheckIn - form Loaded',
    (tester) async {
      when(() => mockCreateCheckinLinkCubit.state).thenAnswer(
        (_) => const CreateCheckinLinkState(),
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
              home: BlocProvider<CreateCheckinLinkCubit>(
                create: (_) => mockCreateCheckinLinkCubit,
                child: const DeepLinkCreationWidget(),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'create_checkin_link_screen_form_loaded',
      );
    },
  );

  testGoldens('Create CheckIn - loading generated link', (tester) async {
    when(() => mockCreateCheckinLinkCubit.state).thenAnswer(
      (_) => const CreateCheckinLinkState(
        deepLink: CheckinLink(
          lastName: 'lastName',
          reservationConfirmationNumber: '123456',
          adobeDeepLinkParameter: 'adobeDeepLinkParameter',
        ),
        isLoading: true,
        generatedDeepLink: null,
        apiErrorMessage: null,
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
            home: BlocProvider<CreateCheckinLinkCubit>(
              create: (_) => mockCreateCheckinLinkCubit,
              child: const DeepLinkCreationWidget(),
            ),
          ),
        ),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'create_checkin_link_screen_loading',
      customPump: (tester) async => await tester.pump(
        const Duration(
          seconds: 2,
        ),
      ),
    );
  });

  testGoldens('Create CheckIn - show error message', (tester) async {
    when(() => mockCreateCheckinLinkCubit.state).thenAnswer(
      (_) => const CreateCheckinLinkState(
        deepLink: CheckinLink(
          lastName: 'lastName',
          reservationConfirmationNumber: '123456',
          adobeDeepLinkParameter: 'adobeDeepLinkParameter',
        ),
        isLoading: false,
        generatedDeepLink: null,
        apiErrorMessage: 'error message',
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
            home: BlocProvider<CreateCheckinLinkCubit>(
              create: (_) => mockCreateCheckinLinkCubit,
              child: const DeepLinkCreationWidget(),
            ),
          ),
        ),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'create_checkin_link_screen_show_error_message',
    );
  });

  testGoldens('Create CheckIn - deep link created', (tester) async {
    when(() => mockCreateCheckinLinkCubit.state).thenAnswer(
      (_) => const CreateCheckinLinkState(
        deepLink: CheckinLink(
          lastName: 'lastName',
          reservationConfirmationNumber: '123456',
          adobeDeepLinkParameter: 'adobeDeepLinkParameter',
        ),
        isLoading: false,
        generatedDeepLink: 'https://uat-branch.app.link/123456',
        apiErrorMessage: null,
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
            home: BlocProvider<CreateCheckinLinkCubit>(
              create: (_) => mockCreateCheckinLinkCubit,
              child: const DeepLinkCreationWidget(),
            ),
          ),
        ),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'create_checkin_link_screen_deep_link_created',
    );
  });
}
