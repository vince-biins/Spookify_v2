import 'package:dartz/dartz.dart';
import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/favorite.dart';
import 'package:spookify_v2/src/domain/models/playlist.dart';
import 'package:spookify_v2/src/domain/models/track.dart';
import 'package:spookify_v2/src/domain/repositories/playlist_repository.dart';
import 'package:spookify_v2/src/domain/resources/track_type.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/favorite_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/save_category_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/track_dao.dart';
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
              (artist) =>
                  Track.fromArtistDto(artist: artist, favorite: favorite ?? []),
            )
            .toList(),
        TrackType.album => (await _service.getCategoryTracks(id!))
            .items
            .map(
              (album) =>
                  Track.fromTrackDto(track: album, favorite: favorite ?? []),
            )
            .toList(),
        TrackType.favorite => (await _favoriteDao.findAllTracks())
                ?.map((item) => Track.fromTrackEntity(item))
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
          .insertCategory(playlist.category.toSaveCategoryEntity());

      final trackResult = await _trackDao.insertAllTracks(
        playlist.tracks
            .map((track) => track.toTrackEntity(playlist.category.id))
            .toList(),
      );

      return Right(savedDaoResult > 0 && trackResult.isNotEmpty);
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, bool>> saveFavoriteTrack(
      Track track, String tempImageUrl) async {
    try {
      final res = await _favoriteDao.insertTrackFavorite(
          track.toFavorite(tempImageUrl).toFavoriteEntity(true));

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
  Future<Either<Failure, List<int>>> getPlaylist(
      {required String id, required String playlistType}) {
    // TODO: implement getPlaylist
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Track>> getTrackById({required String id}) async {
    try {
      final localResponse = await _favoriteDao.findTrackById(id);
      final response = await _service.getTrack(id);

      return Right(
        Track.fromSingleTrackDto(
          track: response,
          isFavorite: localResponse?.isFavorite ?? false,
        ),
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
