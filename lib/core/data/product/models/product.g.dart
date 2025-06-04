// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as String,
      name: json['name'] as String,
      path: json['path'] as String? ?? '',
      descriptions: json['descriptions'] as Map<String, dynamic>? ?? const {},
      images: json['images'] as Map<String, dynamic>? ?? const {},
      propertyId: json['propertyId'] as String?,
      productType:
          $enumDecodeNullable(_$ProductTypeEnumMap, json['productType']),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'path': instance.path,
      'descriptions': instance.descriptions,
      'images': instance.images,
      'propertyId': instance.propertyId,
      'productType': _$ProductTypeEnumMap[instance.productType],
    };

const _$ProductTypeEnumMap = {
  ProductType.club: 'club',
  ProductType.show: 'show',
  ProductType.restaurant: 'restaurant',
};
