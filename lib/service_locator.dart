import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:spookify_v2/core/secret/secret.dart';
import 'package:spookify_v2/database/spookify_database.dart';
import 'package:spookify_v2/features/dashboard/di/di.dart';

import 'package:spookify_v2/features/playlist/di/playlist_locator.dart';

final getIt = GetIt.instance;
void initializeDependencies() async {
  _initializeDio();
  initializeDashboardLocator(getIt);
  final db = await _initializeDatabase();

  initializePlaylistLocator(getIt, db);
}

void _initializeDio() async {
  getIt.registerLazySingleton<Dio>(() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.spotify.com/',
        headers: {
          'Authorization': 'Bearer ${Confidential.token}',
        },
      ),
    );
  });
}

Future<SpookifyDatabase> _initializeDatabase() async {
  final database = await $FloorSpookifyDatabase
      .databaseBuilder('spookify_database.db')
      .build();
  getIt.registerLazySingleton<SpookifyDatabase>(
    () => database,
  );

  return database;
}
