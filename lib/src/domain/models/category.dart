import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';

@immutable
class Category extends Equatable {
  final String id;
  final String name;
  final ImageObject? imageUrl;
  final String? artistName;
  final TrackType type;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.artistName,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
      ];

  @override
  bool get stringify => true;

  Category copyWith({
    String? id,
    String? name,
    ImageObject? imageUrl,
    String? artistName,
    TrackType? type,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      artistName: artistName ?? this.artistName,
      type: type ?? this.type,
    );
  }
}
