import 'package:floor/floor.dart';
import 'package:spookify_v2/database/data/local/entity/entity.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM FavoriteEntity')
  Future<List<FavoriteEntity>?> findAllTracks();

  @Query('SELECT * FROM FavoriteEntity WHERE trackId = :id')
  Future<FavoriteEntity?> findTrackById(String id);

  @insert
  Future<int> insertTrackFavorite(FavoriteEntity favorite);

  // @delete
  // Future<void> deleteTrack(FavoriteEntity favorite);
  @Query('DELETE FROM FavoriteEntity WHERE trackId = :id')
  Future<int?> deleteTrack(String id);
}
