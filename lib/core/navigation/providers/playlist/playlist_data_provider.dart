import 'package:spookify_v2/core/utils/track_type.dart';

class TrackDataProvider {
  final String id;
  final String imageUrl;
  final String artist;
  final String title;
  final TrackType type;

  TrackDataProvider({
    required this.id,
    required this.imageUrl,
    required this.artist,
    required this.title,
    required this.type,
  });
}
