// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/favorite_entity.dart';

class Favorite extends Equatable {
  final String id;
  final String name;
  final TrackType type;
  final String imageUrl;
  final String artist;

  const Favorite({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.artist,
  });

  factory Favorite.fromFavoriteEntity(FavoriteEntity favorite) {
    return Favorite(
      id: favorite.trackId,
      name: favorite.title,
      type: TrackType.favorite,
      imageUrl: favorite.imageUrl,
      artist: favorite.artist ?? '',
    );
  }

  FavoriteEntity toFavoriteEntity(bool isFavorite) => FavoriteEntity(
        trackId: id,
        title: name,
        imageUrl: imageUrl,
        isFavorite: isFavorite,
        artist: artist,
      );
  @override
  List<Object?> get props => [
        id,
        name,
        type,
        imageUrl,
        artist,
      ];

  Favorite copyWith({
    String? id,
    String? name,
    TrackType? type,
    String? imageUrl,
    String? artist,
  }) {
    return Favorite(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
      artist: artist ?? this.artist,
    );
  }

  @override
  bool get stringify => true;
}
