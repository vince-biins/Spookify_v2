import 'package:dio/dio.dart';
import 'package:floor/floor.dart';

import 'package:get_it/get_it.dart';
import 'package:spookify_v2/core/network/internet_connection/bloc/connectivity_bloc.dart';

import 'package:spookify_v2/core/secret/environment.dart';

import 'package:spookify_v2/database/spookify_database.dart';
import 'package:spookify_v2/features/auth/di/auth_locator.dart';
import 'package:spookify_v2/features/auth/domain/auth_repository.dart';
import 'package:spookify_v2/features/auth/token_interceptor.dart';
import 'package:spookify_v2/features/dashboard/di/di.dart';

import 'package:spookify_v2/features/playlist/di/playlist_locator.dart';

final getIt = GetIt.instance;
void initializeDependencies() async {
  getIt.registerSingleton<ConnectivityBloc>(ConnectivityBloc());
  initializeAuthLocator(getIt);
  _initializeDio();
  initializeDashboardLocator(getIt);
  final db = await _initializeDatabase();

  initializePlaylistLocator(getIt, db);
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

Future<SpookifyDatabase> _initializeDatabase() async {
  final migration1to2 = Migration(1, 2, (database) async {
    await database
        .execute('ALTER TABLE FavoriteEntity ADD COLUMN imageUrl TEXT');
  });
  final database = await $FloorSpookifyDatabase
      .databaseBuilder('spookify_database.db')
      .addMigrations([migration1to2]).build();
  getIt.registerLazySingleton<SpookifyDatabase>(
    () => database,
  );

  return database;
}
