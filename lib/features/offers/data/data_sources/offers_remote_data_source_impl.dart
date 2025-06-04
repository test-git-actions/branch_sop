import 'package:branch_links/core/clients/firestore_client/collections.dart';
import 'package:branch_links/core/clients/firestore_client/documents.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_client.dart';
import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/core/constants/endpoints.dart';
import 'package:branch_links/features/offers/data/data_sources/offers_remote_data_source.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OffersRemoteDataSource)
class OffersRemoteDataSourceImpl implements OffersRemoteDataSource {
  final FirestoreClient _firestoreClient;
  static const branchEndpoint = Endpoints.branchIO;

  OffersRemoteDataSourceImpl(this._firestoreClient);

  @override
  Future<Either<FirestoreFailure, bool>> updateOffer({
    required AuthenticationState authenticationState,
    required Offer offer,
  }) async {
    final offerMap = offer.toJson();
    return _firestoreClient.updateDocument(
      collectionRef: _firestoreClient.collectionRef(Collections.data),
      id: Documents.offers,
      map: {
        authenticationState.name: offerMap,
      },
    );
  }

  @override
  Future<Either<FirestoreFailure, bool>> updateOfferTripState({
    required TripState tripState,
    required List<Offer> offersList,
  }) async {
    final offerMapList = offersList.map((e) => e.toJson()).toList();
    return _firestoreClient.updateDocument(
      collectionRef: _firestoreClient.collectionRef(Collections.data),
      id: Documents.offers,
      map: {
        tripState.name: offerMapList,
      },
    );
  }

  @override
  Future<Either<FirestoreFailure, Offers>> getOffers() async {
    final collectionRef = _firestoreClient.parsedCollectionRef<Offers>(
      Collections.data,
      Offers.fromJson,
    );
    return _firestoreClient.getDocumentById<Offers>(
      collectionRef: collectionRef,
      id: Documents.offers,
    );
  }
}
