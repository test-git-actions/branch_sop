import 'package:branch_links/env.dart';
import 'package:branch_links/core/clients/api_client/api_client.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/constants/endpoints.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/sources/links_creation_remote_data_source.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

@LazySingleton(as: LinksCreationRemoteDataSource)
class LinksCreationRemoteDataSourceImpl
    implements LinksCreationRemoteDataSource {
  final ApiClient _apiClient;
  static const branchEndpoint = Endpoints.branchIO;
  static const deepLinkEndpoint = Endpoints.deepLink;

  LinksCreationRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Either<ApiFailure, String>> createLink({
    required String deepLinkPath,
    String? feature,
    String? alias,
    OGMetadata? metadata,
    String? adobeParameter,
    Map<String, dynamic> additionalData = const {},
    Map<String, dynamic>? analyticsKeys = const {},
  }) async {
    final linkEither = await _apiClient.post<String>(
      branchEndpoint,
      queryParameters: {
        'app_id': Constants.branchAppID,
        if (adobeParameter != null)
          Constants.adobeDeepLinkParameter: adobeParameter,
      },
      body: {
        'branch_key': Env().branchKey,
        if (feature != null) 'feature': feature,
        if (alias != null) 'alias': alias,
        'data': {
          '\$deeplink_path': deepLinkPath,
          if (metadata != null) ...metadata.toJson(),
          ...additionalData,
        },
        if (analyticsKeys != null) 'analytics': analyticsKeys,
      },
      parser: extractUrl,
    );

    return linkEither.fold(
      (failure) {
        if (failure.statusCode == 409 && alias != null) {
          return right('$deepLinkEndpoint$alias');
        }

        return left(failure);
      },
      (deepLinkURL) => right(deepLinkURL),
    );
  }

  @override
  Future<Either<ApiFailure, LinkDetails>> getGeneratedLinkDetails(
    String link,
  ) {
    return _apiClient.get<LinkDetails>(
      branchEndpoint,
      queryParameters: {
        'url': link,
        'branch_key': Env().branchKey,
      },
      parser: LinkDetails.fromJson,
    );
  }
}

@visibleForTesting
String extractUrl(Map<String, dynamic> json) => json['url'];
