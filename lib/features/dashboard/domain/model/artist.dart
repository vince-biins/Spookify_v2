import 'package:equatable/equatable.dart';
import 'package:spookify_v2/core/utils/track_type.dart';

class Artist extends Equatable {
  final String name;
  final String id;
  final String imageUrl;
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

  @override
  List<Object?> get props => [
        id,
        name,
        imageUrl,
        followers,
        genre,
        type,
      ];
}
