import 'package:json_annotation/json_annotation.dart';
import 'package:spookify_v2/src/domain/models/models.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/entity.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/icon_response.dart';

part 'artist_top_track_response.g.dart';

@JsonSerializable()
class ArtistTopTrackResponse {
  List<ArtistTopTrackItem> tracks;
  ArtistTopTrackResponse({
    required this.tracks,
  });

  factory ArtistTopTrackResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtistTopTrackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistTopTrackResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class ArtistTopTrackItem {
  final String id;
  final ({String id, List<IconResponse> images}) album;
  final String name;
  @JsonKey(name: 'track_number')
  final int trackNumber;

  ArtistTopTrackItem({
    required this.id,
    required this.album,
    required this.name,
    required this.trackNumber,
  });
  factory ArtistTopTrackItem.fromJson(Map<String, dynamic> json) =>
      _$ArtistTopTrackItemFromJson(json);

  Map<String, dynamic> toJson() => _$ArtistTopTrackItemToJson(this);

  @override
  String toString() => toJson().toString();

  Track toTrackEntity({
    required List<FavoriteEntity> favorite,
  }) {
    return Track(
      trackId: id,
      albumId: album.id,
      artistName: null,
      trackNumber: trackNumber,
      type: TrackType.artist,
      imageUrl: album.images.first.toImageObject(),
      trackName: name,
      durationMs: 0,
      isFavorite: favorite.isNotEmpty
          ? favorite
                  .where((favorite) => favorite.trackId == id)
                  .firstOrNull
                  ?.isFavorite ??
              false
          : false,
    );
  }
}
