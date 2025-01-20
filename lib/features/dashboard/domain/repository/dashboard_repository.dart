import 'package:spookify_v2/core/network/failure.dart';
import 'package:dartz/dartz.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, List<String>>> getAlbums();
  Future<Either<Failure, List<String>>> getArtists();
}
