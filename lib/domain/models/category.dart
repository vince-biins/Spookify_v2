import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:spookify_v2/presentation/utils/track_type.dart';
import 'package:spookify_v2/infrastructure/data_source/remote/dto_model/category_response.dart';

@immutable
class Category extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  // final String? artistName;
  // final TrackType type;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    // required this.artistName,
    // required this.type,
  });

  factory Category.fromCategoryDto(CategoryItem category) {
    return Category(
      id: category.id,
      name: category.name,
      imageUrl: category.icons.firstOrNull?.url ?? '',
      // artistName: category,
      // type: type,
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        // artistName,
        // type,
      ];

  @override
  bool get stringify => true;

  Category copyWith({
    String? id,
    String? name,
    String? imageUrl,
    String? artistName,
    TrackType? type,
  }) {
    return Category(
      id: id ?? this.id,
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      // artistName: artistName ?? this.artistName,
      // type: type ?? this.type,
    );
  }
}
