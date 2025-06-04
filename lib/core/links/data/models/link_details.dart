import 'package:branch_links/core/links/data/models/og_metadata.dart';
import 'package:equatable/equatable.dart';

class LinkDetails extends Equatable {
  final String id;
  final String? feature;
  final Uri deepLinkPath;
  final OGMetadata metadata;

  const LinkDetails({
    required this.id,
    required this.feature,
    required this.deepLinkPath,
    required this.metadata,
  });

  factory LinkDetails.fromJson(Map<String, dynamic> json) {
    final data = json['data'];

    return LinkDetails(
      id: data['~id'],
      feature: data['~feature'],
      deepLinkPath: Uri.parse(data['\$deeplink_path']),
      metadata: OGMetadata.fromJson(data),
    );
  }

  @override
  List<Object?> get props => [id, feature, deepLinkPath, metadata];
}
