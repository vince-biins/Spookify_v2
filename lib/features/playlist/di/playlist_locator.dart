import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/database/data/local/dao/favorite_dao.dart';

import 'package:spookify_v2/features/playlist/data/remote/remote.dart';
import 'package:spookify_v2/features/playlist/domain/repository/repository.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/player/cubit/player_cubit.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/provider/provider.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/track/track.dart';

void initializePlaylistLocator(GetIt getIt) {
  getIt.registerLazySingleton<PlaylistService>(
    () => PlaylistService(getIt<Dio>(instanceName: 'apiDio')),
  );
  getIt.registerLazySingleton<PlaylistRepository>(
    () => PlaylistRepositoryImpl(
      service: getIt<PlaylistService>(),
      favoriteDao: getIt<FavoriteDao>(),
    ),
  );

  getIt.registerFactory(
    () => PlayerCubit(
      repository: getIt<PlaylistRepository>(),
    ),
  );
  getIt.registerFactoryParam<TrackBloc, TrackBlocProvider, void>(
    (args, _) => TrackBloc(
      args: args,
      repository: getIt<PlaylistRepository>(),
    ),
  );
}
