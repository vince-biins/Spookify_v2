import 'package:floor/floor.dart';

@entity
class FavoriteEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String imageUrl;
  final String trackId;
  final String title;
  final bool isFavorite;

  FavoriteEntity({
    this.id,
    required this.trackId,
    required this.title,
    required this.imageUrl,
    required this.isFavorite,
  });

  @override
  String toString() =>
      'FAVORITE ENTITY(id = $id, trackId = $trackId, title = $title, isFavorite = $isFavorite, imageUrl = $imageUrl)';
}
