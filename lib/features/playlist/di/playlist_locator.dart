import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/features/playlist/data/repository/playlist_repository_impl.dart';
import 'package:spookify_v2/features/playlist/data/service/playlist_service.dart';
import 'package:spookify_v2/features/playlist/domain/repository/playlist_repository.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/provider/track_bloc_provider.dart';
import 'package:spookify_v2/features/playlist/presentation/bloc/track/track_bloc.dart';

void initializePlaylistLocator(GetIt getIt) {
  getIt.registerLazySingleton<PlaylistService>(
    () => PlaylistService(getIt<Dio>()),
  );
  getIt.registerLazySingleton<PlaylistRepository>(
    () => PlaylistRepositoryImpl(
      service: getIt<PlaylistService>(),
    ),
  );

  getIt.registerFactoryParam<TrackBloc, TrackBlocProvider, void>(
    (args, _) => TrackBloc(
      args: args,
      repository: getIt<PlaylistRepository>(),
    ),
  );
}
