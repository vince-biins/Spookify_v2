import 'package:spookify_v2/core/network/network.dart';
import 'package:dartz/dartz.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<Category>>> getCategories();
  Future<Either<Failure, List<Album>>> getAlbums(String ids);
  Future<Either<Failure, List<Artist>>> getArtists(String ids);
}
