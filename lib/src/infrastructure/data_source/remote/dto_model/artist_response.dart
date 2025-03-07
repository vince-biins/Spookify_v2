import 'package:json_annotation/json_annotation.dart';
import 'package:spookify_v2/src/domain/models/artist.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/icon_response.dart';

part 'artist_response.g.dart';

@JsonSerializable()
class ArtistResponse {
  final List<ArtistItem> artists;

  ArtistResponse({required this.artists});

  factory ArtistResponse.fromJson(Map<String, dynamic> json) =>
      _$ArtistResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class ArtistItem {
  final String id;
  final String name;
  final ({int total})? followers;
  final List<IconResponse>? images;
  final String type;
  final List<String>? genres;

  ArtistItem({
    required this.id,
    required this.name,
    required this.followers,
    required this.images,
    required this.type,
    required this.genres,
  });

  factory ArtistItem.fromJson(Map<String, dynamic> json) =>
      _$ArtistItemFromJson(json);
  Map<String, dynamic> toJson() => _$ArtistItemToJson(this);

  @override
  String toString() => toJson().toString();

  Artist toArtistEntity() {
    return Artist(
      name: name,
      id: id,
      imageUrl: images?.firstOrNull?.toImageObject(),
      followers: followers?.total ?? 0,
      genre: genres ?? [],
      type: TrackType.artist,
    );
  }
}
