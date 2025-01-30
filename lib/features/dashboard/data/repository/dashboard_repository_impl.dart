import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/network.dart';
import 'package:spookify_v2/features/dashboard/data/mapper/mapper.dart';
import 'package:spookify_v2/features/dashboard/data/service/service.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/repository.dart';

class DashboardRepositoryImpl
    with ApiErrorHandler
    implements DashboardRepository {
  final DashboardService _service;

  DashboardRepositoryImpl({required DashboardService service})
      : _service = service;

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
  Future<Either<Failure, List<Category>>> getCategories() async {
    try {
      final response = await _service.getCategories();

      return Right(response.transform());
    } catch (e) {
      final error = handleApiError(e);
      return Left(error);
    }
  }
}
