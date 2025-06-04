import 'package:branch_links/core/clients/firestore_client/collections.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/offers/data/data_sources/offers_remote_data_source.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/content_type.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:branch_links/features/offers/data/repositories/offers_repository.dart';
import 'package:branch_links/features/offers/data/repositories/offers_repository_impl.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockOffersRemoteDataSource extends Mock
    implements OffersRemoteDataSource {}

void main() {
  late MockOffersRemoteDataSource mockOffersRemoteDataSource;
  late OffersRepository offersRepository;

  setUp(() {
    mockOffersRemoteDataSource = MockOffersRemoteDataSource();
    offersRepository = OffersRepositoryImpl(mockOffersRemoteDataSource);
  });

  const baseOffer = Offer(
    id: 'id',
    name: 'name',
    customCTA: 'customCTA',
    contentType: ContentType.roomSegment,
    description: 'description',
    image: OfferImage(url: 'url'),
    path: null,
    customUrl: null,
    properties: [],
  );

  group('getOffers', () {
    const Either<FirestoreFailure, Offers> dataSourceResponse = Right(
      Offers(
        baseOffer,
        baseOffer,
        baseOffer,
        [baseOffer],
        [baseOffer],
        [baseOffer],
      ),
    );

    const Either<FirestoreFailure, Offers> repositoryResponse = Right(
      Offers(
        baseOffer,
        baseOffer,
        baseOffer,
        [baseOffer],
        [baseOffer],
        [baseOffer],
      ),
    );

    void setUpSuccessfulDataSourceCall() {
      when(() => mockOffersRemoteDataSource.getOffers())
          .thenAnswer((_) async => dataSourceResponse);
    }

    test(
      'should call OffersRemoteDatasource.getOffers',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        await offersRepository.getOffers();

        // assert
        verify(() => mockOffersRemoteDataSource.getOffers()).called(1);
      },
    );

    test(
      'should return Right(Offers) when the call to the datasource is successful',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        final result = await offersRepository.getOffers();

        // assert
        expect(result.isRight(), true);
        expect(repositoryResponse.isRight(), true);

        final map1 = result.getOrElse(() => throw Exception());
        final map2 = repositoryResponse.getOrElse(() => throw Exception());

        // final isEquals = mapEquals(map1, map2);
        expect(map1 == map2, true);
      },
    );

    test(
      'should return Left(FirestoreFailure) when the call to the datasource is unsuccessful',
      () async {
        // arrange
        const failure = FirestoreFailure.documentDoesNotExist(
          collection: Collections.data,
          id: 'offers',
        );
        when(() => mockOffersRemoteDataSource.getOffers()).thenAnswer(
          (_) async => const Left(failure),
        );

        // act
        final result = await offersRepository.getOffers();

        // assert
        expect(result, const Left(failure));
      },
    );
  });

  group('updateOffer', () {
    void setUpSuccessfulDataSourceCall() {
      when(
        () => mockOffersRemoteDataSource.updateOffer(
          authenticationState: AuthenticationState.anonymous,
          offer: baseOffer,
        ),
      ).thenAnswer((_) async => const Right(true));
    }

    test(
      'should call OffersRemoteDatasource.updateOffer',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        await offersRepository.updateOffer(
          authenticationState: AuthenticationState.anonymous,
          offer: baseOffer,
        );

        // assert
        verify(
          () => mockOffersRemoteDataSource.updateOffer(
            authenticationState: AuthenticationState.anonymous,
            offer: baseOffer,
          ),
        ).called(1);
      },
    );

    test(
      'should return Right(true) when the call to the datasource is successful',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        final result = await offersRepository.updateOffer(
          authenticationState: AuthenticationState.anonymous,
          offer: baseOffer,
        );

        // assert
        expect(result.isRight(), true);
      },
    );
  });

  group('updateOfferTripState', () {
    void setUpSuccessfulDataSourceCall() {
      when(
        () => mockOffersRemoteDataSource.updateOfferTripState(
          tripState: TripState.inTrip,
          offersList: [baseOffer],
        ),
      ).thenAnswer((_) async => const Right(true));
    }

    test(
      'should call OffersRemoteDatasource.updateOfferTripState',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        await offersRepository.updateOfferTripState(
          tripState: TripState.inTrip,
          offersList: [baseOffer],
        );

        // assert
        verify(
          () => mockOffersRemoteDataSource.updateOfferTripState(
            tripState: TripState.inTrip,
            offersList: [baseOffer],
          ),
        ).called(1);
      },
    );

    test(
      'should return Right(true) when the call to the datasource is successful',
      () async {
        // arrange
        setUpSuccessfulDataSourceCall();

        // act
        final result = await offersRepository.updateOfferTripState(
          tripState: TripState.inTrip,
          offersList: [baseOffer],
        );

        // assert
        expect(result.isRight(), true);
      },
    );
  });
}
