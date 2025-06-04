import 'package:branch_links/core/clients/firestore_client/firestore_failure.dart';
import 'package:branch_links/features/offers/data/data_sources/offers_remote_data_source.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:branch_links/features/offers/data/repositories/offers_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OffersRepository)
class OffersRepositoryImpl implements OffersRepository {
  final OffersRemoteDataSource _offersRemoteDataSource;

  OffersRepositoryImpl(this._offersRemoteDataSource);

  @override
  Future<Either<FirestoreFailure, bool>> updateOffer({
    required AuthenticationState authenticationState,
    required Offer offer,
  }) {
    return _offersRemoteDataSource.updateOffer(
      authenticationState: authenticationState,
      offer: offer,
    );
  }

  @override
  Future<Either<FirestoreFailure, bool>> updateOfferTripState({
    required TripState tripState,
    required List<Offer> offersList,
  }) {
    return _offersRemoteDataSource.updateOfferTripState(
      tripState: tripState,
      offersList: offersList,
    );
  }

  @override
  Future<Either<FirestoreFailure, Offers>> getOffers() async {
    return await _offersRemoteDataSource.getOffers();
  }
}
