import 'package:branch_links/core/clients/firestore_client/collections.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_client.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/properties/data/data_sources/property_remote_data_source.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart' hide Environment;

@LazySingleton(as: PropertyRemoteDataSource)
class PropertyRemoteDataSourceImpl implements PropertyRemoteDataSource {
  final FirestoreClient _firestoreClient;

  PropertyRemoteDataSourceImpl(this._firestoreClient);

  @override
  Future<Either<FirestoreFailure, List<Property>>> getProperties() {
    final collectionRef = _firestoreClient.parsedCollectionRef(
      Collections.properties,
      Property.fromJson,
    );

    return _firestoreClient.getAllDocuments(collectionRef: collectionRef);
  }

  @override
  Future<Either<FirestoreFailure, Property>> getPropertyById(
    String propertyId,
  ) {
    final collectionRef = _firestoreClient.parsedCollectionRef(
      Collections.properties,
      Property.fromJson,
    );

    return _firestoreClient.getDocumentById(
      collectionRef: collectionRef,
      id: propertyId,
    );
  }
}
