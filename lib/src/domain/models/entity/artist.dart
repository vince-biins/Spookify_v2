// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';

import 'package:spookify_v2/src/domain/resources/track_type.dart';

class Artist extends Equatable {
  final String name;
  final String id;
  final ImageObject? imageUrl;
  final int followers;
  final List<String> genre;
  final TrackType type;

  const Artist({
    required this.name,
    required this.id,
    required this.imageUrl,
    required this.followers,
    required this.genre,
    required this.type,
  });

  // factory Artist.fromArtistDto(ArtistItem artist) {
  //   return Artist(
  //     name: artist.name,
  //     id: artist.id,
  //     imageUrl: artist.images?.firstOrNull?.url ?? '',
  //     followers: artist.followers?.total ?? 0,
  //     genre: artist.genres ?? [],
  //     type: TrackType.artist,
  //   );
  // }
  @override
  List<Object?> get props => [
        id,
      ];

  Artist copyWith({
    String? name,
    String? id,
    ImageObject? imageUrl,
    int? followers,
    List<String>? genre,
    TrackType? type,
  }) {
    return Artist(
      name: name ?? this.name,
      id: id ?? this.id,
      imageUrl: imageUrl ?? this.imageUrl,
      followers: followers ?? this.followers,
      genre: genre ?? this.genre,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;
}
