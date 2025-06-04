import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/sources/links_creation_remote_data_source.dart';
import 'package:branch_links/core/links/data/sources/links_listing_remote_data_source.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: LinksRepository)
class LinksRepositoryImpl implements LinksRepository {
  final LinksListingRemoteDataSource _detailsLinksRemoteDataSource;
  final LinksCreationRemoteDataSource _linksCreationRemoteDataSource;

  LinksRepositoryImpl({
    required LinksListingRemoteDataSource detailsLinksRemoteDataSource,
    required LinksCreationRemoteDataSource linksCreationRemoteDataSource,
  })  : _detailsLinksRemoteDataSource = detailsLinksRemoteDataSource,
        _linksCreationRemoteDataSource = linksCreationRemoteDataSource;

  @override
  Future<Either<RealtimeDatabaseFailure, List<Link>>> getLinks({
    required DatabasePath databasePath,
  }) {
    return _detailsLinksRemoteDataSource.getLinks(databasePath: databasePath);
  }

  @override
  Future<Either<ApiFailure, String>> createLink({
    required String deepLinkPath,
    String? feature,
    String? alias,
    OGMetadata? metadata,
    String? adobeParameter,
    Map<String, dynamic> additionalData = const {},
    Map<String, dynamic>? analyticsKeys = const {},
  }) {
    return _linksCreationRemoteDataSource.createLink(
      feature: feature,
      alias: alias,
      metadata: metadata,
      adobeParameter: adobeParameter,
      deepLinkPath: deepLinkPath,
      additionalData: additionalData,
      analyticsKeys: analyticsKeys,
    );
  }

  @override
  Future<Either<ApiFailure, LinkDetails>> getGeneratedLinkDetails(
    String link,
  ) {
    return _linksCreationRemoteDataSource.getGeneratedLinkDetails(link);
  }
}
