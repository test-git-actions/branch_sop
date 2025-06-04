import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_client.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:branch_links/core/links/data/sources/links_listing_remote_data_source.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LinksListingRemoteDataSource)
class LinksListingRemoteDataSourceImpl implements LinksListingRemoteDataSource {
  final RealtimeDatabaseClient _realtimeDatabaseClient;

  LinksListingRemoteDataSourceImpl(this._realtimeDatabaseClient);

  @override
  Future<Either<RealtimeDatabaseFailure, List<Link>>> getLinks({
    required DatabasePath databasePath,
  }) {
    final reference = _realtimeDatabaseClient.getReference(databasePath.path);
    return _realtimeDatabaseClient.getAllChildrens(
      reference: reference,
      parser: Link.fromJson,
    );
  }
}
