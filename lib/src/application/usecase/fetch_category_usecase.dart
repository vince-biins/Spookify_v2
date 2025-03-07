import 'package:dartz/dartz.dart';

import 'package:spookify_v2/src/domain/failure.dart';
import 'package:spookify_v2/src/domain/models/entity/category.dart';
import 'package:spookify_v2/src/domain/repositories/dashboard_repository.dart';

class FetchCategoryUsecase {
  final DashboardRepository repository;

  FetchCategoryUsecase({
    required this.repository,
  });

  Future<Either<Failure, List<Category>>> call({int? limit}) async =>
      await repository.getAllCategories(limit);
}
