import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:dartz/dartz.dart';

/// Abstract class representing a repository for handling deep links.
abstract class LinksRepository {
  /// Returns a list of detail links for a section.
  Future<Either<RealtimeDatabaseFailure, List<Link>>> getLinks({
    required DatabasePath databasePath,
  });

  /// Creates a deep link URL for a given content.
  ///
  /// The [deepLinkPath] parameter specifies the path for the deep link.
  ///
  /// Optionally, you can specify the [feature] and [alias] for the deep link.
  ///
  /// The [metadata] parameter allows you to attach additional metadata for the deep link.
  ///
  /// The [adobeParameter] parameter allows you to attach an Adobe parameter for the deep link.
  ///
  /// You can also include custom [additionalData] as a map of key-value pairs.
  ///
  /// Returns either an [ApiFailure] in case of an error, or a [String] representing the
  /// generated deep link URL if the operation is successful.
  Future<Either<ApiFailure, String>> createLink({
    required String deepLinkPath,
    String? feature,
    String? alias,
    OGMetadata? metadata,
    String? adobeParameter,
    Map<String, dynamic> additionalData = const {},
    Map<String, dynamic>? analyticsKeys = const {},
  });

  /// Get the details from the specified link
  Future<Either<ApiFailure, LinkDetails>> getGeneratedLinkDetails(
    String link,
  );
}
