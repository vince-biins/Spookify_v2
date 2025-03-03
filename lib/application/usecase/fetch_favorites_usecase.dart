import 'package:dartz/dartz.dart';
import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/favorite.dart';
import 'package:spookify_v2/domain/repositories/temp/dashboard_repository.dart';

class FetchFavoritesUsecase {
  final DashboardRepository repository;

  FetchFavoritesUsecase({
    required this.repository,
  });

  Future<Either<Failure, List<Favorite>>> call({int? limit}) async =>
      await repository.fetchFavorites();
}
