// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/save_category_entity.dart';

import 'package:spookify_v2/src/domain/resources/track_type.dart';

@immutable
class Downloads extends Equatable {
  final String trackId;
  final String title;
  final String? imageUrl;
  final String? artistName;
  final TrackType type;

  const Downloads({
    required this.trackId,
    required this.title,
    required this.imageUrl,
    required this.artistName,
    required this.type,
  });

  factory Downloads.fromSaveCategoryEntity(SaveCategoryEntity saveCategory) {
    return Downloads(
      trackId: saveCategory.trackId,
      title: saveCategory.title,
      imageUrl: saveCategory.imageUrl,
      artistName: saveCategory.artistName,
      type: saveCategory.type,
    );
  }

  @override
  List<Object?> get props => [
        trackId,
        title,
        imageUrl,
        artistName,
        type,
      ];

  Downloads copyWith({
    String? trackId,
    String? title,
    String? imageUrl,
    String? artistName,
    TrackType? type,
  }) {
    return Downloads(
      trackId: trackId ?? this.trackId,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
      artistName: artistName ?? this.artistName,
      type: type ?? this.type,
    );
  }
}
