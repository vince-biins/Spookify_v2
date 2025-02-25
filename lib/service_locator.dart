import 'package:dio/dio.dart';
import 'package:floor/floor.dart';

import 'package:get_it/get_it.dart';
import 'package:spookify_v2/core/network/internet_connection/bloc/connectivity_bloc.dart';
import 'package:spookify_v2/core/network/internet_connection/di/connection_locator.dart';

import 'package:spookify_v2/core/secret/environment.dart';
import 'package:spookify_v2/database/data/local/dao/favorite_dao.dart';
import 'package:spookify_v2/database/di/database_locator.dart';

import 'package:spookify_v2/database/spookify_database.dart';
import 'package:spookify_v2/features/auth/di/auth_locator.dart';
import 'package:spookify_v2/features/auth/domain/auth_repository.dart';
import 'package:spookify_v2/features/auth/token_interceptor.dart';
import 'package:spookify_v2/features/dashboard/di/di.dart';

import 'package:spookify_v2/features/playlist/di/playlist_locator.dart';

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
