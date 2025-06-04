import 'package:branch_links/core/clients/api_client/api_client.dart';
import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/constants/constants.dart';
import 'package:branch_links/core/constants/endpoints.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/sources/links_creation_remote_data_source_impl.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockApiClient extends Mock implements ApiClient {}

void main() {
  late MockApiClient mockApiClient;
  late LinksCreationRemoteDataSourceImpl dataSource;

  setUp(() {
    mockApiClient = MockApiClient();
    dataSource = LinksCreationRemoteDataSourceImpl(mockApiClient);
  });

  group('createLink', () {
    const tFeature = 'feature';
    const tAlias = 'alias';
    const tMetadata = OGMetadata();
    const tDeepLinkPath = 'deepLinkPath';
    const tAdditionalData = {'data': 'data'};
    const tDeepLinkURL = 'deeplink';
    const tAdobeParameter = 'adobeParameter';
    const tAnalyticsKeys = {'analytics': 'analytics'};

    void setUpSuccessfulApiCall() {
      when(
        () => mockApiClient.post<String>(
          any(),
          body: any(named: 'body'),
          queryParameters: any(named: 'queryParameters'),
          parser: any(named: 'parser'),
        ),
      ).thenAnswer((_) async => const Right(tDeepLinkURL));
    }

    test(
      'should call ApiClient.post with the correct parameters',
      () async {
        // arrange
        setUpSuccessfulApiCall();

        // act
        await dataSource.createLink(
          feature: tFeature,
          alias: tAlias,
          metadata: tMetadata,
          adobeParameter: tAdobeParameter,
          deepLinkPath: tDeepLinkPath,
          additionalData: tAdditionalData,
          analyticsKeys: tAnalyticsKeys,
        );

        // assert
        verify(
          () => mockApiClient.post<String>(
            Endpoints.branchIO,
            queryParameters: {
              'app_id': Constants.branchAppID,
              Constants.adobeDeepLinkParameter: tAdobeParameter,
            },
            body: {
              'branch_key': Constants.devBranchKey,
              'feature': tFeature,
              'alias': tAlias,
              'data': {
                '\$deeplink_path': tDeepLinkPath,
                ...tMetadata.toJson(),
                ...tAdditionalData,
              },
              'analytics': tAnalyticsKeys,
            },
            parser: extractUrl,
          ),
        );
      },
    );

    test(
      'should return Right(String) when the call to the API is successful',
      () async {
        // arrange
        setUpSuccessfulApiCall();

        // act
        final result = await dataSource.createLink(
          feature: tFeature,
          alias: tAlias,
          metadata: tMetadata,
          deepLinkPath: tDeepLinkPath,
          additionalData: tAdditionalData,
          analyticsKeys: tAnalyticsKeys,
        );

        // assert
        expect(result, const Right(tDeepLinkURL));
      },
    );

    test(
      'should return Right(String) when the call to the API is unsuccessful with statusCode 409 and alias is not null',
      () async {
        // arrange
        when(
          () => mockApiClient.post<String>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            body: any(named: 'body'),
            parser: any(named: 'parser'),
          ),
        ).thenAnswer(
          (_) async =>
              Left(ApiFailure.fromStatusCode(409, endpoint: 'endpoint')),
        );

        // act
        final result = await dataSource.createLink(
          feature: tFeature,
          alias: tAlias,
          metadata: tMetadata,
          deepLinkPath: tDeepLinkPath,
          additionalData: tAdditionalData,
        );

        // assert
        expect(result, const Right(Endpoints.deepLink + tAlias));
      },
    );

    test(
      'should return Left(ApiFailure) when the call to the API is unsuccessful',
      () async {
        // arrange
        final tFailure = ApiFailure.fromStatusCode(400, endpoint: 'endpoint');
        when(
          () => mockApiClient.post<String>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            body: any(named: 'body'),
            parser: any(named: 'parser'),
          ),
        ).thenAnswer(
          (_) async => Left(tFailure),
        );

        // act
        final result = await dataSource.createLink(
          feature: tFeature,
          alias: tAlias,
          metadata: tMetadata,
          deepLinkPath: tDeepLinkPath,
          additionalData: tAdditionalData,
        );

        // assert
        expect(result, Left(tFailure));
      },
    );
  });

  group('getGeneratedLinkDetails', () {
    const tLink = 'link';
    final tLinkDetails = LinkDetails(
      id: 'id',
      feature: 'feature',
      deepLinkPath: Uri(),
      metadata: const OGMetadata(),
    );

    void setUpSuccessfulApiCall() {
      when(
        () => mockApiClient.get<LinkDetails>(
          any(),
          queryParameters: any(named: 'queryParameters'),
          parser: any(named: 'parser'),
        ),
      ).thenAnswer((_) async => Right(tLinkDetails));
    }

    test(
      'should call ApiClient.get with the correct parameters',
      () async {
        // arrange
        setUpSuccessfulApiCall();

        // act
        await dataSource.getGeneratedLinkDetails(tLink);

        // assert
        verify(
          () => mockApiClient.get<LinkDetails>(
            Endpoints.branchIO,
            queryParameters: {
              'url': tLink,
              'branch_key': Constants.devBranchKey,
            },
            parser: LinkDetails.fromJson,
          ),
        );
      },
    );

    test(
      'should return Right(LinkDetails) when the call to the API is successful',
      () async {
        // arrange
        setUpSuccessfulApiCall();

        // act
        final generatedLinkDetailsEither =
            await dataSource.getGeneratedLinkDetails(tLink);

        // assert
        expect(generatedLinkDetailsEither, Right(tLinkDetails));
      },
    );

    test(
      'should return Left(ApiFailure) when the call to the API is unsuccessful',
      () async {
        // arrange
        when(
          () => mockApiClient.get<LinkDetails>(
            any(),
            queryParameters: any(named: 'queryParameters'),
            parser: any(named: 'parser'),
          ),
        ).thenAnswer((_) async => const Left(ApiFailure.connectionError()));

        // act
        final generatedLinkDetailsEither =
            await dataSource.getGeneratedLinkDetails(tLink);

        // assert
        expect(
          generatedLinkDetailsEither,
          const Left(ApiFailure.connectionError()),
        );
      },
    );
  });
}
