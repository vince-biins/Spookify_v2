import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/src/application/paramaters/track_bloc_provider.dart';
import 'package:spookify_v2/src/domain/repositories/playlist_repository.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/favorite_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/save_category_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/track_dao.dart';
import 'package:spookify_v2/src/application/state/cubit/player/player_cubit.dart';
import 'package:spookify_v2/src/application/state/bloc/playlist/track/track.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/service/playlist_service.dart';
import 'package:spookify_v2/src/infrastructure/repository/playlist_repository_impl_v2.dart';

void initializePlaylistLocator(GetIt getIt) {
  getIt.registerLazySingleton<PlaylistService>(
    () => PlaylistService(getIt<Dio>(instanceName: 'apiDio')),
  );
  getIt.registerLazySingleton<PlaylistRepository>(
    () => PlaylistRepositoryImplV2(
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
