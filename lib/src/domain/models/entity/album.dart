// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';

import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/domain/models/entity/artist.dart';

class Album extends Equatable {
  final String id;
  final String name;
  final TrackType type;
  final ImageObject? imageUrl;
  final List<Artist> artist;

  const Album({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.artist,
  });

  // factory Album.fromAlbumDto(AlbumItem album) {
  //   return Album(
  //     id: album.id,
  //     name: album.name,
  //     type: TrackType.album,
  //     imageUrl: album.images.firstOrNull?.url ?? '',
  //     artist: album.artists.map((item) => Artist.fromArtistDto(item)).toList(),
  //   );
  // }
  // factory Album.fromAlbumDto(AlbumItem album) {
  //   return Album(
  //     id: album.id,
  //     name: album.name,
  //     type: TrackType.album,
  //     imageUrl: album.images.firstOrNull?.url ?? '',
  //     artist: album.artists.map((item) => Artist.fromArtistDto(item)).toList(),
  //   );
  // }
  @override
  List<Object?> get props => [
        id,
      ];

  Album copyWith({
    String? id,
    String? name,
    TrackType? type,
    ImageObject? imageUrl,
    List<Artist>? artist,
  }) {
    return Album(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      imageUrl: imageUrl ?? this.imageUrl,
      artist: artist ?? this.artist,
    );
  }

  @override
  bool get stringify => true;
}
