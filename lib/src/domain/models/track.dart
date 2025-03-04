import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:spookify_v2/src/domain/models/favorite.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/artist_top_track_response.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/track_response.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/favorite_entity.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/track_entity.dart';

@immutable
class Track extends Equatable {
  final String trackId;
  final String? albumId;
  final String? artistName;
  final int? trackNumber;
  final TrackType type;
  final String? imageUrl;
  final String trackName;
  final bool isFavorite;
  final int durationMs;

  const Track({
    required this.trackId,
    required this.albumId,
    required this.artistName,
    required this.trackNumber,
    required this.type,
    required this.imageUrl,
    required this.trackName,
    required this.isFavorite,
    required this.durationMs,
  });

  factory Track.fromTrackDto({
    required TrackResponseItem track,
    required List<FavoriteEntity> favorite,
  }) {
    return Track(
      trackId: track.id,
      albumId: null,
      artistName: track.artists.map((artist) => artist.name).join(', '),
      trackNumber: track.trackNumber,
      type: TrackType.album,
      imageUrl: track.album?.images.firstOrNull?.url,
      trackName: track.name,
      isFavorite: favorite.isNotEmpty
          ? favorite
                  .where((favorite) => favorite.trackId == track.id)
                  .firstOrNull
                  ?.isFavorite ??
              false
          : false,
      durationMs: track.durationMs,
    );
  }

  factory Track.fromSingleTrackDto({
    required TrackResponseItem track,
    required bool isFavorite,
  }) {
    return Track(
      trackId: track.id,
      albumId: null,
      artistName: track.artists.map((artist) => artist.name).join(', '),
      trackNumber: track.trackNumber,
      type: TrackType.album,
      imageUrl: track.album?.images.firstOrNull?.url,
      trackName: track.name,
      isFavorite: isFavorite,
      durationMs: track.durationMs,
    );
  }

  factory Track.fromTrackEntity(FavoriteEntity fav) {
    return Track(
      trackId: fav.trackId.toString(),
      albumId: null,
      artistName: fav.artist,
      trackNumber: null,
      type: TrackType.favorite,
      imageUrl: fav.imageUrl.isNotEmpty ? fav.imageUrl : null,
      trackName: fav.title,
      isFavorite: fav.isFavorite,
      durationMs: 0,
    );
  }

  factory Track.fromArtistDto({
    required ArtistTopTrackItem artist,
    required List<FavoriteEntity> favorite,
  }) {
    return Track(
      trackId: artist.id,
      albumId: artist.album.id,
      artistName: null,
      trackNumber: artist.trackNumber,
      type: TrackType.artist,
      imageUrl: artist.album.images.first.url,
      trackName: artist.name,
      durationMs: 0,
      isFavorite: favorite.isNotEmpty
          ? favorite
                  .where((favorite) => favorite.trackId == artist.id)
                  .firstOrNull
                  ?.isFavorite ??
              false
          : false,
    );
  }

  TrackEntity toTrackEntity(String categoryId) => TrackEntity(
        categoryId: categoryId,
        trackId: trackId,
        albumId: albumId,
        artistName: artistName,
        trackNumber: trackNumber,
        type: type,
        imageUrl: imageUrl,
        trackName: trackName,
        isFavorite: isFavorite,
        durationMs: durationMs,
      );

  Favorite toFavorite(String tempImageUrl) => Favorite(
        id: trackId,
        name: trackName,
        type: type,
        imageUrl: imageUrl ?? tempImageUrl,
        artist: artistName ?? '',
      );

  Track copyWith({
    String? trackId,
    String? albumId,
    String? artistName,
    int? trackNumber,
    TrackType? type,
    String? imageUrl,
    String? trackName,
    bool? isFavorite,
    int? durationMs,
  }) {
    return Track(
      trackId: trackId ?? this.trackId,
      albumId: albumId ?? this.albumId,
      artistName: artistName ?? this.artistName,
      trackNumber: trackNumber ?? this.trackNumber,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
      trackName: trackName ?? this.trackName,
      isFavorite: isFavorite ?? this.isFavorite,
      durationMs: durationMs ?? this.durationMs,
    );
  }

  @override
  List<Object?> get props => [
        trackId,
        albumId,
        artistName,
        trackName,
        trackNumber,
        type,
        imageUrl,
        isFavorite,
        durationMs,
      ];

  @override
  bool get stringify => true;
}
