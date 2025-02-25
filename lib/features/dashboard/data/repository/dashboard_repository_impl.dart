import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/network.dart';
import 'package:spookify_v2/database/data/local/dao/favorite_dao.dart';
import 'package:spookify_v2/database/data/local/entity/favorite_entity.dart';
import 'package:spookify_v2/features/dashboard/data/mapper/mapper.dart';
import 'package:spookify_v2/features/dashboard/data/service/service.dart';
import 'package:spookify_v2/features/dashboard/domain/model/favorite.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/repository.dart';

class DashboardRepositoryImpl
    with ApiErrorHandler
    implements DashboardRepository {
  // final FavoriteDao _favoriteDao;
  final DashboardService _service;

  DashboardRepositoryImpl({
    required DashboardService service,
    // required FavoriteDao favoriteDao,
  }) : _service = service;
  // _favoriteDao = favoriteDao;

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
      //   final res = await _favoriteDao.findAllTracks();

      return Right([]);
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
}
