import 'package:floor/floor.dart';
import 'package:spookify_v2/database/data/constants/constants.dart';
import 'package:spookify_v2/database/data/local/entity/track_entity.dart';

@dao
abstract class TrackDao {
  @Query('SELECT * FROM $trackEntity WHERE categoryId = :categoryId')
  Future<List<TrackEntity>> getTrackForCategory(String categoryId);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<List<int>> insertAllTracks(List<TrackEntity> music);

  @Query('DELETE FROM $trackEntity WHERE categoryId = :categoryId')
  Future<int?> deleteAllForCategory(String categoryId);
}
