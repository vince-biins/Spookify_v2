import 'package:floor/floor.dart';
import 'package:spookify_v2/features/playlist/data/local/entity/entity.dart';

@dao
abstract class FavoriteDao {
  @Query('SELECT * FROM FavoriteEntity')
  Future<List<FavoriteEntity>?> findAllTracks();

  @Query('SELECT * FROM FavoriteEntity WHERE id = :id')
  Future<FavoriteEntity?> findTrackById(int id);

  @insert
  Future<void> insertTrackFavorite(FavoriteEntity favorite);

  // @delete
  // Future<void> deleteTrack(FavoriteEntity favorite);
  @Query('DELETE FROM FavoriteEntity WHERE trackId = :id')
  Future<void> deleteTrack(String id);
}
