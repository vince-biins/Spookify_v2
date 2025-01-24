import 'package:equatable/equatable.dart';
import 'package:spookify_v2/core/utils/track_type.dart';

class Track extends Equatable {
  final String trackId;
  final String? albumId;
  final String? artistName;
  final int trackNumber;
  final TrackType type;
  final String? imageUrl;
  final String trackName;

  const Track({
    required this.trackId,
    required this.albumId,
    required this.artistName,
    required this.trackNumber,
    required this.type,
    required this.imageUrl,
    required this.trackName,
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
      ];
}
