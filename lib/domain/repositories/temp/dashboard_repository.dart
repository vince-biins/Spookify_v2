import 'package:dartz/dartz.dart';
import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/album.dart';
import 'package:spookify_v2/domain/models/artist.dart';
import 'package:spookify_v2/domain/models/category.dart';
import 'package:spookify_v2/domain/repositories/local_repository.dart';
import 'package:spookify_v2/domain/models/favorite.dart';
import 'package:spookify_v2/domain/models/save_category.dart';

abstract class DashboardRepository implements LocalRepository<Favorite> {
  Future<Either<Failure, List<Category>>> getCategories({required int? limit});
  Future<Either<Failure, List<Album>>> getAlbums(String ids);
  Future<Either<Failure, List<Artist>>> getArtists(String ids);
  Future<Either<Failure, List<SaveCategory>>> getSaveCategories();
}
