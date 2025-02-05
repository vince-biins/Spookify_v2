import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';
import 'package:spookify_v2/core/network/mixin/mixin.dart';
import 'package:spookify_v2/features/playlist/data/local/local.dart';
import 'package:spookify_v2/features/playlist/domain/mapper/mapper.dart';
import 'package:spookify_v2/features/playlist/data/remote/service/service.dart';

import 'package:spookify_v2/features/playlist/domain/model/track.dart';
import 'package:spookify_v2/features/playlist/domain/repository/repository.dart';

class PlaylistRepositoryImpl
    with ApiErrorHandler
    implements PlaylistRepository {
  final PlaylistService _service;
  final FavoriteDao _favoriteDao;

  PlaylistRepositoryImpl({
    required PlaylistService service,
    required FavoriteDao favoriteDao,
  })  : _service = service,
        _favoriteDao = favoriteDao;

  @override
  Future<Either<Failure, List<Track>>> getAlbumTrack(String id) async {
    try {
      final dbResult = await _favoriteDao.findAllTracks();

      final response = await _service.getCategoryTracks(id);
      return Right(response.transform(dbResult ?? []));
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, List<Track>>> getArtistTopTracks(
    String id,
  ) async {
    try {
      final dbResult = await _favoriteDao.findAllTracks();

      final response = await _service.getArtistTopTracks(id);

      return Right(response.transform(dbResult ?? []));
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavorite(String trackId) async {
    try {
      final res = await _favoriteDao.deleteTrack(trackId);

      return const Right(false);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Track>>> fetchFavorites() async {
    try {
      final res = await _favoriteDao.findAllTracks();

      return Right(res?.transform() ?? []);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> insertFavorite(FavoriteEntity favorite) async {
    try {
      await _favoriteDao.insertTrackFavorite(favorite);

      return const Right(true);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
