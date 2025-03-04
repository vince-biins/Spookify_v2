import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:spookify_v2/utils/injectors/connection_locator.dart';
import 'package:spookify_v2/src/application/config/environment.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/database_locator.dart';
import 'package:spookify_v2/utils/injectors/auth_locator.dart';
import 'package:spookify_v2/src/domain/repositories/auth_repository.dart';
import 'package:spookify_v2/utils/injectors/dashboard_locator.dart';
import 'package:spookify_v2/src/application/config/token_interceptor.dart';

import 'package:spookify_v2/utils/injectors/playlist_locator.dart';

final getIt = GetIt.instance;
Future<void> initializeDependencies() async {
  initializedInternetConnectivity(getIt);
  initializeAuthLocator(getIt);
  _initializeDio();
  await initializeDatabaseLocator(getIt);
  initializeDashboardLocator(getIt);
  initializePlaylistLocator(getIt);
}

void _initializeDio() async {
  getIt.registerLazySingleton<Dio>(instanceName: 'apiDio', () {
    return Dio(
      BaseOptions(
        baseUrl: Environment.baseUrl,
      ),
    )..interceptors.add(TokenInterceptor(getIt<AuthRepository>()));
  });
}
