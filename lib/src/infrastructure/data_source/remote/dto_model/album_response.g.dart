// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AlbumResponse _$AlbumResponseFromJson(Map<String, dynamic> json) =>
    AlbumResponse(
      albums: (json['albums'] as List<dynamic>)
          .map((e) => AlbumItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumResponseToJson(AlbumResponse instance) =>
    <String, dynamic>{
      'albums': instance.albums,
    };

AlbumItem _$AlbumItemFromJson(Map<String, dynamic> json) => AlbumItem(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      images: (json['images'] as List<dynamic>)
          .map((e) => IconResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      artists: (json['artists'] as List<dynamic>)
          .map((e) => ArtistItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AlbumItemToJson(AlbumItem instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'images': instance.images,
      'artists': instance.artists,
    };
