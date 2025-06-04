import 'package:branch_links/core/constants/endpoints.dart';
import 'package:branch_links/features/offers/data/models/content_type.dart';
import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'offer.freezed.dart';

part 'offer.g.dart';

@JsonSerializable()
class Offers extends Equatable {
  final Offer anonymous;
  final Offer idVerified;
  final Offer rewards;
  @JsonKey(defaultValue: <Offer>[])
  final List<Offer> inTrip;
  @JsonKey(defaultValue: <Offer>[])
  final List<Offer> preTripOver72Hours;
  @JsonKey(defaultValue: <Offer>[])
  final List<Offer> preTripUnder72Hours;

  const Offers(
    this.anonymous,
    this.idVerified,
    this.rewards,
    this.inTrip,
    this.preTripOver72Hours,
    this.preTripUnder72Hours,
  );

  factory Offers.fromJson(Map<String, dynamic> json) => _$OffersFromJson(json);

  Map<String, dynamic> toJson() => _$OffersToJson(this);

  @override
  List<Object?> get props => [
        anonymous,
        idVerified,
        rewards,
        inTrip,
        preTripOver72Hours,
        preTripUnder72Hours,
      ];

  Offers copyWith({
    Offer? anonymous,
    Offer? idVerified,
    Offer? rewards,
    List<Offer>? inTrip,
    List<Offer>? preTripOver72Hours,
    List<Offer>? preTripUnder72Hours,
  }) {
    return Offers(
      anonymous ?? this.anonymous,
      idVerified ?? this.idVerified,
      rewards ?? this.rewards,
      inTrip ?? this.inTrip,
      preTripOver72Hours ?? this.preTripOver72Hours,
      preTripUnder72Hours ?? this.preTripUnder72Hours,
    );
  }
}

@freezed
class Offer with _$Offer {
  // ignore: invalid_annotation_target
  @JsonSerializable(explicitToJson: true, includeIfNull: false)
  const factory Offer({
    required String id,
    required String name,
    required String customCTA,
    required ContentType contentType,
    required String description,
    required OfferImage image,
    required String? path,
    required String? customUrl,
    required List<String>? properties,
  }) = _Offer;

  factory Offer.fromJson(Map<String, dynamic> json) => _$OfferFromJson(json);

  factory Offer.empty() => const Offer(
        id: '',
        name: '',
        customCTA: '',
        contentType: ContentType.roomSegment,
        description: '',
        image: OfferImage(url: ''),
        path: '',
        customUrl: '',
        properties: [],
      );
}

extension OfferX on Offer {
  String get imageURL => '${Endpoints.staticImages}${image.url}';
}

@freezed
class OfferImage with _$OfferImage {
  const factory OfferImage({
    required String url,
  }) = _OfferImage;

  factory OfferImage.fromJson(Map<String, dynamic> json) =>
      _$OfferImageFromJson(json);
}
