import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/discover/screens/clubs/clubs_screen.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/screens/static_links_cubit/static_links_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockLinksCubit extends MockCubit<StaticLinksState>
    implements StaticLinksCubit {}

void main() {
  late MockLinksCubit mockLinksCubit;

  setUp(() {
    mockLinksCubit = MockLinksCubit();
  });

  testGoldens(
    'ClubsScreen golden test - loading state',
    (tester) async {
      when(() => mockLinksCubit.state).thenAnswer(
        (invocation) => const StaticLinksState.loading(),
      );
      when(() => mockLinksCubit.getLinks()).thenAnswer((_) async {
        return;
      });

      await loadAppFonts();

      final builder = DeviceBuilder()
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<StaticLinksCubit>(
              create: (_) => mockLinksCubit,
              child: const ClubsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'clubs_screen_loading',
        customPump: (tester) async =>
            await tester.pump(const Duration(seconds: 1)),
      );
    },
  );

  testGoldens(
    'ClubsScreen golden test - error state',
    (tester) async {
      when(() => mockLinksCubit.state).thenAnswer(
        (invocation) => const StaticLinksState.error(),
      );
      when(() => mockLinksCubit.getLinks()).thenAnswer((_) async {
        return;
      });

      await loadAppFonts();

      final builder = DeviceBuilder()
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<StaticLinksCubit>(
              create: (_) => mockLinksCubit,
              child: const ClubsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'clubs_screen_error');
    },
  );

  testGoldens(
    'ClubsScreen golden test - dataLoaded state',
    (tester) async {
      const tClub = Link(
        id: 'testId',
        name: 'testName',
        link: 'testDeepLinkURL',
      );

      when(() => mockLinksCubit.state).thenAnswer(
        (invocation) => StaticLinksState.loaded(
          List.generate(10, (index) => tClub),
        ),
      );
      when(() => mockLinksCubit.getLinks()).thenAnswer((_) async {
        return;
      });

      await loadAppFonts();

      final builder = DeviceBuilder()
        ..addScenario(
          widget: MaterialApp(
            theme: appTheme(),
            debugShowCheckedModeBanner: false,
            home: BlocProvider<StaticLinksCubit>(
              create: (_) => mockLinksCubit,
              child: const ClubsWidget(),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(tester, 'clubs_screen_dataLoaded');
    },
  );
}
