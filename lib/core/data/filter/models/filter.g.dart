// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Filter _$FilterFromJson(Map<String, dynamic> json) => Filter(
      key: json['key'] as String,
      name: json['name'] as String,
      filterType: $enumDecode(_$FilterTypeEnumMap, json['filterType']),
    );

const _$FilterTypeEnumMap = {
  FilterType.tag: 'tag',
  FilterType.market: 'market',
  FilterType.location: 'location',
  FilterType.search: 'search',
  FilterType.openNow: 'openNow',
  FilterType.bookableOnline: 'bookableOnline',
  FilterType.mobileOrderable: 'mobileOrderable',
};
