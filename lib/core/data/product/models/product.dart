import 'package:branch_links/core/constants/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product extends Equatable {
  final String id;
  final String name;
  final String path;
  final Map<String, dynamic> descriptions;
  final Map<String, dynamic> images;
  final String? propertyId;
  final ProductType? productType;

  const Product({
    required this.id,
    required this.name,
    this.path = '',
    this.descriptions = const {},
    this.images = const {},
    this.propertyId,
    this.productType,
  });

  String createTitle({
    String? propertyName,
  }) {
    if (name.isEmpty) {
      return propertyName ?? 'Product id : $id';
    }
    if (propertyName == null) {
      return name;
    }
    return '$name at $propertyName'.trim();
  }

  String? shortDescription() {
    int charLimit = 400;

    String? result = descriptions['overview'];
    result ??= '';
    result = result.trim();
    if (result.isEmpty) {
      return null;
    }

    if (result.length > charLimit) {
      result = '${result.substring(0, charLimit - 1).trim()}…';
    }
    return result;
  }

  Product copyWith({
    String? id,
    String? name,
    String? path,
    Map<String, dynamic>? descriptions,
    Map<String, dynamic>? images,
    String? propertyId,
    ProductType? productType,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      path: path ?? this.path,
      descriptions: descriptions ?? this.descriptions,
      images: images ?? this.images,
      propertyId: propertyId ?? this.propertyId,
      productType: productType ?? this.productType,
    );
  }

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props => [
        id,
        name,
        path,
        descriptions,
        images,
        propertyId,
        productType,
      ];
}
