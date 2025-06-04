import 'package:branch_links/core/clients/firestore_client/firestore_client.dart';
import 'package:branch_links/features/properties/data/data_sources/property_remote_data_source_impl.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late PropertyRemoteDataSourceImpl propertiesRemoteDataSource;
  late FakeFirebaseFirestore fakeFirestore;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    //
    propertiesRemoteDataSource =
        PropertyRemoteDataSourceImpl(FirestoreClient(fakeFirestore));
  });

  group('getProperties', () {
    late CollectionReference collectionRef;
    const tProperty = Property(id: 'id', name: 'name');

    setUp(() {
      collectionRef = fakeFirestore
          .collection('environments')
          .doc('uat')
          .collection('properties');
    });

    test(
        'should return the properties in the collection when the call is successful',
        () async {
      // arrange
      collectionRef.doc('1').set({'name': 'name', 'id': 'id'});

      // act
      final propertiesEither = await propertiesRemoteDataSource.getProperties();

      // assert
      expect(propertiesEither.isRight(), isTrue);
      propertiesEither.map((properties) => expect(properties, [tProperty]));
    });

    test('should return an empty list when there is no document', () async {
      final propertiesEither = await propertiesRemoteDataSource.getProperties();
      expect(propertiesEither.isRight(), isTrue);
      propertiesEither.map((properties) {
        expect(properties, isEmpty);
      });
    });
  });
}
