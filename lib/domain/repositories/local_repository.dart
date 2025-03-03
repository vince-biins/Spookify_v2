import 'package:dartz/dartz.dart';
import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/infrastructure/data_source/local/entity/favorite_entity.dart';

abstract class LocalRepository<T> {
  Future<Either<Failure, bool>> insertFavorite(FavoriteEntity favorite);
  Future<Either<Failure, bool>> deleteFavorite(String trackId);
  Future<Either<Failure, List<T>>> fetchFavorites();
  Future<Either<Failure, bool>> fetchFavoriteById({required String id});
}
