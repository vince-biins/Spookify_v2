import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/core/secret/confidential.dart';
import 'package:spookify_v2/features/dashboard/di/dashboard_locator.dart';

final getIt = GetIt.instance;
void initializeDependencies() {
  _initializeDio();
  initializeDashboardLocator(getIt);
}

void _initializeDio() {
  getIt.registerLazySingleton<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: Confidential.baseUrl,
        headers: {
          'Authorization': 'Bearer ${Confidential.token}',
        },
      ),
    );
  });
}
