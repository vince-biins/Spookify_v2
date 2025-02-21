import 'package:spookify_v2/features/playlist/data/local/entity/entity.dart';

import 'package:spookify_v2/core/utils/track_type.dart';
import 'package:spookify_v2/features/playlist/data/remote/model/model.dart';
import 'package:spookify_v2/features/playlist/domain/model/model.dart';

extension AlbumTrackMapper on TrackResponse {
  List<Track> transform(List<FavoriteEntity> favorite) => items
      .map(
        (item) => Track(
          trackId: item.id,
          albumId: null,
          artistName: item.artists.map((artist) => artist.name).join(', '),
          trackNumber: item.trackNumber,
          type: TrackType.album,
          imageUrl: null,
          trackName: item.name,
          durationMs: item.durationMs,
          isFavorite: favorite.isNotEmpty
              ? favorite
                      .where((favorite) => favorite.trackId == item.id)
                      .firstOrNull
                      ?.isFavorite ??
                  false
              : false,
        ),
      )
      .toList();
}

extension TrackMapper on TrackResponseItem {
  Track transform(FavoriteEntity? favorite) => Track(
        trackId: id,
        albumId: null,
        artistName: artists.map((artist) => artist.name).join(', '),
        trackNumber: trackNumber,
        type: TrackType.album,
        imageUrl: album?.images.firstOrNull?.url,
        trackName: name,
        isFavorite: favorite?.isFavorite ?? false,
        durationMs: durationMs,
      );
}

extension ArtistTopTrackMapper on ArtistTopTrackResponse {
  List<Track> transform(List<FavoriteEntity> favorite) => tracks
      .map(
        (track) => Track(
          trackId: track.id,
          albumId: track.album.id,
          artistName: null,
          trackNumber: track.trackNumber,
          type: TrackType.artist,
          imageUrl: track.album.images.first.url,
          trackName: track.name,
          durationMs: 0,
          isFavorite: favorite.isNotEmpty
              ? favorite
                      .where((favorite) => favorite.trackId == track.id)
                      .firstOrNull
                      ?.isFavorite ??
                  false
              : false,
        ),
      )
      .toList();
}

extension FavoriteMapper on List<FavoriteEntity> {
  List<Track> transform() => map(
        (fav) => Track(
          trackId: fav.trackId.toString(),
          albumId: null,
          artistName: null,
          trackNumber: null,
          type: TrackType.favorite,
          imageUrl: null,
          trackName: fav.title,
          isFavorite: fav.isFavorite,
          durationMs: 0,
        ),
      ).toList();
}
