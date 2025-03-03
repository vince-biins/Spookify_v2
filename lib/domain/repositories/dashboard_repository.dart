import 'package:dartz/dartz.dart';
import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/models.dart';

abstract class DashboardRepository {
  Future<Either<Failure, List<Category>>> getAllCategories();
  Future<Either<Failure, List<Artist>>> getAllArtists();
  Future<Either<Failure, List<Album>>> getAllAlbums();
  Future<Either<Failure, List<Favorite>>> getAllFavorites();
  Future<Either<Failure, List<Category>>> getAllDownloads();
}
