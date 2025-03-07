import 'package:json_annotation/json_annotation.dart';
import 'package:spookify_v2/src/domain/models/models.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/entity.dart';

part 'track_response.g.dart';

@JsonSerializable()
class TrackResponse {
  final List<TrackResponseItem> items;

  TrackResponse({required this.items});

  factory TrackResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrackResponseToJson(this);
  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class TrackResponseItem {
  final String id;
  final String name;
  @JsonKey(name: 'track_number')
  final int trackNumber;
  final String type;
  final List<({String id, String name})> artists;
  @JsonKey(name: 'duration_ms')
  final int durationMs;
  final ({List<TrackImageResponse> images})? album;

  TrackResponseItem({
    required this.id,
    required this.name,
    required this.trackNumber,
    required this.type,
    required this.artists,
    required this.durationMs,
    required this.album,
  });

  factory TrackResponseItem.fromJson(Map<String, dynamic> json) =>
      _$TrackResponseItemFromJson(json);
  Map<String, dynamic> toJson() => _$TrackResponseItemToJson(this);

  @override
  String toString() => toJson().toString();

  Track toTrackEntity(
    List<FavoriteEntity> favorite,
  ) {
    return Track(
      trackId: id,
      albumId: null,
      artistName: artists.map((artist) => artist.name).join(', '),
      trackNumber: trackNumber,
      type: TrackType.album,
      imageUrl: album?.images.firstOrNull?.toImageObject(),
      trackName: name,
      isFavorite: favorite.isNotEmpty
          ? favorite
                  .where((favorite) => favorite.trackId == id)
                  .firstOrNull
                  ?.isFavorite ??
              false
          : false,
      durationMs: durationMs,
    );
  }

  Track toSingleTrackEntity(
    bool isFavorite,
  ) {
    return Track(
      trackId: id,
      albumId: null,
      artistName: artists.map((artist) => artist.name).join(', '),
      trackNumber: trackNumber,
      type: TrackType.album,
      imageUrl: album?.images.firstOrNull?.toImageObject(),
      trackName: name,
      isFavorite: isFavorite,
      durationMs: durationMs,
    );
  }
}

@JsonSerializable()
class TrackImageResponse {
  final String url;

  TrackImageResponse({required this.url});

  factory TrackImageResponse.fromJson(Map<String, dynamic> json) =>
      _$TrackImageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TrackImageResponseToJson(this);
  @override
  String toString() => toJson().toString();

  ImageObject toImageObject() {
    return ImageObject(imageUrl: url);
  }
}
