import 'package:branch_links/core/clients/firestore_client/firestore_client.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/data/product/sources/product_remote_data_source_impl.dart';
import 'package:branch_links/core/data/product/models/product.dart';
import 'package:branch_links/features/properties/data/data_sources/property_remote_data_source_impl.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late ProductRemoteDataSourceImpl productRemoteDataSource;
  late PropertyRemoteDataSourceImpl propertyRemoteDataSource;
  late FakeFirebaseFirestore fakeFirebaseFirestore;
  late CollectionReference propertiesCollectionRef;
  late CollectionReference clubsCollectionRef;

  setUp(() {
    fakeFirebaseFirestore = FakeFirebaseFirestore();
    propertiesCollectionRef = fakeFirebaseFirestore
        .collection('environments')
        .doc('uat')
        .collection('properties');
    clubsCollectionRef = fakeFirebaseFirestore
        .collection('environments')
        .doc('uat')
        .collection('clubs');
    productRemoteDataSource = ProductRemoteDataSourceImpl(
      FirestoreClient(fakeFirebaseFirestore),
    );
    propertyRemoteDataSource = PropertyRemoteDataSourceImpl(
      FirestoreClient(fakeFirebaseFirestore),
    );
  });

  test('getPropertyById should return Property on success', () async {
    // Arrange
    const itemId = '28';

    // Setup properties collection with a single item
    const property = Property(
      id: '28',
      name: 'propertyName',
      path: 'propertyPath',
      marketId: 'propertyMarketId',
      shortName: 'propertyShortName',
      propertyKey: 'propertyKey',
    );
    propertiesCollectionRef.doc(itemId).set(property.toJson());

    // Act
    final propertyEither =
        await propertyRemoteDataSource.getPropertyById(itemId);

    // Assert
    expect(propertyEither.isRight(), true);
    propertyEither.map((property) {
      expect(property, isA<Property>());
      expect(property.id, itemId);
    });
  });

  test('getProductById should return Product on success', () async {
    // Arrange
    const itemId = '28';

    // Setup clubs collection with a single item
    const pdpType = ProductType.club;
    const pdpItem = Product(
      id: '28',
      name: 'pdpName',
      path: 'pdpPath',
      descriptions: {},
      images: {},
      propertyId: 'pdpPropertyId',
    );
    clubsCollectionRef.doc(itemId).set(pdpItem.toJson());

    final pdpEither =
        await productRemoteDataSource.getProductById(itemId, pdpType);

    // Assert
    // expect(pdpEither, equals(const Right(pdpItem)));
    expect(pdpEither.isRight(), true);
    pdpEither.map((product) {
      expect(product, isA<Product>());
      expect(product.id, itemId);
    });
  });

  test('getPropertyById should return FirestoreFailure on failure', () async {
    // Arrange
    const itemId = '28';
    const failure = FirestoreFailure.documentDoesNotExist(
      collection: 'properties',
      id: '28',
    );

    // Act
    final propertyEither =
        await propertyRemoteDataSource.getPropertyById(itemId);

    // Assert
    // Receive a Left(FirestoreFailure) from the Either
    expect(
      propertyEither,
      equals(const Left(failure)),
    );
  });

  test('getShowById should return FirestoreFailure on failure', () async {
    // Arrange
    const itemId = '28';
    const failure = FirestoreFailure.documentDoesNotExist(
      collection: 'clubs',
      id: '28',
    );

    // Act
    final pdpEither = await productRemoteDataSource.getProductById(
      itemId,
      ProductType.club,
    );

    // Assert
    // Receive a Left(FirestoreFailure) from the Either
    expect(
      pdpEither,
      equals(const Left(failure)),
    );
  });
}
