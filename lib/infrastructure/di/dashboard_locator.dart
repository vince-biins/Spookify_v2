import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/domain/repositories/temp/dashboard_repository.dart';
import 'package:spookify_v2/infrastructure/data_source/local/dao/favorite_dao.dart';
import 'package:spookify_v2/infrastructure/data_source/local/dao/save_category_dao.dart';
import 'package:spookify_v2/application/usecase/fetch_favorites_usecase.dart';
import 'package:spookify_v2/application/usecase/usecase.dart';
import 'package:spookify_v2/application/state/bloc/dashboard/dashboard/dashboard.dart';
import 'package:spookify_v2/application/state/bloc/dashboard/launch/launch_bloc.dart';
import 'package:spookify_v2/application/state/bloc/dashboard/library/library_bloc.dart';
import 'package:spookify_v2/application/state/bloc/dashboard/search/search_bloc.dart';
import 'package:spookify_v2/infrastructure/data_source/remote/service/dashboard_service.dart';
import 'package:spookify_v2/infrastructure/repository/dashboard_repository_impl.dart';

void initializeDashboardLocator(GetIt getIt) {
  getIt.registerLazySingleton<DashboardService>(
    () => DashboardService(getIt<Dio>(instanceName: 'apiDio')),
  );
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImpl(
      service: getIt<DashboardService>(),
      favoriteDao: getIt<FavoriteDao>(),
      savedCategoryDao: getIt<SavedCategoryDao>(),
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

  getIt.registerLazySingleton(
    () => FetchFavoritesUsecase(repository: getIt<DashboardRepository>()),
  );

  getIt.registerFactory(
    () => LaunchBloc(),
  );

  getIt.registerFactory(
    () => DashboardBloc(
      fetchCategoryUsecase: getIt<FetchCategoryUsecase>(),
      fetchArtistUsecase: getIt<FetchArtistUsecase>(),
      fetchAlbumUsecase: getIt<FetchAlbumUsecase>(),
      fetchFavoriteUsecase: getIt<FetchFavoritesUsecase>(),
    ),
  );

  getIt.registerFactory(
    () => LibraryBloc(
      repository: getIt<DashboardRepository>(),
    ),
  );
  getIt.registerFactory(
    () => SearchBloc(
      fetchCategoryUsecase: getIt<FetchCategoryUsecase>(),
    ),
  );
}
