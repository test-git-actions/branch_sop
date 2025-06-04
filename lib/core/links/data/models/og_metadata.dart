import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'og_metadata.g.dart';

@JsonSerializable(includeIfNull: false)
class OGMetadata extends Equatable {
  @JsonKey(name: '\$og_title')
  final String? title;

  @JsonKey(name: '\$og_description')
  final String? description;

  @JsonKey(name: '\$og_image_url')
  final String? imageURL;

  @JsonKey(name: '\$og_image_width')
  final int? imageWidth;

  @JsonKey(name: '\$og_image_height')
  final int? imageHeight;

  const OGMetadata({
    this.title = 'MGM Rewards',
    this.description =
        'The official app from MGM Rewards is your digital concierge -- make & manage hotel, dining, and show reservations.',
    this.imageURL = 'https://pbs.twimg.com/media/DglMZCsV4AA_M5r.jpg',
    this.imageWidth = 1024,
    this.imageHeight = 576,
  });

  @override
  List<Object?> get props => [
        title,
        description,
        imageURL,
        imageWidth,
        imageHeight,
      ];

  factory OGMetadata.fromJson(Map<String, dynamic> json) =>
      _$OGMetadataFromJson(json);
  Map<String, dynamic> toJson() => _$OGMetadataToJson(this);
}
