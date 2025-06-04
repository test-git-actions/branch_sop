import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/discover/screens/create_page_deep_link/cubit/create_page_deep_link_cubit.dart';
import 'package:branch_links/features/discover/screens/create_page_deep_link/widgets/create_page_deep_link_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockCreatePageDeepLinkCubit extends MockCubit<CreatePageDeepLinkState>
    implements CreatePageDeepLinkCubit {}

void main() {
  late MockCreatePageDeepLinkCubit mockCreatePageDeepLinkCubit;

  const tLink = Link(
    id: '0',
    name: 'Discover',
    link: 'https://uat-links.devtest.vegas/discover',
    path: Constants.discoverPath,
  );

  setUp(() {
    mockCreatePageDeepLinkCubit = MockCreatePageDeepLinkCubit();
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens(
    'CreatePageDeepLinkScreen - Form Loaded',
    (tester) async {
      when(() => mockCreatePageDeepLinkCubit.state).thenAnswer(
        (_) => const CreatePageDeepLinkState.formData(
          link: tLink,
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
              home: BlocProvider<CreatePageDeepLinkCubit>(
                create: (context) => mockCreatePageDeepLinkCubit,
                child: const Scaffold(
                  appBar: CustomAppBar(title: 'Create Page Deep Link'),
                  body: CreatePageDeepLinkForm(),
                ),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'create_page_deep_link_form_loaded',
      );
    },
  );

  testGoldens(
    'CreatePageDeepLinkScreen - Creating Link',
    (tester) async {
      when(() => mockCreatePageDeepLinkCubit.state).thenAnswer(
        (_) => const CreatePageDeepLinkState.formData(
          link: tLink,
          isLoading: true,
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
              home: BlocProvider<CreatePageDeepLinkCubit>(
                create: (context) => mockCreatePageDeepLinkCubit,
                child: const Scaffold(
                  appBar: CustomAppBar(title: 'Create Page Deep Link'),
                  body: CreatePageDeepLinkForm(),
                ),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'create_page_deep_link_creating_link',
        customPump: (tester) async => await tester.pump(
          const Duration(milliseconds: 250),
        ),
      );
    },
  );
  // generated link

  testGoldens(
    'CreatePageDeepLinkScreen - Generated Link',
    (tester) async {
      when(() => mockCreatePageDeepLinkCubit.state).thenAnswer(
        (_) => const CreatePageDeepLinkState.formData(
          link: tLink,
          generatedLink: 'https://uat-links.devtest.vegas/discover',
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
              home: BlocProvider<CreatePageDeepLinkCubit>(
                create: (context) => mockCreatePageDeepLinkCubit,
                child: const Scaffold(
                  appBar: CustomAppBar(title: 'Create Page Deep Link'),
                  body: CreatePageDeepLinkForm(),
                ),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'create_page_deep_link_generated_link',
      );
    },
  );

  testGoldens(
    'CreatePageDeepLinkScreen - Show Api Error Message',
    (tester) async {
      when(() => mockCreatePageDeepLinkCubit.state).thenAnswer(
        (_) => const CreatePageDeepLinkState.formData(
          link: tLink,
          apiErrorMessage: 'Something went wrong',
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
              home: BlocProvider<CreatePageDeepLinkCubit>(
                create: (context) => mockCreatePageDeepLinkCubit,
                child: const Scaffold(
                  appBar: CustomAppBar(title: 'Create Page Deep Link'),
                  body: CreatePageDeepLinkForm(),
                ),
              ),
            ),
          ),
        );

      await tester.pumpDeviceBuilder(builder);

      await screenMatchesGolden(
        tester,
        'create_page_deep_link_show_api_error_message',
      );
    },
  );
}
