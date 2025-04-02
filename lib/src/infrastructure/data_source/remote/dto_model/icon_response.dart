import 'package:json_annotation/json_annotation.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';

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

  factory IconResponse.fromValueObject(ImageObject? image) {
    return IconResponse(url: image?.imageUrl ?? '');
  }

  ImageObject toImageObject() {
    return ImageObject(imageUrl: url);
  }
}
