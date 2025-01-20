import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';
import 'package:spookify_v2/core/network/mixin/api_error_handler.dart';
import 'package:spookify_v2/features/dashboard/data/service/dashboard_service.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/dashboard_repository.dart';

class DashboardRepositoryImpl
    with ApiErrorHandler
    implements DashboardRepository {
  final DashboardService _service;

  DashboardRepositoryImpl({required DashboardService service})
      : _service = service;

  @override
  Future<Either<Failure, List<String>>> getAlbums() async {
    try {
      return Right(await _service.getAlbums());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getArtists() async {
    try {
      return Right(await _service.getArtists());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }

  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      return Right(await _service.getCategories());
    } catch (e) {
      return Left(handleApiError(e));
    }
  }
}
