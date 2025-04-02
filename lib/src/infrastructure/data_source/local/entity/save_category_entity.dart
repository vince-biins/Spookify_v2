import 'package:floor/floor.dart';
import 'package:spookify_v2/src/domain/models/entity/category.dart';
import 'package:spookify_v2/src/domain/models/entity/downloads.dart';
import 'package:spookify_v2/src/domain/models/value_object/image_object.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/utils/constants/constants.dart';

@Entity(tableName: saveCategoryEntity)
class SaveCategoryEntity {
  @PrimaryKey(autoGenerate: true)
  int? id;
  final String trackId;
  final String title;
  final String? imageUrl;
  final String? artistName;
  final TrackType type;

  SaveCategoryEntity({
    this.id,
    required this.title,
    required this.trackId,
    required this.imageUrl,
    required this.artistName,
    required this.type,
  });
  factory SaveCategoryEntity.fromEntity(Category category) =>
      SaveCategoryEntity(
        title: category.name,
        trackId: category.id,
        imageUrl: category.imageUrl?.imageUrl,
        artistName: category.artistName,
        type: category.type,
      );

  Downloads toDownloadEntity() {
    return Downloads(
      trackId: trackId,
      title: title,
      imageUrl: ImageObject(imageUrl: imageUrl ?? ''),
      artistName: artistName,
      type: type,
    );
  }
}
