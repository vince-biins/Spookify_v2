import 'package:dartz/dartz.dart';
import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/aggregate/playlist.dart';
import 'package:spookify_v2/src/domain/models/entity/favorite.dart';
import 'package:spookify_v2/src/domain/models/entity/track.dart';
import 'package:spookify_v2/src/domain/repositories/playlist_repository.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/favorite_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/save_category_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/track_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/favorite_entity.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/save_category_entity.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/entity/track_entity.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/service/playlist_service.dart';
import 'package:spookify_v2/utils/mixin/api_error_handler.dart';

class PlaylistRepositoryImplV2
    with ApiErrorHandler
    implements PlaylistRepository {
  final FavoriteDao _favoriteDao;
  final PlaylistService _service;
  final SavedCategoryDao _savedCategoryDao;
  final TrackDao _trackDao;

  PlaylistRepositoryImplV2({
    required FavoriteDao favoriteDao,
    required PlaylistService service,
    required SavedCategoryDao saveCategoryDao,
    required TrackDao trackDao,
  })  : _service = service,
        _savedCategoryDao = saveCategoryDao,
        _trackDao = trackDao,
        _favoriteDao = favoriteDao;

  @override
  Future<Either<Failure, List<Track>>> getTrack({
    required String? id,
    required TrackType trackType,
  }) async {
    try {
      final favorite = await _favoriteDao.findAllTracks();

      final transformedResult = switch (trackType) {
        TrackType.artist => (await _service.getArtistTopTracks(id!))
            .tracks
            .map(
              (artist) => artist.toTrackEntity(favorite: favorite ?? []),
            )
            .toList(),
        TrackType.album => (await _service.getCategoryTracks(id!))
            .items
            .map(
              (album) => album.toTrackEntity(favorite ?? []),
            )
            .toList(),
        TrackType.favorite => (await _favoriteDao.findAllTracks())
                ?.map((item) => item.toTrackEntity())
                .toList() ??
            [],
        _ => throw Exception('Invalid track type'),
      };

      return Right(transformedResult);
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> saveDownloadedPlaylist(
    Playlist playlist,
  ) async {
    try {
      final savedDaoResult = await _savedCategoryDao
          .insertCategory(SaveCategoryEntity.fromEntity(playlist.category));

      final trackResult = await _trackDao.insertAllTracks(
        playlist.tracks
            .map(
              (track) => TrackEntity.fromTrack(
                categoryId: playlist.category.id,
                track: track,
              ),
            )
            .toList(),
      );

      return Right(savedDaoResult > 0 && trackResult.isNotEmpty);
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> saveFavoriteTrack(
    Track track,
    String tempImageUrl,
  ) async {
    try {
      final res = await _favoriteDao.insertTrackFavorite(
        FavoriteEntity.fromFavoriteEntity(
          favorite:
              Favorite.fromTrack(tempImageUrl: tempImageUrl, track: track),
          isFavorite: true,
        ),
      );

      return Right(res > 0);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavoriteTrack(String trackId) async {
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
  Future<Either<Failure, List<int>>> getPlaylist({
    required String id,
    required String playlistType,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Track>> getTrackById({required String id}) async {
    try {
      final localResponse = await _favoriteDao.findTrackById(id);
      final response = await _service.getTrack(id);

      return Right(
        response.toSingleTrackEntity(localResponse?.isFavorite ?? false),
      );
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> getDownloadedById(String id) async {
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
  Future<Either<Failure, bool>> deleteDownloadedPLaylistById(String id) async {
    try {
      int? categoryResult;
      int? trackResult;
      await Future.wait([
        _savedCategoryDao
            .deleteCategory(id)
            .then((res) => categoryResult = res),
        _trackDao.deleteAllForCategory(id).then((res) => trackResult = res),
      ]);

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
