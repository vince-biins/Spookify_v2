// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

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
  final ({String id, List<({String url})> images}) album;
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
}
