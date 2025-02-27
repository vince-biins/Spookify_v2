import 'package:spookify_v2/core/utils/track_type.dart';

class SaveCategory {
  final String trackId;
  final String title;
  final String? imageUrl;
  final String? artistName;
  final TrackType type;

  SaveCategory({
    required this.trackId,
    required this.title,
    required this.imageUrl,
    required this.artistName,
    required this.type,
  });
}
