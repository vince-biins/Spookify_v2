import 'package:floor/floor.dart';
import 'package:spookify_v2/src/domain/models/models.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/utils/constants/constants.dart';

@Entity(tableName: favoriteEntity)
class FavoriteEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String imageUrl;
  final String trackId;
  final String title;
  final String? artist;
  final bool isFavorite;

  FavoriteEntity({
    this.id,
    required this.trackId,
    required this.title,
    required this.imageUrl,
    required this.isFavorite,
    required this.artist,
  });

  factory FavoriteEntity.fromFavoriteEntity({
    required Favorite favorite,
    required bool isFavorite,
  }) {
    return FavoriteEntity(
      trackId: favorite.id,
      title: favorite.name,
      imageUrl: favorite.imageUrl.imageUrl,
      isFavorite: isFavorite,
      artist: favorite.artist,
    );
  }

  Favorite toFavoriteEntity() {
    return Favorite(
      id: trackId,
      name: title,
      type: TrackType.favorite,
      imageUrl: ImageObject(imageUrl: imageUrl),
      artist: artist ?? '',
    );
  }

  Track toTrackEntity() {
    return Track(
      trackId: trackId.toString(),
      albumId: null,
      artistName: artist,
      trackNumber: null,
      type: TrackType.favorite,
      imageUrl: imageUrl.isNotEmpty ? ImageObject(imageUrl: imageUrl) : null,
      trackName: title,
      isFavorite: isFavorite,
      durationMs: 0,
    );
  }

  @override
  String toString() =>
      'FAVORITE ENTITY(id = $id, trackId = $trackId, title = $title, isFavorite = $isFavorite, imageUrl = $imageUrl, artist = $artist)';
}
