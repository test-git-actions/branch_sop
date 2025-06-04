// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'property.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Property _$PropertyFromJson(Map<String, dynamic> json) => Property(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String?,
      propertyId: json['propertyId'] as String?,
      marketId: json['marketId'] as String?,
      shortName: json['shortName'] as String?,
      propertyKey: json['propertyKey'] as String?,
    );

Map<String, dynamic> _$PropertyToJson(Property instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'propertyId': instance.propertyId,
      'marketId': instance.marketId,
      'shortName': instance.shortName,
      'propertyKey': instance.propertyKey,
    };
