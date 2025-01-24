// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistResponse _$ArtistResponseFromJson(Map<String, dynamic> json) =>
    ArtistResponse(
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistResponseToJson(ArtistResponse instance) =>
    <String, dynamic>{
      'artists': instance.artists,
    };

ArtistItem _$ArtistItemFromJson(Map<String, dynamic> json) => ArtistItem(
      id: json['id'] as String,
      name: json['name'] as String,
      followers: _$recordConvertNullable(
        json['followers'],
        ($jsonValue) => (total: ($jsonValue['total'] as num).toInt(),),
      ),
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => IconResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      type: json['type'] as String,
      genres:
          (json['genres'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$ArtistItemToJson(ArtistItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'followers': instance.followers == null
          ? null
          : <String, dynamic>{
              'total': instance.followers!.total,
            },
      'images': instance.images,
      'type': instance.type,
      'genres': instance.genres,
    };

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    value == null ? null : convert(value as Map<String, dynamic>);
