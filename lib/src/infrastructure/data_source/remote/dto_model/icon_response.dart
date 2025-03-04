import 'package:json_annotation/json_annotation.dart';

part 'icon_response.g.dart';

@JsonSerializable()
class IconResponse {
  String url;
  IconResponse({
    required this.url,
  });

  factory IconResponse.fromJson(Map<String, dynamic> json) =>
      _$IconResponseFromJson(json);
  Map<String, dynamic> toJson() => _$IconResponseToJson(this);

  @override
  String toString() => toJson().toString();
}
