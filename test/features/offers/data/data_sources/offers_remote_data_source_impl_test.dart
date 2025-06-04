import 'package:branch_links/core/clients/firestore_client/firestore_client.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/offers/data/data_sources/offers_remote_data_source_impl.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/content_type.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late OffersRemoteDataSourceImpl offersRemoteDataSource;
  late FakeFirebaseFirestore fakeFirestore;

  setUp(() {
    fakeFirestore = FakeFirebaseFirestore();
    offersRemoteDataSource =
        OffersRemoteDataSourceImpl(FirestoreClient(fakeFirestore));
  });

  group('getOffers', () {
    late DocumentReference documentReference;
    const offer = Offer(
      id: 'id',
      name: 'name',
      customCTA: 'customCTA',
      contentType: ContentType.custom,
      description: 'description',
      image: OfferImage(url: 'imageUrl'),
      path: null,
      customUrl: 'customUrl',
      properties: [],
    );

    const tOffers = Offers(offer, offer, offer, [offer], [offer], [offer]);

    setUp(() {
      documentReference = fakeFirestore
          .collection('environments')
          .doc('uat')
          .collection('data')
          .doc('offers');
    });

    test('should return the offers when the call is successful', () async {
      // arrange
      documentReference.set({
        'anonymous': {
          'id': 'id',
          'name': 'name',
          'customCTA': 'customCTA',
          'contentType': 'custom',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': null,
          'customUrl': 'customUrl',
          'properties': [],
        },
        'idVerified': {
          'id': 'id',
          'name': 'name',
          'customCTA': 'customCTA',
          'contentType': 'custom',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': null,
          'customUrl': 'customUrl',
          'properties': [],
        },
        'rewards': {
          'id': 'id',
          'name': 'name',
          'customCTA': 'customCTA',
          'contentType': 'custom',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': null,
          'customUrl': 'customUrl',
          'properties': [],
        },
        'inTrip': [
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          },
        ],
        'preTripOver72Hours': [
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          }
        ],
        'preTripUnder72Hours': [
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          },
        ],
      });

      // act
      final offersEither = await offersRemoteDataSource.getOffers();

      // assert
      expect(offersEither.isRight(), isTrue);
      offersEither.map((offers) => expect(offers, tOffers));
    });

    test(
        'should return FirestoreFailure.documentDoesNotExist when there is no document',
        () async {
      final offersEither = await offersRemoteDataSource.getOffers();
      expect(offersEither.isLeft(), isTrue);
      expect(
        offersEither.fold((l) => l, (r) => r),
        const FirestoreFailure.documentDoesNotExist(
          collection: 'data',
          id: 'offers',
        ),
      );
    });
  });

  group('updateOffer', () {
    late DocumentReference documentReference;

    setUp(() {
      documentReference = fakeFirestore
          .collection('environments')
          .doc('uat')
          .collection('data')
          .doc('offers');
    });

    test('should return true when the write is successful', () async {
      // arrange
      documentReference.set({
        'anonymous': {
          'id': 'id',
          'name': 'name',
          'customCTA': 'customCTA',
          'contentType': 'custom',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': null,
          'customUrl': 'customUrl',
          'properties': [],
        },
        'transient': {
          'id': 'id',
          'name': 'name',
          'customCTA': 'customCTA',
          'contentType': 'custom',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': null,
          'customUrl': 'customUrl',
          'properties': [],
        },
        'rewards': {
          'id': 'id',
          'name': 'name',
          'customCTA': 'customCTA',
          'contentType': 'custom',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': null,
          'customUrl': 'customUrl',
          'properties': [],
        },
      });

      // act
      final offersEither = await offersRemoteDataSource.updateOffer(
        authenticationState: AuthenticationState.anonymous,
        offer: const Offer(
          id: 'id',
          name: 'newName',
          customCTA: 'newCustomCTA',
          contentType: ContentType.restaurant,
          description: 'description',
          image: OfferImage(url: 'imageUrl'),
          path: 'path',
          customUrl: null,
          properties: [],
        ),
      );

      // assert
      expect(offersEither.isRight(), isTrue);

      final doc = await documentReference.get();
      final data = doc.data();
      final o = {
        'anonymous': {
          'id': 'id',
          'name': 'newName',
          'customCTA': 'newCustomCTA',
          'contentType': 'restaurant',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': 'path',
          'customUrl': 'customUrl',
          'properties': [],
        },
        'transient': {
          'id': 'id',
          'name': 'name',
          'customCTA': 'customCTA',
          'contentType': 'custom',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': null,
          'customUrl': 'customUrl',
          'properties': [],
        },
        'rewards': {
          'id': 'id',
          'name': 'name',
          'customCTA': 'customCTA',
          'contentType': 'custom',
          'description': 'description',
          'image': {'url': 'imageUrl'},
          'path': null,
          'customUrl': 'customUrl',
          'properties': [],
        },
      };
      expect(data, o);
    });
  });

  group('updateOfferTripState', () {
    late DocumentReference documentReference;

    setUp(() {
      documentReference = fakeFirestore
          .collection('environments')
          .doc('uat')
          .collection('data')
          .doc('offers');
    });

    test('should return true when the write is successful', () async {
      // arrange
      documentReference.set({
        'inTrip': [
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          },
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          },
        ],
        TripState.preTripOver72Hours.name: [
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          },
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          },
        ],
        TripState.preTripUnder72Hours.name: [
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          }
        ],
      });

      // act
      final offersEither = await offersRemoteDataSource.updateOfferTripState(
        tripState: TripState.inTrip,
        offersList: const [
          Offer(
            id: 'id',
            name: 'newName',
            customCTA: 'newCustomCTA',
            contentType: ContentType.restaurant,
            description: 'description',
            image: OfferImage(url: 'imageUrl'),
            path: 'path',
            customUrl: null,
            properties: [],
          ),
          Offer(
            id: 'id',
            name: 'newName',
            customCTA: 'newCustomCTA',
            contentType: ContentType.restaurant,
            description: 'description',
            image: OfferImage(url: 'imageUrl'),
            path: 'path',
            customUrl: null,
            properties: [],
          ),
        ],
      );

      // assert
      expect(offersEither.isRight(), isTrue);

      final doc = await documentReference.get();
      final data = doc.data();
      final o = {
        'inTrip': [
          {
            'id': 'id',
            'name': 'newName',
            'customCTA': 'newCustomCTA',
            'contentType': 'restaurant',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': 'path',
            'properties': [],
          },
          {
            'id': 'id',
            'name': 'newName',
            'customCTA': 'newCustomCTA',
            'contentType': 'restaurant',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': 'path',
            'properties': [],
          },
        ],
        'preTripOver72Hours': [
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          },
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          },
        ],
        'preTripUnder72Hours': [
          {
            'id': 'id',
            'name': 'name',
            'customCTA': 'customCTA',
            'contentType': 'custom',
            'description': 'description',
            'image': {'url': 'imageUrl'},
            'path': null,
            'customUrl': 'customUrl',
            'properties': [],
          }
        ],
      };
      expect(data, o);
    });
  });
}
