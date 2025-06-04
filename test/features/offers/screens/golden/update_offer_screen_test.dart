import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/content_type.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_cubit.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:branch_links/features/offers/screens/update_offer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../utils/mock_http_overrides.dart';

class MockUpdateOfferCubit extends MockCubit<UpdateOfferState>
    implements UpdateOfferCubit {}

void main() {
  late MockUpdateOfferCubit mockUpdateOfferCubit;

  const baseOffer = Offer(
    id: 'id',
    name: 'name',
    customCTA: 'customCTA',
    contentType: ContentType.roomSegment,
    description: 'description',
    image: OfferImage(url: 'url'),
    path: null,
    customUrl: null,
    properties: [],
  );

  const originalOffers = Offers(
    baseOffer,
    baseOffer,
    baseOffer,
    [baseOffer],
    [baseOffer],
    [baseOffer],
  );
  setUp(() async {
    mockUpdateOfferCubit = MockUpdateOfferCubit();

    registerFallbackValue(Uri());
    final imageByteData = await rootBundle.load('assets/images/image.jpeg');
    final imageIntList = imageByteData.buffer.asInt8List();

    HttpOverrides.global = MockHttpOverrides(imageIntList);
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens(
    'UpdateOfferScreen - Loading offers',
    (tester) async {
      when(() => mockUpdateOfferCubit.state)
          .thenAnswer((_) => const UpdateOfferLoading());
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<UpdateOfferCubit>(
              create: (_) => mockUpdateOfferCubit,
              child: const UpdateOfferWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'update_offer_widget_loading_state',
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
    'UpdateOfferScreen - Error loading offers',
    (tester) async {
      when(() => mockUpdateOfferCubit.state)
          .thenAnswer((_) => const UpdateOfferError());
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<UpdateOfferCubit>(
              create: (_) => mockUpdateOfferCubit,
              child: const UpdateOfferWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'update_offer_widget_error_state',
      );
    },
  );

  testGoldens(
    'UpdateOfferScreen - Loaded offers',
    (tester) async {
      when(() => mockUpdateOfferCubit.state).thenAnswer(
        (_) => const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: baseOffer,
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: Offers(
            baseOffer,
            baseOffer,
            baseOffer,
            [baseOffer],
            [baseOffer],
            [baseOffer],
          ),
        ),
      );
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<UpdateOfferCubit>(
              create: (_) => mockUpdateOfferCubit,
              child: const UpdateOfferWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'update_offer_widget_loaded_state',
      );
    },
  );

  testGoldens(
    'UpdateOfferScreen - updating offer',
    (tester) async {
      when(() => mockUpdateOfferCubit.state).thenAnswer(
        (_) => const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: baseOffer,
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: originalOffers,
          isUpdating: true,
        ),
      );
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<UpdateOfferCubit>(
              create: (_) => mockUpdateOfferCubit,
              child: const UpdateOfferWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'update_offer_widget_updating_offer',
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
    'UpdateOfferScreen - error updating offer',
    (tester) async {
      when(() => mockUpdateOfferCubit.state).thenAnswer(
        (_) => const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: baseOffer,
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: originalOffers,
          errorMessage: 'Error',
        ),
      );
      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<UpdateOfferCubit>(
              create: (_) => mockUpdateOfferCubit,
              child: const UpdateOfferWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'update_offer_widget_error_updating_offer',
      );
    },
  );

  testGoldens(
    'UpdateOfferScreen - offer updated',
    (tester) async {
      when(() => mockUpdateOfferCubit.state).thenAnswer(
        (_) => const UpdateOfferData(
          baseOffer: baseOffer,
          updatedOffer: baseOffer,
          selectedAuthState: AuthenticationState.anonymous,
          originalOffers: originalOffers,
          isUpdated: true,
        ),
      );

      await loadAppFonts();

      final builder = DeviceBuilder()
        ..overrideDevicesForAllScenarios(
          devices: [
            Device.tabletLandscape,
          ],
        )
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<UpdateOfferCubit>(
              create: (_) => mockUpdateOfferCubit,
              child: const UpdateOfferWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'update_offer_widget_offer_updated',
      );
    },
  );
}
