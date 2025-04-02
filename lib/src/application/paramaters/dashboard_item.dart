import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';

class DashboardItem {
  final String id;
  final String name;
  final ImageObject? imageUrl;
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
