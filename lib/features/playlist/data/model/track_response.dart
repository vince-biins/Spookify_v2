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

  TrackResponseItem({
    required this.id,
    required this.name,
    required this.trackNumber,
    required this.type,
    required this.artists,
  });

  factory TrackResponseItem.fromJson(Map<String, dynamic> json) =>
      _$TrackResponseItemFromJson(json);
  Map<String, dynamic> toJson() => _$TrackResponseItemToJson(this);

  @override
  String toString() => toJson().toString();
}
