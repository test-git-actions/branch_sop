import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/constants/filters_constants.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/link_details/screens/cubit/link_details_cubit.dart';
import 'package:branch_links/features/link_details/screens/link_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils/mock_http_overrides.dart';

class MockLinkDetailsCubit extends MockCubit<LinkDetailsState>
    implements LinkDetailsCubit {}

void main() {
  late MockLinkDetailsCubit mockLinkDetailsCubit;

  setUp(() async {
    mockLinkDetailsCubit = MockLinkDetailsCubit();

    registerFallbackValue(Uri());
    final imageByteData = await rootBundle.load('assets/images/image.jpeg');
    final imageIntList = imageByteData.buffer.asInt8List();

    HttpOverrides.global = MockHttpOverrides(imageIntList);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens(
    'LinkDetailsWidget - Initial state',
    (tester) async {
      when(() => mockLinkDetailsCubit.state)
          .thenAnswer((invocation) => const LinkDetailsState.initial());

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
            home: BlocProvider<LinkDetailsCubit>(
              create: (_) => mockLinkDetailsCubit,
              child: const LinkDetailsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'link_details_widget_initial_state');
    },
  );

  testGoldens(
    'LinkDetailsWidget - Loading state',
    (tester) async {
      when(() => mockLinkDetailsCubit.state)
          .thenAnswer((invocation) => const LinkDetailsState.loading());

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
            home: BlocProvider<LinkDetailsCubit>(
              create: (_) => mockLinkDetailsCubit,
              child: const LinkDetailsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'link_details_widget_loading_state',
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
    'LinkDetailsWidget - Error state',
    (tester) async {
      when(() => mockLinkDetailsCubit.state)
          .thenAnswer((invocation) => const LinkDetailsState.error());

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
            home: BlocProvider<LinkDetailsCubit>(
              create: (_) => mockLinkDetailsCubit,
              child: const LinkDetailsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'link_details_widget_error_state');
    },
  );

  testGoldens(
    'LinkDetailsWidget - Loaded state',
    (tester) async {
      const tLink = 'link';
      final tLinkDetails = LinkDetails(
        id: 'id',
        feature: 'SOP',
        deepLinkPath: Uri(
          path: '/discover/dining',
          queryParameters: {
            FilterConstants.filter: 'id1,id2',
            FilterConstants.propertyId: 'propertyId1, propertyId2',
          },
        ),
        metadata: const OGMetadata(
          title: 'Dining',
        ),
      );

      when(() => mockLinkDetailsCubit.state).thenAnswer(
        (invocation) => LinkDetailsState.loaded(tLink, tLinkDetails),
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
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<LinkDetailsCubit>(
              create: (_) => mockLinkDetailsCubit,
              child: const LinkDetailsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'link_details_widget_loaded_state',
      );
    },
  );
}
