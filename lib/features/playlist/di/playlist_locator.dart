import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/database/spookify_database.dart';
import 'package:spookify_v2/features/playlist/data/local/model/model.dart';
import 'package:spookify_v2/features/playlist/data/remote/remote.dart';
import 'package:spookify_v2/features/playlist/domain/repository/repository.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/provider/provider.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/track/track.dart';

void initializePlaylistLocator(GetIt getIt, SpookifyDatabase db) {
  getIt.registerLazySingleton<PlaylistService>(
    () => PlaylistService(getIt<Dio>(instanceName: 'apiDio')),
  );
  getIt.registerLazySingleton<PlaylistRepository>(
    () => PlaylistRepositoryImpl(
      service: getIt<PlaylistService>(),
      favoriteDao: getIt<FavoriteDao>(),
    ),
  );

  getIt.registerLazySingleton<FavoriteDao>(
    () => db.favoriteDao,
  );

  getIt.registerFactoryParam<TrackBloc, TrackBlocProvider, void>(
    (args, _) => TrackBloc(
      args: args,
      repository: getIt<PlaylistRepository>(),
    ),
  );
}
