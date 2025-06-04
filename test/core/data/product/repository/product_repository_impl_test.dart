import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/product/sources/product_remote_data_source.dart';
import 'package:branch_links/core/data/product/repository/product_repository.dart';
import 'package:branch_links/core/data/product/repository/product_repository_impl.dart';
import 'package:branch_links/core/data/product/models/product.dart';
import 'package:branch_links/features/properties/data/data_sources/property_remote_data_source.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockProductRemoteDataSource extends Mock
    implements ProductRemoteDataSource {}

class MockPropertyRemoteDataSource extends Mock
    implements PropertyRemoteDataSource {}

void main() {
  late ProductRepository productRepository;
  late MockProductRemoteDataSource mockProductRemoteDataSource;
  late PropertyRepository propertyRepository;
  late MockPropertyRemoteDataSource mockPropertyRemoteDataSource;

  setUp(() {
    mockProductRemoteDataSource = MockProductRemoteDataSource();
    productRepository = ProductRepositoryImpl(mockProductRemoteDataSource);

    mockPropertyRemoteDataSource = MockPropertyRemoteDataSource();
    propertyRepository = PropertiesRepositoryImpl(mockPropertyRemoteDataSource);
  });

  group(
    'getPropertyById',
    () {
      const tProperty = Property(
        id: '28',
        name: 'propertyName',
        path: 'propertyPath',
        marketId: 'propertyMarketId',
        shortName: 'propertyShortName',
        propertyKey: 'propertyKey',
      );

      const Either<FirestoreFailure, Property> tPropertyEither =
          Right(tProperty);

      void setUpDataSourceCall() {
        when(
          () => mockPropertyRemoteDataSource.getPropertyById('28'),
        ).thenAnswer((_) async => tPropertyEither);
      }

      test(
        'should call MockPropertyRemoteDataSource.getPropertyById',
        () async {
          setUpDataSourceCall();

          await propertyRepository.getPropertyById('28');

          verify(
            () => mockPropertyRemoteDataSource.getPropertyById('28'),
          ).called(1);
        },
      );

      test(
        'should return Property item on success',
        () async {
          setUpDataSourceCall();

          final propertyEither = await propertyRepository.getPropertyById('28');

          expect(propertyEither, tPropertyEither);
          verify(() => mockPropertyRemoteDataSource.getPropertyById('28'));
          verifyNoMoreInteractions(mockPropertyRemoteDataSource);
        },
      );

      test(
        'should return a FirestoreFailure when Property data source fails',
        () async {
          const firestoreFailure = FirestoreFailure.documentDoesNotExist(
            collection: 'properties',
            id: '28',
          );

          when(
            () => propertyRepository.getPropertyById('28'),
          ).thenAnswer(
            (_) async => const Left(firestoreFailure),
          );

          final propertyEither = await propertyRepository.getPropertyById('28');

          expect(
            propertyEither,
            const Left(firestoreFailure),
          );
          verify(() => mockPropertyRemoteDataSource.getPropertyById('28'));
          verifyNoMoreInteractions(mockPropertyRemoteDataSource);
        },
      );
    },
  );

  group('getProductById', () {
    const tPdpItem = Product(
      id: '28',
      name: 'pdpName',
      path: 'pdpPath',
      descriptions: {},
      images: {},
      propertyId: 'pdpPropertyId',
    );

    const Either<FirestoreFailure, Product> tPdpItemEither = Right(tPdpItem);

    void setUpDataSourceCall() {
      when(
        () =>
            mockProductRemoteDataSource.getProductById('28', ProductType.club),
      ).thenAnswer((_) async => tPdpItemEither);
    }

    test(
      'should call MockProductDataSource.getProductById',
      () async {
        setUpDataSourceCall();

        await productRepository.getProductById('28', ProductType.club);

        verify(
          () => mockProductRemoteDataSource.getProductById(
            '28',
            ProductType.club,
          ),
        ).called(1);
      },
    );

    test(
      'should return Product item on success',
      () async {
        setUpDataSourceCall();

        final productEither =
            await productRepository.getProductById('28', ProductType.club);

        expect(productEither, tPdpItemEither);
        verify(
          () => mockProductRemoteDataSource.getProductById(
            '28',
            ProductType.club,
          ),
        );
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      },
    );

    test(
      'should return a FirestoreFailure when Product data source fails',
      () async {
        const firestoreFailure = FirestoreFailure.documentDoesNotExist(
          collection: 'clubs',
          id: '28',
        );

        when(
          () => mockProductRemoteDataSource.getProductById(
            '28',
            ProductType.club,
          ),
        ).thenAnswer(
          (_) async => const Left(firestoreFailure),
        );

        final productEither =
            await productRepository.getProductById('28', ProductType.club);

        expect(
          productEither,
          const Left(firestoreFailure),
        );
        verify(
          () => mockProductRemoteDataSource.getProductById(
            '28',
            ProductType.club,
          ),
        );
        verifyNoMoreInteractions(mockProductRemoteDataSource);
      },
    );
  });
}
