import 'package:branch_links/core/screens/theme.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:branch_links/features/properties/screens/widgets/properties_options_widget.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:mocktail/mocktail.dart';

class MockPropertiesRepository extends Mock implements PropertyRepository {}

void main() {
  late MockPropertiesRepository mockPropertiesRepository;

  setUp(() {
    mockPropertiesRepository = MockPropertiesRepository();
    GetIt.instance.registerLazySingleton<PropertyRepository>(
      () => mockPropertiesRepository,
    );
  });

  testGoldens(
    'PropertiesOptionsWidget',
    (tester) async {
      const tProperties = [
        Property(id: 'id', name: 'name'),
      ];
      when(() => mockPropertiesRepository.getProperties())
          .thenAnswer((_) async => const Right(tProperties));
      await loadAppFonts();

      final builder = GoldenBuilder.grid(columns: 2, widthToHeightRatio: 1)
        ..addScenario(
          'Loading',
          Theme(
            data: appTheme(),
            child: BlocProvider(
              create: (context) => PropertiesCubit(),
              child: PropertiesOptionsWidget(onSelected: (_) {}),
            ),
          ),
        )
        ..addScenario(
          'Loaded',
          Theme(
            data: appTheme(),
            child: Theme(
              data: appTheme(),
              child: BlocProvider(
                create: (context) => PropertiesCubit()..getProperties(),
                child: PropertiesOptionsWidget(onSelected: (_) {}),
              ),
            ),
          ),
        );

      await tester.pumpWidgetBuilder(builder.build());

      await screenMatchesGolden(
        tester, 'properties_options_widget',
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
}
