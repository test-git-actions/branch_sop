import 'package:branch_links/core/clients/firestore_client/collections.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/properties/data/data_sources/property_remote_data_source.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockPropertiesRemoteDataSource extends Mock
    implements PropertyRemoteDataSource {}

void main() {
  late MockPropertiesRemoteDataSource mockPropertiesRemoteDataSource;
  late PropertiesRepositoryImpl propertiesRepository;

  setUp(() {
    mockPropertiesRemoteDataSource = MockPropertiesRemoteDataSource();
    propertiesRepository =
        PropertiesRepositoryImpl(mockPropertiesRemoteDataSource);
  });

  group('getProperties', () {
    const Either<FirestoreFailure, List<Property>> tProperties = Right([
      Property(id: 'id', name: 'name'),
    ]);

    void setUpSuccessfulDataSourceCall() {
      when(() => mockPropertiesRemoteDataSource.getProperties())
          .thenAnswer((_) async => tProperties);
    }

    test(
      'should call PropertiesRemoteDatasource.getProperties',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        await propertiesRepository.getProperties();

        // assert
        verify(() => mockPropertiesRemoteDataSource.getProperties()).called(1);
      },
    );

    test(
      'should return Right(List<PropertyModel>) when the call to the datasource is successful',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        final result = await propertiesRepository.getProperties();

        // assert
        expect(result, tProperties);
      },
    );

    test(
      'should return Left(FirestoreFailure) when the call to the datasource is unsuccessful',
      () async {
        // arrange
        const failure = FirestoreFailure.documentDoesNotExist(
          collection: Collections.data,
          id: 'id',
        );
        when(() => mockPropertiesRemoteDataSource.getProperties()).thenAnswer(
          (_) async => const Left(failure),
        );

        // act
        final result = await propertiesRepository.getProperties();

        // assert
        expect(result, const Left(failure));
      },
    );
  });
}
