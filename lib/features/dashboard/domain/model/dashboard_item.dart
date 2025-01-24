import 'package:spookify_v2/core/utils/track_type.dart';

class DashboardItem {
  final String id;
  final String name;
  final String imageUrl;
  final String artist;
  final TrackType type;

  DashboardItem({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.artist,
    required this.type,
  });
}
