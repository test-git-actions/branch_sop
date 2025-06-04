import 'package:branch_links/features/offers/data/models/authentication_state.dart';
import 'package:branch_links/features/offers/data/models/offer.dart';
import 'package:branch_links/features/offers/data/models/trip_state.dart';
import 'package:branch_links/features/properties/data/models/property.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_offer_state.freezed.dart';

@freezed
sealed class UpdateOfferState with _$UpdateOfferState {
  /// Indicates that the offers are downloaded
  ///
  /// It is used to store the original offers [originalOffers], the selected
  /// authentication state [selectedAuthState] and the current edited offer [updatedOffer].
  /// Furthermore it indicate when:
  ///   - the offer is updating [isUpdating]
  ///   - the offer is updated [isUpdated]
  ///   - there was an error during the updating process [errorMessage]
  const factory UpdateOfferState.data({
    /// The offer you are editing
    required Offer updatedOffer,

    /// Selected authentication state
    ///
    /// It indicate the selected offer
    required AuthenticationState selectedAuthState,

    /// Map of the offers saved on network
    ///
    /// Initially it is obtained from the network then it is updated locally
    /// after saving the modified offer online
    required Offers originalOffers,
    required Offer baseOffer,

    /// Whether a offer from offerList is being edited
    @Default(null) int? indexIsChanging,

    /// Whether a offer from offerList is being edited
    @Default(false) bool isEditingFromList,

    //It indicate the OfferList to be send with TripState value as key
    @Default(<Offer>[]) List<Offer> offersList,

    //It indicate the selected TripState
    @Default(null) TripState? tripState,

    /// Whether the text fields need to be updated
    @Default(false) bool setFieldsToCurrentOffer,

    /// Whether the offer is updating
    @Default(false) bool isUpdating,

    /// Whether the offer is just updated
    @Default(false) bool isUpdated,

    /// Whether the offer is just updated
    @Default(false) bool isSelectTripState,

    /// To indicate the market the properties will be from
    @Default(<Property>[]) List<Property>? properties,

    /// Whether there was an error during the updating
    String? errorMessage,
  }) = UpdateOfferData;

  /// Indicates that the offers are being downloading
  const factory UpdateOfferState.loading() = UpdateOfferLoading;

  /// Indicates that there was an error during the offers download
  const factory UpdateOfferState.error() = UpdateOfferError;
}

extension UpdateOfferDataX on UpdateOfferData {
  /// Whether the updated offer is different from the original
  bool get isOfferEdited => updatedOffer != baseOffer;
}
