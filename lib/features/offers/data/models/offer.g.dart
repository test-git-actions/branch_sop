// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Offers _$OffersFromJson(Map<String, dynamic> json) => Offers(
      Offer.fromJson(json['anonymous'] as Map<String, dynamic>),
      Offer.fromJson(json['idVerified'] as Map<String, dynamic>),
      Offer.fromJson(json['rewards'] as Map<String, dynamic>),
      (json['inTrip'] as List<dynamic>?)
              ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['preTripOver72Hours'] as List<dynamic>?)
              ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      (json['preTripUnder72Hours'] as List<dynamic>?)
              ?.map((e) => Offer.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OffersToJson(Offers instance) => <String, dynamic>{
      'anonymous': instance.anonymous,
      'idVerified': instance.idVerified,
      'rewards': instance.rewards,
      'inTrip': instance.inTrip,
      'preTripOver72Hours': instance.preTripOver72Hours,
      'preTripUnder72Hours': instance.preTripUnder72Hours,
    };

_$OfferImpl _$$OfferImplFromJson(Map<String, dynamic> json) => _$OfferImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      customCTA: json['customCTA'] as String,
      contentType: $enumDecode(_$ContentTypeEnumMap, json['contentType']),
      description: json['description'] as String,
      image: OfferImage.fromJson(json['image'] as Map<String, dynamic>),
      path: json['path'] as String?,
      customUrl: json['customUrl'] as String?,
      properties: (json['properties'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$OfferImplToJson(_$OfferImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'customCTA': instance.customCTA,
      'contentType': _$ContentTypeEnumMap[instance.contentType]!,
      'description': instance.description,
      'image': instance.image.toJson(),
      if (instance.path case final value?) 'path': value,
      if (instance.customUrl case final value?) 'customUrl': value,
      if (instance.properties case final value?) 'properties': value,
    };

const _$ContentTypeEnumMap = {
  ContentType.roomSegment: 'roomSegment',
  ContentType.restaurant: 'restaurant',
  ContentType.show: 'show',
  ContentType.clubBar: 'clubBar',
  ContentType.custom: 'custom',
};

_$OfferImageImpl _$$OfferImageImplFromJson(Map<String, dynamic> json) =>
    _$OfferImageImpl(
      url: json['url'] as String,
    );

Map<String, dynamic> _$$OfferImageImplToJson(_$OfferImageImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
