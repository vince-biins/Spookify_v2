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

  Track copyWith({
    String? trackId,
    String? albumId,
    String? artistName,
    int? trackNumber,
    TrackType? type,
    String? imageUrl,
    String? trackName,
    bool? isFavorite,
    int? durationMs,
  }) {
    return Track(
      trackId: trackId ?? this.trackId,
      albumId: albumId ?? this.albumId,
      artistName: artistName ?? this.artistName,
      trackNumber: trackNumber ?? this.trackNumber,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
      trackName: trackName ?? this.trackName,
      isFavorite: isFavorite ?? this.isFavorite,
      durationMs: durationMs ?? this.durationMs,
    );
  }

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
