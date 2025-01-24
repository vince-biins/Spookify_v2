import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/features/dashboard/data/repository/dashboard_repository_impl.dart';
import 'package:spookify_v2/features/dashboard/data/service/dashboard_service.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/dashboard_repository.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/fetch_album_usecase.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/fetch_artist_usecase.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/fetch_category_usecase.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/bloc/dashboard_bloc.dart';

void initializeDashboardLocator(GetIt getIt) {
  getIt.registerLazySingleton<DashboardService>(
    () => DashboardService(getIt<Dio>()),
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
      fetchCategoryUsecase: getIt<FetchCategoryUsecase>(),
      fetchArtistUsecase: getIt<FetchArtistUsecase>(),
      fetchAlbumUsecase: getIt<FetchAlbumUsecase>(),
    ),
  );
}
