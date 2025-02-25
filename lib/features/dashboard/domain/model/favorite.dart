import 'package:equatable/equatable.dart';
import 'package:spookify_v2/core/utils/track_type.dart';

class Favorite extends Equatable {
  final String id;
  final String name;
  final TrackType type;
  final String imageUrl;
  final String artist;

  const Favorite({
    required this.id,
    required this.name,
    required this.type,
    required this.imageUrl,
    required this.artist,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        type,
        imageUrl,
        artist,
      ];
}
