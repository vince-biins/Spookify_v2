import 'package:spookify_v2/core/utils/track_type.dart';
import 'package:spookify_v2/features/dashboard/data/models/models.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';

extension CategoryMapper on CategoryResponse {
  List<Category> transform() => categories.items
      .map(
        (item) => Category(
          id: item.id,
          name: item.name,
          imageUrl: item.icons.firstOrNull?.url ?? '',
        ),
      )
      .toList();
}

extension ArtistMapper on ArtistResponse {
  List<Artist> transform() => artists
      .map(
        (item) => Artist(
          id: item.id,
          name: item.name,
          imageUrl: item.images?.firstOrNull?.url ?? '',
          followers: item.followers?.total ?? 0,
          genre: item.genres ?? [],
          type: TrackType.artist,
        ),
      )
      .toList();
}

extension AlbumMapper on AlbumResponse {
  List<Album> transform() => albums
      .map(
        (item) => Album(
          id: item.id,
          name: item.name,
          type: TrackType.album,
          imageUrl: item.images.firstOrNull?.url ?? '',
          artist: item.artists
              .map(
                (item) => Artist(
                  id: item.id,
                  name: item.name,
                  imageUrl: item.images?.firstOrNull?.url ?? '',
                  followers: item.followers?.total ?? 0,
                  genre: item.genres ?? [],
                  type: TrackType.artist,
                ),
              )
              .toList(),
        ),
      )
      .toList();
}

extension DashboardIemMapper<T> on List<T> {
  List<DashboardItem> toDashboardItem() {
    return map<DashboardItem?>((item) {
      print(item.runtimeType);
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
            imageUrl: item.imageUrl,
            artist: '',
            type: TrackType.category,
          ),
        _ => null,
      };
    }).where((item) => item != null).cast<DashboardItem>().toList();
  }
}
