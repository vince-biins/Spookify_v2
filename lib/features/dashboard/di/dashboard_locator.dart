import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/features/dashboard/data/assets/repository/dashboard_repository_impl.dart';
import 'package:spookify_v2/features/dashboard/data/service/dashboard_service.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/dashboard_repository.dart';

void initializeDashboardLocator(GetIt getIt) {
  getIt.registerLazySingleton<DashboardService>(
    () => DashboardService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      service: getIt<DashboardService>(),
    ),
  );
}
