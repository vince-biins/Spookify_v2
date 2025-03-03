import 'package:equatable/equatable.dart';
import 'package:spookify_v2/presentation/utils/track_type.dart';

class SaveCategoryDto extends Equatable {
  final String id;
  final String title;
  final String? imageUrl;
  final String? artistName;
  final TrackType type;

  const SaveCategoryDto({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.artistName,
    required this.type,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        imageUrl,
        artistName,
        type,
      ];
}
