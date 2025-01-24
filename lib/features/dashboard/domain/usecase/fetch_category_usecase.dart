import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/failure.dart';
import 'package:spookify_v2/features/dashboard/domain/model/category.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/dashboard_repository.dart';

class FetchCategoryUsecase {
  final DashboardRepository repository;

  FetchCategoryUsecase({
    required this.repository,
  });

  Future<Either<Failure, List<Category>>> call() async =>
      await repository.getCategories();
}
