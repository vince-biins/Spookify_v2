import 'package:floor/floor.dart';
import 'package:spookify_v2/src/domain/models/models.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/utils/constants/constants.dart';

@Entity(tableName: trackEntity)
class TrackEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String categoryId;
  final String trackId;
  final String? albumId;
  final String? artistName;
  final int? trackNumber;
  final TrackType type;
  final String? imageUrl;
  final String trackName;
  final bool isFavorite;
  final int durationMs;

  TrackEntity({
    this.id,
    required this.categoryId,
    required this.trackId,
    required this.albumId,
    required this.artistName,
    required this.trackNumber,
    required this.type,
    required this.imageUrl,
    required this.trackName,
    required this.isFavorite,
    required this.durationMs,
  });

  factory TrackEntity.fromTrack({
    required String categoryId,
    required Track track,
  }) {
    return TrackEntity(
      categoryId: categoryId,
      trackId: track.trackId,
      albumId: track.albumId,
      artistName: track.artistName,
      trackNumber: track.trackNumber,
      type: track.type,
      imageUrl: track.imageUrl?.imageUrl,
      trackName: track.trackName,
      isFavorite: track.isFavorite,
      durationMs: track.durationMs,
    );
  }
}
