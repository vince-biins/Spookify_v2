import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';

import 'package:spookify_v2/features/playlist/data/local/entity/entity.dart';

import 'package:spookify_v2/features/playlist/domain/model/model.dart';

abstract class PlaylistRepository {
  Future<Either<Failure, List<Track>>> getAlbumTrack(String id);
  Future<Either<Failure, List<Track>>> getArtistTopTracks(String id);
  Future<Either<Failure, bool>> insertFavorite(FavoriteEntity favorite);
  Future<Either<Failure, bool>> deleteFavorite(String trackId);
  Future<Either<Failure, List<Track>>> fetchFavorites();
}
