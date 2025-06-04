// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'og_metadata.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OGMetadata _$OGMetadataFromJson(Map<String, dynamic> json) => OGMetadata(
      title: json[r'$og_title'] as String? ?? 'MGM Rewards',
      description: json[r'$og_description'] as String? ??
          'The official app from MGM Rewards is your digital concierge -- make & manage hotel, dining, and show reservations.',
      imageURL: json[r'$og_image_url'] as String? ??
          'https://pbs.twimg.com/media/DglMZCsV4AA_M5r.jpg',
      imageWidth: (json[r'$og_image_width'] as num?)?.toInt() ?? 1024,
      imageHeight: (json[r'$og_image_height'] as num?)?.toInt() ?? 576,
    );

Map<String, dynamic> _$OGMetadataToJson(OGMetadata instance) =>
    <String, dynamic>{
      if (instance.title case final value?) r'$og_title': value,
      if (instance.description case final value?) r'$og_description': value,
      if (instance.imageURL case final value?) r'$og_image_url': value,
      if (instance.imageWidth case final value?) r'$og_image_width': value,
      if (instance.imageHeight case final value?) r'$og_image_height': value,
    };
