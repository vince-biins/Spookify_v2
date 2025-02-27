import 'package:get_it/get_it.dart';
import 'package:spookify_v2/database/data/local/dao/favorite_dao.dart';
import 'package:spookify_v2/database/data/local/dao/save_category_dao.dart';
import 'package:spookify_v2/database/data/local/dao/track_dao.dart';
import 'package:spookify_v2/database/spookify_database.dart';

Future<SpookifyDatabase> initializeDatabaseLocator(
  GetIt getIt,
) async {
  final database = await SpookifyDatabaseFactory().getDatabase();
  getIt.registerSingletonAsync<SpookifyDatabase>(() async {
    return database;
  });

  getIt.registerLazySingleton<FavoriteDao>(
    () => database.favoriteDao,
  );

  getIt.registerLazySingleton<SavedCategoryDao>(
    () => database.savedCategoryDao,
  );

  getIt.registerLazySingleton<TrackDao>(
    () => database.trackDao,
  );

  return database;
}
