import 'package:equatable/equatable.dart';
import 'package:spookify_v2/core/utils/track_type.dart';

class Track extends Equatable {
  final String trackId;
  final String? albumId;
  final String? artistName;
  final int? trackNumber;
  final TrackType type;
  final String? imageUrl;
  final String trackName;
  final bool isFavorite;
  final int durationMs;

  const Track({
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

  @override
  List<Object?> get props => [
        trackId,
        albumId,
        artistName,
        trackName,
        trackNumber,
        type,
        imageUrl,
        isFavorite,
        durationMs,
      ];
}
