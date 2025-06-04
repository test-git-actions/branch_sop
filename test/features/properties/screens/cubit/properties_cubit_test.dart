import 'package:bloc_test/bloc_test.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository.dart';
import 'package:branch_links/features/properties/screens/cubit/properties_cubit.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
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

  tearDown(() {
    GetIt.instance.reset();
  });

  const tProperties = [
    Property(id: 'id', name: 'name'),
  ];

  group('getProperties', () {
    void setUpSuccessfulRepositoryCall() {
      when(() => mockPropertiesRepository.getProperties())
          .thenAnswer((_) async => const Right(tProperties));
    }

    blocTest(
      'should call PropertiesRepository.getProperties',
      build: () => PropertiesCubit(),
      setUp: setUpSuccessfulRepositoryCall,
      act: (cubit) => cubit.getProperties(),
      verify: (cubit) =>
          verify(() => mockPropertiesRepository.getProperties()).called(1),
    );

    blocTest(
      'should emit [PropertiesState.loading, PropertiesState.loaded] when the call to the repository is successful',
      build: () => PropertiesCubit(),
      setUp: setUpSuccessfulRepositoryCall,
      act: (cubit) => cubit.getProperties(),
      expect: () => [
        const PropertiesState.loading(),
        const PropertiesState.loaded(tProperties),
      ],
    );

    blocTest(
      'should emit [PropertiesState.loading, PropertiesState.error] when the call to the repository is unsuccessful',
      build: () => PropertiesCubit(),
      setUp: () {
        when(() => mockPropertiesRepository.getProperties()).thenAnswer(
          (_) async => const Left(
            FirestoreFailure.noInternet(
              collection: 'collection',
              id: 'id',
            ),
          ),
        );
      },
      act: (cubit) => cubit.getProperties(),
      expect: () =>
          [const PropertiesState.loading(), const PropertiesState.error()],
    );
  });
}
