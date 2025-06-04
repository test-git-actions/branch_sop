import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'filter.g.dart';

enum FilterType {
  tag,
  market,
  location,
  search,
  openNow,
  bookableOnline,
  mobileOrderable
}

@JsonSerializable(createToJson: false)
class Filter extends Equatable {
  final String key;
  final String name;
  final FilterType filterType;

  const Filter({
    required this.key,
    required this.name,
    required this.filterType,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => _$FilterFromJson(json);

  @override
  String toString() {
    return 'Filter{key: $key, name: $name, filterType: $filterType}';
  }

  @override
  List<Object?> get props => [key, name, filterType];
}
