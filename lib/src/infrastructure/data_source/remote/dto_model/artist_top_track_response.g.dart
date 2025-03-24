// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'artist_top_track_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArtistTopTrackResponse _$ArtistTopTrackResponseFromJson(
        Map<String, dynamic> json) =>
    ArtistTopTrackResponse(
      tracks: (json['tracks'] as List<dynamic>)
          .map((e) => ArtistTopTrackItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ArtistTopTrackResponseToJson(
        ArtistTopTrackResponse instance) =>
    <String, dynamic>{
      'tracks': instance.tracks,
    };

ArtistTopTrackItem _$ArtistTopTrackItemFromJson(Map<String, dynamic> json) =>
    ArtistTopTrackItem(
      id: json['id'] as String,
      album: _$recordConvert(
        json['album'],
        ($jsonValue) => (
          id: $jsonValue['id'] as String,
          images: ($jsonValue['images'] as List<dynamic>)
              .map((e) => IconResponse.fromJson(e as Map<String, dynamic>))
              .toList(),
        ),
      ),
      name: json['name'] as String,
      trackNumber: (json['track_number'] as num).toInt(),
    );

Map<String, dynamic> _$ArtistTopTrackItemToJson(ArtistTopTrackItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'album': <String, dynamic>{
        'id': instance.album.id,
        'images': instance.album.images,
      },
      'name': instance.name,
      'track_number': instance.trackNumber,
    };

$Rec _$recordConvert<$Rec>(
  Object? value,
  $Rec Function(Map) convert,
) =>
    convert(value as Map<String, dynamic>);
