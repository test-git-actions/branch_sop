import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'link.g.dart';

@JsonSerializable()
class Link extends Equatable {
  final String id;
  final String name;
  final String link;
  final String? path;

  const Link({
    required this.id,
    required this.name,
    required this.link,
    this.path,
  });

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);

  @override
  List<Object?> get props => [id, name, link, path];

  Link copyWith({
    String? id,
    String? name,
    String? link,
    String? path,
  }) {
    return Link(
      id: id ?? this.id,
      name: name ?? this.name,
      link: link ?? this.link,
      path: path ?? this.path,
    );
  }
}
