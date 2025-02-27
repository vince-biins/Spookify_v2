import 'package:floor/floor.dart';
import 'package:spookify_v2/core/utils/track_type.dart';
import 'package:spookify_v2/database/data/constants/constants.dart';

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
}
