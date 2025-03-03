import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/domain/repositories/temp/playlist_repository.dart';
import 'package:spookify_v2/infrastructure/repository/playlist_repository_impl.dart';
import 'package:spookify_v2/infrastructure/data_source/local/dao/favorite_dao.dart';
import 'package:spookify_v2/infrastructure/data_source/local/dao/save_category_dao.dart';
import 'package:spookify_v2/infrastructure/data_source/local/dao/track_dao.dart';
import 'package:spookify_v2/application/state/cubit/player/player_cubit.dart';
import 'package:spookify_v2/application/state/bloc/playlist/provider/provider.dart';
import 'package:spookify_v2/application/state/bloc/playlist/track/track.dart';
import 'package:spookify_v2/infrastructure/data_source/remote/service/playlist_service.dart';

void initializePlaylistLocator(GetIt getIt) {
  getIt.registerLazySingleton<PlaylistService>(
    () => PlaylistService(getIt<Dio>(instanceName: 'apiDio')),
  );
  getIt.registerLazySingleton<PlaylistRepository>(
    () => PlaylistRepositoryImpl(
      service: getIt<PlaylistService>(),
      favoriteDao: getIt<FavoriteDao>(),
      saveCategoryDao: getIt<SavedCategoryDao>(),
      trackDao: getIt<TrackDao>(),
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
