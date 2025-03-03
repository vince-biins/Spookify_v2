import 'package:dartz/dartz.dart';

import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/album.dart';
import 'package:spookify_v2/domain/models/artist.dart';
import 'package:spookify_v2/domain/models/favorite.dart';
import 'package:spookify_v2/domain/models/save_category.dart';
import 'package:spookify_v2/domain/repositories/temp/dashboard_repository.dart';
import 'package:spookify_v2/infrastructure/data_source/local/dao/favorite_dao.dart';
import 'package:spookify_v2/infrastructure/data_source/local/dao/save_category_dao.dart';
import 'package:spookify_v2/infrastructure/data_source/local/entity/favorite_entity.dart';
import 'package:spookify_v2/infrastructure/data_source/mappers/dashboard_mapper.dart';
import 'package:spookify_v2/infrastructure/data_source/remote/service/dashboard_service.dart';
import 'package:spookify_v2/infrastructure/mixin/api_error_handler.dart';

import '../../domain/models/category.dart';

class DashboardRepositoryImpl
    with ApiErrorHandler
    implements DashboardRepository {
  final FavoriteDao _favoriteDao;
  final SavedCategoryDao _savedCategoryDao;
  final DashboardService _service;

  DashboardRepositoryImpl({
    required DashboardService service,
    required FavoriteDao favoriteDao,
    required SavedCategoryDao savedCategoryDao,
  })  : _service = service,
        _savedCategoryDao = savedCategoryDao,
        _favoriteDao = favoriteDao;

  @override
  Future<Either<Failure, List<Album>>> getAlbums(String ids) async {
    try {
      final response = await _service.getAlbums(ids);
      return Right(response.transform());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, List<Artist>>> getArtists(String ids) async {
    try {
      final response = await _service.getArtists(ids);

      return Right(response.transform());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, List<Category>>> getCategories({
    required int? limit,
  }) async {
    try {
      final response = await _service.getCategories(limit: limit);

      return Right(response.transform());
    } catch (e) {
      final error = handleApiError(e);
      return Left(error);
    }
  }

  @override
  Future<Either<Failure, List<Favorite>>> fetchFavorites() async {
    try {
      final res = await _favoriteDao.findAllTracks();

      return Right(res?.transform() ?? []);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> deleteFavorite(String trackId) async =>
      Left(Failure(message: 'Unimplmented method'));

  @override
  Future<Either<Failure, bool>> fetchFavoriteById({required String id}) async =>
      Left(Failure(message: 'Unimplmented method'));

  @override
  Future<Either<Failure, bool>> insertFavorite(FavoriteEntity favorite) async =>
      Left(Failure(message: 'Unimplmented method'));

  @override
  Future<Either<Failure, List<SaveCategory>>> getSaveCategories() async {
    try {
      final res = await _savedCategoryDao.getAllSavedCategories();

      return Right(res?.transform() ?? []);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
