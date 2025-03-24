import 'package:dartz/dartz.dart';
import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/entity/downloads.dart';
import 'package:spookify_v2/src/domain/models/models.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<Category>>> getAllCategories(int? limit);
  Future<Either<Failure, List<Artist>>> getAllArtists(String ids);
  Future<Either<Failure, List<Album>>> getAllAlbums(String ids);
  Future<Either<Failure, List<Favorite>>> getAllFavorites();
  Future<Either<Failure, List<Downloads>>> getAllDownloads();
}
