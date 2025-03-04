import 'package:spookify_v2/src/domain/models/album.dart';
import 'package:spookify_v2/src/domain/models/artist.dart';
import 'package:spookify_v2/src/domain/models/category.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/application/paramaters/dashboard_item.dart';
import 'package:spookify_v2/src/domain/models/favorite.dart';

extension DashboardIemMapper<T> on List<T> {
  List<DashboardItem> toDashboardItem() {
    return map<DashboardItem?>((item) {
      return switch (item) {
        Artist() => DashboardItem(
            id: item.id,
            name: item.name,
            imageUrl: item.imageUrl,
            artist: item.name,
            type: item.type,
          ),
        Album() => DashboardItem(
            id: item.id,
            name: item.name,
            imageUrl: item.imageUrl,
            artist: item.artist.map((artist) => artist.name).join(','),
            type: item.type,
          ),
        Category() => DashboardItem(
            id: item.id,
            name: item.name,
            imageUrl: item.imageUrl ?? '',
            artist: '',
            type: TrackType.category,
          ),
        Favorite() => DashboardItem(
            id: item.id,
            name: item.name,
            imageUrl: item.imageUrl,
            artist: item.artist,
            type: TrackType.category,
          ),
        _ => null,
      };
    }).where((item) => item != null).cast<DashboardItem>().toList();
  }
}
