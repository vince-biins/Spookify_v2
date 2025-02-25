import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';
import 'package:spookify_v2/features/dashboard/domain/model/favorite.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/dashboard_repository.dart';

class FetchFavoritesUsecase {
  final DashboardRepository repository;

  FetchFavoritesUsecase({
    required this.repository,
  });

  Future<Either<Failure, List<Favorite>>> call({int? limit}) async =>
      await repository.fetchFavorites();
}
