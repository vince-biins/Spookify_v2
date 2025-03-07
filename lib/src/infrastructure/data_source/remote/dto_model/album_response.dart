import 'package:json_annotation/json_annotation.dart';
import 'package:spookify_v2/src/domain/models/album.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/artist_response.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/dto_model/icon_response.dart';

part 'album_response.g.dart';

@JsonSerializable()
class AlbumResponse {
  final List<AlbumItem> albums;

  AlbumResponse({required this.albums});

  factory AlbumResponse.fromJson(Map<String, dynamic> json) =>
      _$AlbumResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumResponseToJson(this);

  @override
  String toString() => toJson().toString();
}

@JsonSerializable()
class AlbumItem {
  final String id;
  final String name;
  final String type;
  final List<IconResponse> images;
  final List<ArtistItem> artists;

  AlbumItem({
    required this.id,
    required this.name,
    required this.type,
    required this.images,
    required this.artists,
  });

  factory AlbumItem.fromJson(Map<String, dynamic> json) =>
      _$AlbumItemFromJson(json);
  Map<String, dynamic> toJson() => _$AlbumItemToJson(this);

  @override
  String toString() => toJson().toString();

  Album toAlbumEntity() {
    return Album(
      id: id,
      name: name,
      type: TrackType.album,
      imageUrl: images.firstOrNull?.toImageObject(),
      artist: artists.map((artist) => artist.toArtistEntity()).toList(),
    );
  }
}
