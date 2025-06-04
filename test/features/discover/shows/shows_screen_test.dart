import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/discover/screens/shows/shows_screen.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/screens/static_links_cubit/static_links_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockLinksCubit extends MockCubit<StaticLinksState>
    implements StaticLinksCubit {}

void main() {
  late MockLinksCubit mockLinksCubit;

  setUp(() {
    mockLinksCubit = MockLinksCubit();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens(
    'ShowsWidget - Loading state',
    (tester) async {
      when(() => mockLinksCubit.state)
          .thenAnswer((invocation) => const StaticLinksState.loading());
      when(() => mockLinksCubit.getLinks()).thenAnswer((_) async {
        return;
      });

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
            home: BlocProvider<StaticLinksCubit>(
              create: (_) => mockLinksCubit,
              child: const ShowsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'shows_widget_loading_state',
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
    'ShowsWidget - Error state',
    (tester) async {
      when(() => mockLinksCubit.state)
          .thenAnswer((invocation) => const StaticLinksState.error());
      when(() => mockLinksCubit.getLinks()).thenAnswer((_) async {
        return;
      });

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
            home: BlocProvider<StaticLinksCubit>(
              create: (_) => mockLinksCubit,
              child: const ShowsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'shows_widget_error_state');
    },
  );

  testGoldens(
    'ShowsWidget - Loaded state with one show',
    (tester) async {
      const tShow = Link(
        id: 'id',
        name: 'Tournament of Kings',
        link: 'link',
      );

      when(() => mockLinksCubit.state)
          .thenAnswer((invocation) => const StaticLinksState.loaded([tShow]));
      when(() => mockLinksCubit.getLinks()).thenAnswer((_) async {
        return;
      });

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
            home: BlocProvider<StaticLinksCubit>(
              create: (_) => mockLinksCubit,
              child: const ShowsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'shows_widget_loaded_state_one_show');
    },
  );

  testGoldens(
    'ShowsWidget - Loaded state with many shows',
    (tester) async {
      const tShow = Link(
        id: 'id',
        name: 'Tournament of Kings',
        link: 'link',
      );

      when(() => mockLinksCubit.state).thenAnswer(
        (invocation) =>
            StaticLinksState.loaded(List.generate(30, (index) => tShow)),
      );
      when(() => mockLinksCubit.getLinks()).thenAnswer((_) async {
        return;
      });

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
            home: BlocProvider<StaticLinksCubit>(
              create: (_) => mockLinksCubit,
              child: const ShowsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'shows_widget_loaded_state_with_many_shows',
      );
    },
  );
}
