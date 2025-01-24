import 'package:spookify_v2/features/playlist/data/model/artist_top_track_response.dart';
import 'package:spookify_v2/features/playlist/data/model/track_response.dart';

import 'package:spookify_v2/features/playlist/domain/model/track.dart';
import 'package:spookify_v2/core/utils/track_type.dart';

extension AlbumTrackMapper on TrackResponse {
  List<Track> transform() => items
      .map(
        (item) => Track(
          trackId: item.id,
          albumId: null,
          artistName: item.artists.map((artist) => artist.name).join(', '),
          trackNumber: item.trackNumber,
          type: TrackType.album,
          imageUrl: null,
          trackName: item.name,
        ),
      )
      .toList();
}

extension ArtistTopTrackMapper on ArtistTopTrackResponse {
  List<Track> transform() => tracks
      .map(
        (track) => Track(
          trackId: track.id,
          albumId: track.album.id,
          artistName: null,
          trackNumber: track.trackNumber,
          type: TrackType.artist,
          imageUrl: track.album.images.first.url,
          trackName: track.name,
        ),
      )
      .toList();
}
