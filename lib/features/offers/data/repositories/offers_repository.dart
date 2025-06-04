import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:dartz/dartz.dart';

/// This interface defines the methods to update an offer
abstract class OffersRepository {
  /// Updates an offer
  ///
  /// The [authenticationState] property indicates which offer needs to update
  /// The [offer] property is the updated offer
  Future<Either<FirestoreFailure, bool>> updateOffer({
    required AuthenticationState authenticationState,
    required Offer offer,
  });

  /// The [tripState] property indicates which offersList needs to update
  /// The [offersList] property is the updated offerList
  Future<Either<FirestoreFailure, bool>> updateOfferTripState({
    required TripState tripState,
    required List<Offer> offersList,
  });

  /// Get offers
  Future<Either<FirestoreFailure, Offers>> getOffers();
}
