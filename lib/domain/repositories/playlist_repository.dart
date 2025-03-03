import 'package:dartz/dartz.dart';
import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/models.dart';

abstract class PlaylistRepository {
  Future<Either<Failure, List<int>>> getPlaylist({
    String id,
    String playlistType,
  });
  Future<Either<Failure, Track>> getTrack(String id);
  Future<Either<Failure, List<Favorite>>> getFavoritePlaylist(String id);

  Future<Either<Failure, bool>> saveFavoriteTrack(Favorite favorite);
  Future<Either<Failure, bool>> saveDownloadedPlaylist(Category playlist);
}
