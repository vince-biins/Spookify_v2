import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/src/domain/repositories/dashboard_repository.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/favorite_dao.dart';
import 'package:spookify_v2/src/infrastructure/data_source/local/dao/save_category_dao.dart';
import 'package:spookify_v2/src/application/usecase/fetch_favorites_usecase.dart';
import 'package:spookify_v2/src/application/usecase/usecase.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/dashboard/dashboard.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/launch/launch_bloc.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/library/library_bloc.dart';
import 'package:spookify_v2/src/application/state/bloc/dashboard/search/search_bloc.dart';
import 'package:spookify_v2/src/infrastructure/data_source/remote/service/dashboard_service.dart';
import 'package:spookify_v2/src/infrastructure/repository/dashboard_repository_impl_v2.dart';

void initializeDashboardLocator(GetIt getIt) {
  getIt.registerLazySingleton<DashboardService>(
    () => DashboardService(getIt<Dio>(instanceName: 'apiDio')),
  );
  getIt.registerLazySingleton<DashboardRepository>(
    () => DashboardRepositoryImplV2(
      service: getIt<DashboardService>(),
      favoriteDao: getIt<FavoriteDao>(),
      downloadedDao: getIt<SavedCategoryDao>(),
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
