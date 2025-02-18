import 'package:json_annotation/json_annotation.dart';

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
}
