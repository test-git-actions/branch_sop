import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/product/repository/product_repository.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/presentation/widgets/custom_app_bar.dart';
import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/analytics_keys/screens/cubit/analytics_keys_cubit.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/cubit/create_deep_link_cubit.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/widgets/create_deep_link_form.dart';
import 'package:branch_links/features/discover/screens/create_deep_link/widgets/create_deep_link_widget.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRepository extends Mock implements ProductRepository {}

class MockPropertyRepository extends Mock implements PropertyRepository {}

class MockLinksRepository extends Mock implements LinksRepository {}

void main() {
  late MockProductRepository mockProductRepository;
  late MockPropertyRepository mockPropertyRepository;
  late MockLinksRepository mockDeepLinkRepository;

  const link = Link(
    id: '28',
    name: 'Bellagio',
    link: 'http://link',
  );

  setUp(() {
    mockProductRepository = MockProductRepository();
    GetIt.instance.registerLazySingleton<ProductRepository>(
      () => mockProductRepository,
    );

    mockPropertyRepository = MockPropertyRepository();
    GetIt.instance.registerLazySingleton<PropertyRepository>(
      () => mockPropertyRepository,
    );

    mockDeepLinkRepository = MockLinksRepository();
    GetIt.instance.registerLazySingleton<LinksRepository>(
      () => mockDeepLinkRepository,
    );
  });

  tearDown(() {
    GetIt.instance.reset();
  });

  testGoldens('Create PDPs Deep Link - Form Loaded', (tester) async {
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
                BlocProvider(create: (_) => PropertiesCubit()..getProperties()),
                BlocProvider<CreatePdpLinkCubit>(
                  create: (context) => CreatePdpLinkCubit(
                    productType: ProductType.show,
                    link: link,
                  ),
                ),
              ],
              child: const CreatePdpDeepLinkWidget(),
            ),
          ),
        ),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'create_deep_link_screen_form_loaded',
    );
  });

  testGoldens('Create Deep Link - Creating Deep link', (tester) async {
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
                BlocProvider(create: (_) => PropertiesCubit()..getProperties()),
                BlocProvider<CreatePdpLinkCubit>(
                  create: (context) => CreatePdpLinkCubit(
                    productType: ProductType.show,
                    link: link,
                  ),
                ),
              ],
              child: const Scaffold(
                appBar: CustomAppBar(
                  title: 'Create Pdp Deep Link',
                ),
                body: CreatePdpDeepLinkForm(),
              ),
            ),
          ),
        ),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'create_deep_link_screen_creating_deep_link',
      customPump: (tester) async => await tester.pump(
        // We need to provide a duration to make the fake timer
        // advance, otherwise it remains on the 0 time slot and
        // raises an exception.
        const Duration(milliseconds: 200),
      ),
    );
  });

  testGoldens('Create Deep Link - Deep link created', (tester) async {
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
                BlocProvider(create: (_) => PropertiesCubit()..getProperties()),
                BlocProvider<CreatePdpLinkCubit>(
                  create: (context) => CreatePdpLinkCubit(
                    productType: ProductType.show,
                    link: link,
                  ),
                ),
              ],
              child: const Scaffold(
                appBar: CustomAppBar(
                  title: 'Create Content Details Link',
                ),
                body: CreatePdpDeepLinkForm(),
              ),
            ),
          ),
        ),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'create_deep_link_screen_deep_link_created',
      customPump: (tester) async => await tester.pump(
        const Duration(milliseconds: 200),
      ),
    );
  });

  testGoldens('Create Deep Link - error creating Deep link', (tester) async {
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
                BlocProvider(create: (_) => PropertiesCubit()..getProperties()),
                BlocProvider<CreatePdpLinkCubit>(
                  create: (context) => CreatePdpLinkCubit(
                    productType: ProductType.show,
                    link: link,
                  ),
                ),
              ],
              // ignore: prefer_const_constructors
              child: Scaffold(
                appBar: const CustomAppBar(
                  title: 'Create Content Details Link',
                ),
                body: const CreatePdpDeepLinkForm(),
              ),
            ),
          ),
        ),
      );

    await tester.pumpDeviceBuilder(builder);

    await screenMatchesGolden(
      tester,
      'create_deep_link_error_creating_deep_link',
      customPump: (tester) async => await tester.pump(
        const Duration(milliseconds: 200),
      ),
    );
  });
}
