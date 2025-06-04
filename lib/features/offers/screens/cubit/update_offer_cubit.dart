import 'package:branch_links/core/extensions/cubit_extension.dart';
import 'package:branch_links/env.dart';
import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/content_type.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:branch_links/features/offers/data/repositories/offers_repository.dart';
import 'package:branch_links/features/offers/screens/cubit/update_offer_state.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdateOfferCubit extends Cubit<UpdateOfferState> {
  final OffersRepository _offersRepository = Env.sl<OffersRepository>();

  UpdateOfferCubit() : super(const UpdateOfferState.loading());

  /// Updates the state only if it is UpdateOfferData currently
  void _safeDataUpdate(
    Offer Function(Offer) update, {
    bool resetFields = false,
  }) {
    final currentState = state;
    if (currentState is UpdateOfferData) {
      safeEmit(
        UpdateOfferData(
          originalOffers: currentState.originalOffers,
          updatedOffer: update(currentState.updatedOffer),
          baseOffer: currentState.baseOffer,
          selectedAuthState: currentState.selectedAuthState,
          setFieldsToCurrentOffer: resetFields,
          tripState: currentState.tripState,
          isSelectTripState: currentState.isSelectTripState,
          offersList: currentState.offersList,
          indexIsChanging: currentState.indexIsChanging,
          isEditingFromList: currentState.isEditingFromList,
        ),
      );
    }
  }

  /// Sets the offer to be edit
  void setOriginalOffer(AuthenticationState authState) {
    final currentState = state;
    if (currentState is! UpdateOfferData) return;
    safeEmit(
      UpdateOfferData(
        updatedOffer: getOfferToEdit(
          currentState.originalOffers,
          authState,
        ),
        baseOffer: getOfferToEdit(
          currentState.originalOffers,
          authState,
        ),
        selectedAuthState: authState,
        setFieldsToCurrentOffer: true,
        originalOffers: currentState.originalOffers,
        tripState: null,
        isSelectTripState: false,
        offersList: [],
      ),
    );
  }

  /// Sets the offer to be edited with tripState
  void setTripState(TripState tripState, List<Offer> offersList) {
    final currentState = state;
    if (currentState is! UpdateOfferData) return;
    List<Offer> offerList = List.from(
      getTripStateOfferToEdit(
        currentState.originalOffers,
        tripState,
      ),
    );
    if (offerList.isEmpty) {
      offerList.add(
        Offer.empty(),
      );
    }
    safeEmit(
      UpdateOfferData(
        updatedOffer: offerList.first,
        baseOffer: offerList.first,
        selectedAuthState: currentState.selectedAuthState,
        setFieldsToCurrentOffer: true,
        originalOffers: currentState.originalOffers,
        tripState: tripState,
        isSelectTripState: true,
        isEditingFromList: offerList.isNotEmpty,
        indexIsChanging: offerList.isNotEmpty ? 0 : null,
        offersList: offerList,
      ),
    );
  }

  /// Sets a previously saved offer to be edited with tripState
  void setOfferFromListToEdit(int? index) {
    final currentState = state;
    if (currentState is! UpdateOfferData) return;
    if (index != null) {
      safeEmit(
        currentState.copyWith(
          isEditingFromList: true,
          updatedOffer: currentState.offersList[index],
          baseOffer: currentState.offersList[index],
          setFieldsToCurrentOffer: true,
          indexIsChanging: index,
        ),
      );
    } else {
      safeEmit(
        currentState.copyWith(
          isEditingFromList: false,
          updatedOffer: currentState.originalOffers.inTrip.isNotEmpty
              ? currentState.originalOffers.inTrip.first.copyWith(
                  properties: [],
                )
              : currentState.baseOffer.copyWith(
                  properties: [],
                ),
          baseOffer: currentState.originalOffers.inTrip.isNotEmpty
              ? currentState.originalOffers.inTrip.first.copyWith(
                  properties: [],
                )
              : currentState.baseOffer.copyWith(
                  properties: [],
                ),
          setFieldsToCurrentOffer: true,
          indexIsChanging: null,
          properties: [],
        ),
      );
    }
  }

  /// Save changes to offer edited from list
  void updateOfferFromList() {
    final currentState = state;
    if (currentState is UpdateOfferData) {
      List<Offer> listToUpdate = List.from(
        currentState.offersList,
      );
      if (listToUpdate.isNotEmpty) {
        listToUpdate[currentState.indexIsChanging!] = currentState.updatedOffer;
        safeEmit(
          UpdateOfferData(
            updatedOffer: listToUpdate[currentState.indexIsChanging!],
            baseOffer: currentState.updatedOffer,
            selectedAuthState: currentState.selectedAuthState,
            setFieldsToCurrentOffer: true,
            originalOffers: currentState.originalOffers,
            tripState: currentState.tripState,
            indexIsChanging: currentState.indexIsChanging,
            isEditingFromList: true,
            isSelectTripState: true,
            offersList: listToUpdate,
          ),
        );
      }
    }
  }

  /// delets presaved Itens from offers list
  void deleteOfferFromList() {
    final currentState = state;
    if (currentState is UpdateOfferData) {
      final updatedList = [...currentState.offersList]
        ..removeAt(currentState.indexIsChanging!);
      safeEmit(
        UpdateOfferData(
          updatedOffer:
              updatedList.isNotEmpty ? updatedList.last : Offer.empty(),
          baseOffer: updatedList.isNotEmpty ? updatedList.last : Offer.empty(),
          selectedAuthState: currentState.selectedAuthState,
          setFieldsToCurrentOffer: true,
          originalOffers: currentState.originalOffers,
          tripState: currentState.tripState,
          isSelectTripState: true,
          offersList: updatedList,
          isEditingFromList: updatedList.isNotEmpty,
          indexIsChanging:
              updatedList.isNotEmpty ? (updatedList.length - 1) : null,
        ),
      );
    }
  }

  void updateTitle(String newTitle) {
    _safeDataUpdate(
      (currentOffer) => currentOffer.copyWith(
        name: newTitle,
      ),
    );
  }

  /// adds new offer to Offers List
  void addNewOfferToTripState() {
    final currentState = state;
    if (currentState is UpdateOfferData) {
      final updatedList = [...currentState.offersList, Offer.empty()];
      safeEmit(
        UpdateOfferData(
          updatedOffer: Offer.empty(),
          baseOffer: currentState.baseOffer,
          selectedAuthState: currentState.selectedAuthState,
          setFieldsToCurrentOffer: true,
          originalOffers: currentState.originalOffers,
          tripState: currentState.tripState,
          isSelectTripState: true,
          offersList: updatedList,
          isEditingFromList: true,
          indexIsChanging: updatedList.length - 1,
        ),
      );
    }
  }

  void updatePath(String path) {
    _safeDataUpdate(
      (currentOffer) => currentOffer.copyWith(
        path: path,
      ),
    );
  }

  ///
  void changeContentType(ContentType? contentType) {
    if (contentType == null) return;
    _safeDataUpdate(
      (currentOffer) {
        String? customUrl;
        String? path;

        if (contentType == ContentType.custom) {
          customUrl = currentOffer.customUrl;
        }

        if ({
          ContentType.clubBar,
          ContentType.show,
          ContentType.restaurant,
        }.contains(currentOffer.contentType)) {
          path = currentOffer.path;
        }

        return currentOffer.copyWith(
          contentType: contentType,
          customUrl: customUrl,
          path: path,
        );
      },
      resetFields: true,
    );
  }

  void updateDescription(String newDescription) {
    _safeDataUpdate(
      (currentOffer) => currentOffer.copyWith(
        description: newDescription,
      ),
    );
  }

  void updateCtaText(String newCtaText) {
    _safeDataUpdate(
      (currentOffer) => currentOffer.copyWith(
        customCTA: newCtaText,
      ),
    );
  }

  void updateCtaURL(String newCtaUrl) {
    _safeDataUpdate(
      (currentOffer) => currentOffer.copyWith(
        customUrl: newCtaUrl,
      ),
    );
  }

  void updateImageURL(String imagePath) {
    _safeDataUpdate(
      (currentOffer) => currentOffer.copyWith(
        image: OfferImage(url: imagePath),
      ),
    );
  }

  /// Updates the offer with the propertyList
  void setProperties(List<Property>? properties) {
    final currentState = state;
    if (currentState is! UpdateOfferData) return;
    safeEmit(currentState.copyWith(properties: properties));
    _safeDataUpdate(
      (currentOffer) => currentOffer.copyWith(
        properties: properties?.map((e) => e.id).toList() ?? [],
      ),
    );
  }

  /// Updates the offer with the local changes
  Future<void> updateOffer() async {
    final currentState = state;
    if (currentState is! UpdateOfferData) return;
    safeEmit(currentState.copyWith(isUpdating: true));
    final offerEither = await _offersRepository.updateOffer(
      authenticationState: currentState.selectedAuthState,
      offer: currentState.updatedOffer,
    );

    offerEither.fold((failure) {
      safeEmit(
        currentState.copyWith(
          isUpdating: false,
          isUpdated: false,
          errorMessage: 'Error',
        ),
      );
    }, (_) {
      var newOffers = currentState.originalOffers;
      if (currentState.selectedAuthState.name ==
          AuthenticationState.anonymous.name) {
        newOffers = currentState.originalOffers.copyWith(
          anonymous: currentState.updatedOffer,
        );
      }
      if (currentState.selectedAuthState.name ==
          AuthenticationState.idVerified.name) {
        newOffers = currentState.originalOffers.copyWith(
          idVerified: currentState.updatedOffer,
        );
      }
      if (currentState.selectedAuthState.name ==
          AuthenticationState.rewards.name) {
        newOffers = currentState.originalOffers.copyWith(
          rewards: currentState.updatedOffer,
        );
      }
      safeEmit(
        currentState.copyWith(
          isUpdating: false,
          isUpdated: true,
          originalOffers: newOffers,
        ),
      );
    });
  }

  /// Updates the offer with the local changes
  Future<void> updateOfferTripState() async {
    final currentState = state;
    if (currentState is! UpdateOfferData) return;
    safeEmit(currentState.copyWith(isUpdating: true));
    final offerEither = await _offersRepository.updateOfferTripState(
      tripState: currentState.tripState!,
      offersList: currentState.offersList,
    );

    offerEither.fold((failure) {
      safeEmit(
        currentState.copyWith(
          isUpdating: false,
          isUpdated: false,
          errorMessage: 'Error',
        ),
      );
    }, (_) {
      final Offers newOffers;
      switch (currentState.tripState) {
        case TripState.inTrip:
          newOffers = currentState.originalOffers.copyWith(
            inTrip: currentState.offersList,
          );
          break;
        case TripState.preTripOver72Hours:
          newOffers = currentState.originalOffers.copyWith(
            preTripOver72Hours: currentState.offersList,
          );
          break;
        case TripState.preTripUnder72Hours:
          newOffers = currentState.originalOffers.copyWith(
            preTripUnder72Hours: currentState.offersList,
          );
          break;
        default:
          newOffers = currentState.originalOffers;
      }
      safeEmit(
        currentState.copyWith(
          isUpdating: false,
          isUpdated: true,
          originalOffers: newOffers,
        ),
      );
    });
  }

  /// Gets offers
  Future<void> loadOffers() async {
    safeEmit(const UpdateOfferState.loading());
    final offersEither = await _offersRepository.getOffers();
    offersEither.fold(
      (_) => safeEmit(const UpdateOfferState.error()),
      (offers) {
        safeEmit(
          UpdateOfferState.data(
            originalOffers: offers,
            selectedAuthState: AuthenticationState.anonymous,
            updatedOffer: offers.anonymous,
            setFieldsToCurrentOffer: true,
            baseOffer: offers.anonymous,
          ),
        );
      },
    );
  }

  List<Offer> getTripStateOfferToEdit(Offers offers, TripState tripState) {
    switch (tripState) {
      case TripState.inTrip:
        return offers.inTrip;
      case TripState.preTripOver72Hours:
        return offers.preTripOver72Hours;
      case TripState.preTripUnder72Hours:
        return offers.preTripUnder72Hours;
    }
  }

  Offer getOfferToEdit(Offers offers, AuthenticationState authenticationState) {
    switch (authenticationState) {
      case AuthenticationState.anonymous:
        return offers.anonymous;
      case AuthenticationState.idVerified:
        return offers.idVerified;
      case AuthenticationState.rewards:
        return offers.rewards;
    }
  }
}
