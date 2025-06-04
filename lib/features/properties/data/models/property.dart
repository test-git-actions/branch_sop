import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'property.g.dart';

@JsonSerializable()
class Property extends Equatable {
  final String id;
  final String name;
  final String? path;
  final String? propertyId;
  final String? marketId;
  final String? shortName;
  final String? propertyKey;

  const Property({
    required this.id,
    required this.name,
    this.path,
    this.propertyId,
    this.marketId,
    this.shortName,
    this.propertyKey,
  });

  Property copyWith({
    String? id,
    String? path,
    String? name,
    String? marketId,
    String? shortName,
  }) {
    return Property(
      id: id ?? this.id,
      path: path ?? this.path,
      name: name ?? this.name,
      marketId: marketId ?? this.marketId,
      shortName: shortName ?? this.shortName,
    );
  }

  factory Property.fromJson(Map<String, dynamic> json) =>
      _$PropertyFromJson(json);

  Map<String, dynamic> toJson() => _$PropertyToJson(this);

  @override
  List<Object?> get props => [
        id,
        path,
        name,
        propertyId,
        marketId,
        shortName,
        propertyKey,
      ];
}
