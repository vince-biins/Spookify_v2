import 'package:floor/floor.dart';
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
}
