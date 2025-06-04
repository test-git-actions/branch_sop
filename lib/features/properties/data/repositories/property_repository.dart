import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:dartz/dartz.dart';

/// A repository for accessing property data.
///
/// This interface defines the methods for retrieving property data.
abstract class PropertyRepository {
  /// Retrieves a list of properties from the repository.
  ///
  /// Returns either a [FirestoreFailure] in case of an error, or a
  /// List of [Property] if the operation is successful.
  Future<Either<FirestoreFailure, List<Property>>> getProperties();

  /// Retrieves a property by its id from the repository.
  Future<Either<FirestoreFailure, Property>> getPropertyById(
    String propertyId,
  );
}
