import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/properties/data/data_sources/property_remote_data_source.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:branch_links/features/properties/data/repositories/property_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: PropertyRepository)
class PropertiesRepositoryImpl implements PropertyRepository {
  final PropertyRemoteDataSource _propertiesRemoteDataSource;

  PropertiesRepositoryImpl(this._propertiesRemoteDataSource);

  @override
  Future<Either<FirestoreFailure, List<Property>>> getProperties() {
    return _propertiesRemoteDataSource.getProperties();
  }

  @override
  Future<Either<FirestoreFailure, Property>> getPropertyById(
    String propertyId,
  ) {
    return _propertiesRemoteDataSource.getPropertyById(
      propertyId,
    );
  }
}
