import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/core/network/internet_connection/bloc/connectivity_bloc.dart';
import 'package:spookify_v2/features/dashboard/data/repository/repository.dart';
import 'package:spookify_v2/features/dashboard/data/service/service.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/repository.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/usecase.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/dashboard/dashboard.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/search/search_bloc.dart';

void initializeDashboardLocator(GetIt getIt) {
  getIt.registerLazySingleton<DashboardService>(
    () => DashboardService(getIt<Dio>(instanceName: 'apiDio')),
  );
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      service: getIt<DashboardService>(),
    ),
  );

  getIt.registerLazySingleton(
    () => FetchCategoryUsecase(repository: getIt<DashboardRepository>()),
  );

  getIt.registerLazySingleton(
    () => FetchArtistUsecase(repository: getIt<DashboardRepository>()),
  );

  getIt.registerLazySingleton(
    () => FetchAlbumUsecase(repository: getIt<DashboardRepository>()),
  );

  getIt.registerFactory(
    () => DashboardBloc(
      connectivityBloc: getIt<ConnectivityBloc>(),
      fetchCategoryUsecase: getIt<FetchCategoryUsecase>(),
      fetchArtistUsecase: getIt<FetchArtistUsecase>(),
      fetchAlbumUsecase: getIt<FetchAlbumUsecase>(),
    ),
  );

  getIt.registerFactory(
    () => SearchBloc(
      fetchCategoryUsecase: getIt<FetchCategoryUsecase>(),
    ),
  );
}
