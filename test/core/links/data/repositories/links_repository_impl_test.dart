import 'package:branch_links/core/clients/api_client/api_failure.dart';
import 'package:branch_links/core/clients/realtime_database_client/database_path.dart';
import 'package:branch_links/core/clients/realtime_database_client/realtime_database_failure.dart';
import 'package:branch_links/core/links/data/models/link_details.dart';
import 'package:branch_links/core/links/data/sources/links_creation_remote_data_source.dart';
import 'package:branch_links/core/links/data/sources/links_listing_remote_data_source.dart';
import 'package:branch_links/core/links/data/repository/links_repository.dart';
import 'package:branch_links/core/links/data/repository/links_repository_impl.dart';
import 'package:branch_links/core/links/data/models/link.dart';
import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockLinksListingRemoteDataSource extends Mock
    implements LinksListingRemoteDataSource {}

class MockLinksCreationRemoteDataSource extends Mock
    implements LinksCreationRemoteDataSource {}

void main() {
  late MockLinksListingRemoteDataSource mockLinksListingRemoteDataSource;
  late MockLinksCreationRemoteDataSource mockLinksCreationRemoteDataSource;
  late LinksRepository linksRepository;

  setUp(() {
    mockLinksListingRemoteDataSource = MockLinksListingRemoteDataSource();
    mockLinksCreationRemoteDataSource = MockLinksCreationRemoteDataSource();
    linksRepository = LinksRepositoryImpl(
      detailsLinksRemoteDataSource: mockLinksListingRemoteDataSource,
      linksCreationRemoteDataSource: mockLinksCreationRemoteDataSource,
    );
  });

  group('getLinks', () {
    const Either<RealtimeDatabaseFailure, List<Link>> tStaticLinks = Right([
      Link(id: 'id', name: 'Showstopping Packages', link: ''),
      Link(
        id: 'id',
        name: 'America\'s Got Talent presents Superstars Live',
        link: '',
      ),
      Link(id: 'id', name: 'Blue Man Group', link: ''),
      Link(
        id: 'id',
        name: 'Brad Garrett\'s Comedy Club',
        link: '',
      ),
    ]);

    void setUpSuccessfulDataSourceCall() {
      when(
        () => mockLinksListingRemoteDataSource.getLinks(
          databasePath: any(named: 'databasePath'),
        ),
      ).thenAnswer((_) async => tStaticLinks);
    }

    const tDatabasePath = DatabasePath.clubs;

    setUpAll(() {
      registerFallbackValue(tDatabasePath);
    });

    test(
      'should call LinksListingRemoteDataSource.getLinks',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        await linksRepository.getLinks(databasePath: tDatabasePath);

        // assert
        verify(
          () => mockLinksListingRemoteDataSource.getLinks(
            databasePath: tDatabasePath,
          ),
        ).called(1);
      },
    );

    test(
      'should return Right(List<DetailLinkModel>) when the call to the datasource is successful',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        final result =
            await linksRepository.getLinks(databasePath: tDatabasePath);

        // assert
        expect(result, tStaticLinks);
      },
    );

    test(
      'should return Left(FirestoreFailure) when the call to the datasource is unsuccessful',
      () async {
        // arrange
        final failure = RealtimeDatabaseFailure.documentDoesNotExist(
          reference: DatabasePath.discover.path,
          id: 'id',
        );
        when(
          () => mockLinksListingRemoteDataSource.getLinks(
            databasePath: any(named: 'databasePath'),
          ),
        ).thenAnswer(
          (_) async => Left(failure),
        );

        // act
        final result =
            await linksRepository.getLinks(databasePath: tDatabasePath);

        // assert
        expect(result, Left(failure));
      },
    );
  });

  group('createLink', () {
    const tFeature = 'feature';
    const tAlias = 'alias';
    const tMetadata = OGMetadata();
    const tDeepLinkPath = 'deepLinkPath';
    const tDeepLinkURL = 'deepLink';
    const tAdditionalData = {'key': 'value'};

    void setUpSuccessfulDataSourceCall() {
      when(
        () => mockLinksCreationRemoteDataSource.createLink(
          feature: any(named: 'feature'),
          alias: any(named: 'alias'),
          metadata: any(named: 'metadata'),
          deepLinkPath: any(named: 'deepLinkPath'),
          additionalData: any(named: 'additionalData'),
        ),
      ).thenAnswer((_) async => const Right(tDeepLinkURL));
    }

    setUpAll(() {
      registerFallbackValue(const OGMetadata());
    });

    test(
      'should call LinksCreationRemoteDataSource.createLink with the correct parameters',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        await linksRepository.createLink(
          feature: tFeature,
          alias: tAlias,
          metadata: tMetadata,
          deepLinkPath: tDeepLinkPath,
          additionalData: tAdditionalData,
        );

        // assert
        verify(
          () => mockLinksCreationRemoteDataSource.createLink(
            feature: tFeature,
            alias: tAlias,
            metadata: tMetadata,
            deepLinkPath: tDeepLinkPath,
            additionalData: tAdditionalData,
          ),
        ).called(1);
      },
    );

    test(
      'should return Right(String) when the call to remote data source is successful',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        final result = await linksRepository.createLink(
          feature: tFeature,
          alias: tAlias,
          metadata: tMetadata,
          deepLinkPath: tDeepLinkPath,
          additionalData: tAdditionalData,
        );

        // assert
        expect(result, const Right(tDeepLinkURL));
      },
    );

    test(
      'should return Left(ApiFailure) when the call to remote data source is unsuccessful',
      () async {
        // arrange
        const tFailure = ApiFailure.unknownError();
        when(
          () => mockLinksCreationRemoteDataSource.createLink(
            feature: any(named: 'feature'),
            alias: any(named: 'alias'),
            metadata: any(named: 'metadata'),
            deepLinkPath: any(named: 'deepLinkPath'),
          ),
        ).thenAnswer((_) async => const Left(tFailure));

        // act
        final result = await linksRepository.createLink(
          feature: tFeature,
          alias: tAlias,
          metadata: tMetadata,
          deepLinkPath: tDeepLinkPath,
        );

        // assert
        expect(result, const Left(tFailure));
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

    void setUpSuccessfulDataSourceCall() {
      when(
        () => mockLinksCreationRemoteDataSource.getGeneratedLinkDetails(any()),
      ).thenAnswer((_) async => Right(tLinkDetails));
    }

    test(
      'should call LinksCreationRemoteDataSource.getGeneratedLinkDetails with the correct parameters',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        await linksRepository.getGeneratedLinkDetails(tLink);

        // assert
        verify(
          () =>
              mockLinksCreationRemoteDataSource.getGeneratedLinkDetails(tLink),
        ).called(1);
      },
    );

    test(
      'should return Right(LinkDetails) when the call to the remote data source is successful',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        final generatedLinkDetailsEither =
            await linksRepository.getGeneratedLinkDetails(tLink);

        // assert
        expect(generatedLinkDetailsEither, Right(tLinkDetails));
      },
    );

    test(
      'should return Left(ApiFailure) when the call to the remote data source is unsuccessful',
      () async {
        // arrange
        when(
          () =>
              mockLinksCreationRemoteDataSource.getGeneratedLinkDetails(any()),
        ).thenAnswer((_) async => const Left(ApiFailure.connectionError()));

        // act
        final generatedLinkDetailsEither =
            await linksRepository.getGeneratedLinkDetails(tLink);

        // assert
        expect(
          generatedLinkDetailsEither,
          const Left(ApiFailure.connectionError()),
        );
      },
    );
  });
}
