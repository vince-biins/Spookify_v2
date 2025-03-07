import 'package:dartz/dartz.dart';
import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/album.dart';
import 'package:spookify_v2/src/domain/models/artist.dart';
import 'package:spookify_v2/src/domain/models/category.dart';
import 'package:spookify_v2/src/domain/models/downloads.dart';
import 'package:spookify_v2/src/domain/models/favorite.dart';
import 'package:spookify_v2/src/domain/repositories/dashboard_repository.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/favorite_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/save_category_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/service/dashboard_service.dart';
import 'package:spookify_v2/utils/mixin/api_error_handler.dart';

class DashboardRepositoryImplV2
    with ApiErrorHandler
    implements DashboardRepository {
  final DashboardService _service;
  final SavedCategoryDao _downloadedDao;
  final FavoriteDao _favoriteDao;

  DashboardRepositoryImplV2({
    required SavedCategoryDao downloadedDao,
    required DashboardService service,
    required FavoriteDao favoriteDao,
  })  : _service = service,
        _downloadedDao = downloadedDao,
        _favoriteDao = favoriteDao;

  @override
  Future<Either<Failure, List<Album>>> getAllAlbums(String ids) async {
    try {
      final response = await _service.getAlbums(ids);

      return Right(
        response.albums.map((album) => album.toAlbumEntity()).toList(),
      );
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, List<Artist>>> getAllArtists(String ids) async {
    try {
      final response = await _service.getArtists(ids);

      return Right(
        response.artists.map((artist) => artist.toArtistEntity()).toList(),
      );
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getAllCategories(int? limit) async {
    try {
      final response = await _service.getCategories(limit: limit);

      return Right(
        response.categories.items
            .map((category) => category.toCategoryEntity())
            .toList(),
      );
    } catch (e) {
      return Left((handleApiError(e)));
    }
  }

  @override
  Future<Either<Failure, List<Downloads>>> getAllDownloads() async {
    try {
      final res = await _downloadedDao.getAllSavedCategories();

      return Right(
        res?.map((item) => item.toDownloadEntity()).toList() ?? [],
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<Favorite>>> getAllFavorites() async {
    try {
      final res = await _favoriteDao.findAllTracks();

      return Right(
        res?.map((favorite) => favorite.toFavoriteEntity()).toList() ?? [],
      );
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
