import 'package:equatable/equatable.dart';
import 'package:spookify_v2/src/domain/models/models.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';

class Favorite extends Equatable {
  final String id;
  final String name;
  final TrackType type;
  final ImageObject imageUrl;
  final String artist;

  const Favorite({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.artist,
  });

  factory Favorite.fromTrack({
    required String tempImageUrl,
    required Track track,
  }) {
    return Favorite(
      id: track.trackId,
      name: track.trackName,
      type: track.type,
      imageUrl: track.imageUrl ?? ImageObject(imageUrl: tempImageUrl),
      artist: track.artistName ?? '',
    );
  }
  @override
  List<Object?> get props => [
        id,
      ];

  Favorite copyWith({
    String? id,
    String? name,
    TrackType? type,
    ImageObject? imageUrl,
    String? artist,
  }) {
    return Favorite(
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
