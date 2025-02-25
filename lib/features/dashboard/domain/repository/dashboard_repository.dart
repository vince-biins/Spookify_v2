import 'package:spookify_v2/core/network/network.dart';
import 'package:dartz/dartz.dart';
import 'package:spookify_v2/database/domain/repository/local_repository.dart';
import 'package:spookify_v2/features/dashboard/domain/model/favorite.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';

abstract class DashboardRepository implements LocalRepository<Favorite> {
  Future<Either<Failure, List<Category>>> getCategories({required int? limit});
  Future<Either<Failure, List<Album>>> getAlbums(String ids);
  Future<Either<Failure, List<Artist>>> getArtists(String ids);
}
