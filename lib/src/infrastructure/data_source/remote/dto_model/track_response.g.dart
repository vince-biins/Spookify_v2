// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TrackResponse _$TrackResponseFromJson(Map<String, dynamic> json) =>
    TrackResponse(
      items: (json['items'] as List<dynamic>)
          .map((e) => TrackResponseItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TrackResponseToJson(TrackResponse instance) =>
    <String, dynamic>{
      'items': instance.items,
    };

TrackResponseItem _$TrackResponseItemFromJson(Map<String, dynamic> json) =>
    TrackResponseItem(
      id: json['id'] as String,
      name: json['name'] as String,
      trackNumber: (json['track_number'] as num).toInt(),
      type: json['type'] as String,
      artists: (json['artists'] as List<dynamic>)
          .map((e) => _$recordConvert(
                e,
                ($jsonValue) => (
                  id: $jsonValue['id'] as String,
                  name: $jsonValue['name'] as String,
                ),
              ))
          .toList(),
      durationMs: (json['duration_ms'] as num).toInt(),
      album: _$recordConvertNullable(
        json['album'],
        ($jsonValue) => (
          images: ($jsonValue['images'] as List<dynamic>)
              .map(
                  (e) => TrackImageResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
    );

Map<String, dynamic> _$TrackResponseItemToJson(TrackResponseItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'track_number': instance.trackNumber,
      'type': instance.type,
      'artists': instance.artists
          .map((e) => <String, dynamic>{
                'id': e.id,
                'name': e.name,
              })
          .toList(),
      'duration_ms': instance.durationMs,
      'album': instance.album == null
          ? null
          : <String, dynamic>{
              'images': instance.album!.images,
            },
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);

$Rec? _$recordConvertNullable<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    value == null ? null : convert(value as Map<String, dynamic>);

TrackImageResponse _$TrackImageResponseFromJson(Map<String, dynamic> json) =>
    TrackImageResponse(
      url: json['url'] as String,
    );

Map<String, dynamic> _$TrackImageResponseToJson(TrackImageResponse instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
