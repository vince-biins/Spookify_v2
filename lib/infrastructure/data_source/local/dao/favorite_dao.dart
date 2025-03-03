import 'package:floor/floor.dart';
import 'package:spookify_v2/infrastructure/constants/constants.dart';
import 'package:spookify_v2/infrastructure/data_source/local/entity/entity.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM  $favoriteEntity')
  Future<List<FavoriteEntity>?> findAllTracks();

  @Query('SELECT * FROM $favoriteEntity WHERE trackId = :id')
  Future<FavoriteEntity?> findTrackById(String id);

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<int> insertTrackFavorite(FavoriteEntity favorite);

  // @delete
  // Future<void> deleteTrack(FavoriteEntity favorite);
  @Query('DELETE FROM $favoriteEntity WHERE trackId = :id')
  Future<int?> deleteTrack(String id);
}
