import 'package:dartz/dartz.dart';

import 'package:spookify_v2/domain/failure.dart';
import 'package:spookify_v2/domain/models/category.dart';
import 'package:spookify_v2/domain/repositories/temp/dashboard_repository.dart';

class FetchCategoryUsecase {
  final DashboardRepository repository;

  FetchCategoryUsecase({
    required this.repository,
  });

  Future<Either<Failure, List<Category>>> call({int? limit}) async =>
      await repository.getCategories(limit: limit);
}
