import 'package:spookify_v2/core/utils/track_type.dart';
import 'package:spookify_v2/features/dashboard/data/models/album_response.dart';
import 'package:spookify_v2/features/dashboard/data/models/artist_response.dart';
import 'package:spookify_v2/features/dashboard/data/models/category_response.dart';
import 'package:spookify_v2/features/dashboard/domain/model/album.dart';
import 'package:spookify_v2/features/dashboard/domain/model/artist.dart';
import 'package:spookify_v2/features/dashboard/domain/model/category.dart';

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
