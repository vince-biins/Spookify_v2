import 'package:dartz/dartz.dart';
import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/entity/favorite.dart';
import 'package:spookify_v2/src/domain/repositories/dashboard_repository.dart';

class FetchFavoritesUsecase {
  final DashboardRepository repository;

  FetchFavoritesUsecase({
    required this.repository,
  });

  Future<Either<Failure, List<Favorite>>> call({int? limit}) async =>
      await repository.getAllFavorites();
}
