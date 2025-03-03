// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:spookify_v2/presentation/utils/track_type.dart';
import 'package:spookify_v2/domain/models/artist.dart';
import 'package:spookify_v2/infrastructure/data_source/remote/dto_model/album_response.dart';

class Album extends Equatable {
  final String id;
  final String name;
  final TrackType type;
  final String imageUrl;
  final List<Artist> artist;

  const Album({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.artist,
  });

  factory Album.fromAlbumDto(AlbumItem album) {
    return Album(
      id: album.id,
      name: album.name,
      type: TrackType.album,
      imageUrl: album.images.firstOrNull?.url ?? '',
      artist: album.artists.map((item) => Artist.fromArtistDto(item)).toList(),
    );
  }
  @override
  List<Object?> get props => [
        id,
        name,
        type,
        imageUrl,
        artist,
      ];

  Album copyWith({
    String? id,
    String? name,
    TrackType? type,
    String? imageUrl,
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
