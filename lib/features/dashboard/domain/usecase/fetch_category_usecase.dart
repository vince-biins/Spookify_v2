import 'package:dartz/dartz.dart';
import 'package:spookify_v2/core/network/network.dart';
import 'package:spookify_v2/features/dashboard/domain/model/category.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/repository.dart';

class FetchCategoryUsecase {
  final DashboardRepository repository;

  FetchCategoryUsecase({
    required this.repository,
  });

  Future<Either<Failure, List<Category>>> call({int? limit}) async =>
      await repository.getCategories(limit: limit);
}
