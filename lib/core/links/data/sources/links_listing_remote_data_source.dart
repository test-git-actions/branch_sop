import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:dartz/dartz.dart';

/// Abstract class representing a repository for retrieving PDP links
abstract class LinksListingRemoteDataSource {
  Future<Either<RealtimeDatabaseFailure, List<Link>>> getLinks({
    required DatabasePath databasePath,
  });
}
