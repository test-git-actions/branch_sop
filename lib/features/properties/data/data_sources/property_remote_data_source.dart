import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:dartz/dartz.dart';

/// A remote data source for accessing property data.
///
/// This interface defines the methods for fetching property data from a remote source.
abstract class PropertyRemoteDataSource {
  /// Fetches a list of properties from a remote data source.
  ///
  /// Returns either a [FirestoreFailure] in case of an error, or
  /// a List of [Property] if the operation is successful.
  Future<Either<FirestoreFailure, List<Property>>> getProperties();

  /// Fetches a property by its id.
  Future<Either<FirestoreFailure, Property>> getPropertyById(
    String propertyId,
  );
}
