import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:spookify_v2/domain/models/models.dart' as models;

@immutable
class Playlist extends Equatable {
  final models.Category category;
  final List<models.Track> tracks;

  const Playlist({
    required this.category,
    required this.tracks,
  });

  @override
  List<Object?> get props => [
        category,
        tracks,
      ];

  @override
  bool get stringify => true;

  Playlist copyWith({
    models.Category? category,
    List<models.Track>? tracks,
  }) {
    return Playlist(
      category: category ?? this.category,
      tracks: tracks ?? this.tracks,
    );
  }
}
