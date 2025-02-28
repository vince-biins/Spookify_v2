import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';
import 'package:spookify_v2/core/network/mixin/mixin.dart';
import 'package:spookify_v2/database/data/local/dao/save_category_dao.dart';
import 'package:spookify_v2/database/data/local/dao/track_dao.dart';
import 'package:spookify_v2/database/data/local/local.dart';
import 'package:spookify_v2/database/domain/repository/local_repository.dart';
import 'package:spookify_v2/features/playlist/domain/mapper/mapper.dart';
import 'package:spookify_v2/features/playlist/data/remote/service/service.dart';
import 'package:spookify_v2/features/playlist/domain/model/save_category_dto.dart';

import 'package:spookify_v2/features/playlist/domain/model/track.dart';
import 'package:spookify_v2/features/playlist/domain/repository/repository.dart';

class PlaylistRepositoryImpl
    with ApiErrorHandler
    implements PlaylistRepository {
  final PlaylistService _service;
  final FavoriteDao _favoriteDao;
  final SavedCategoryDao _savedCategoryDao;
  final TrackDao _trackDao;

  PlaylistRepositoryImpl({
    required PlaylistService service,
    required FavoriteDao favoriteDao,
    required SavedCategoryDao saveCategoryDao,
    required TrackDao trackDao,
  })  : _service = service,
        _savedCategoryDao = saveCategoryDao,
        _trackDao = trackDao,
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
      if (res != null) {
        return Right(!(res > 0));
      } else {
        throw Exception('Track not found');
      }
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
  Future<Either<Failure, bool>> fetchFavoriteById({required String id}) async {
    try {
      final res = await _favoriteDao.findTrackById(id);

      return Right(res?.isFavorite ?? false);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> insertFavorite(FavoriteEntity favorite) async {
    try {
      final res = await _favoriteDao.insertTrackFavorite(favorite);

      return Right(res > 0);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, Track>> getTrack({required String id}) async {
    try {
      final localResponse = await _favoriteDao.findTrackById(id);
      final response = await _service.getTrack(id);

      return Right(response.transform(localResponse));
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> saveAllTracksInLocal({
    required SaveCategoryDto saveCategory,
    required List<Track> tracks,
  }) async {
    try {
      final saveCategoryResult =
          await _savedCategoryDao.insertCategory(saveCategory.toEntity());
      final trackResult = await _trackDao.insertAllTracks(
        tracks.map((item) => item.toEntity(saveCategory.id)).toList(),
      );

      return Right(saveCategoryResult > 0 && trackResult.isNotEmpty);
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> getSavedCategoryById(String id) async {
    try {
      final saveCategoryResult = await _savedCategoryDao.getCategoryById(id);

      if (saveCategoryResult != null) {
        return const Right(true);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteSavedCategoryById(String id) async {
    try {
      int? categoryResult;
      int? trackResult;
      await Future.wait([
        _savedCategoryDao
            .deleteCategory(id)
            .then((res) => categoryResult = res),
        _trackDao.deleteAllForCategory(id).then((res) => trackResult = res),
      ]);

      print(categoryResult);
      if (categoryResult != null && trackResult != null) {
        return Right(categoryResult! > 0 && trackResult! > 0);
      } else {
        return const Right(false);
      }
    } catch (e) {
      return Left(handleApiError(e));
    }
  }
}
