import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:spookify_v2/core/network/internet_connection/bloc/connectivity_bloc.dart';
import 'package:spookify_v2/database/data/local/dao/favorite_dao.dart';
import 'package:spookify_v2/database/data/local/dao/save_category_dao.dart';
import 'package:spookify_v2/features/dashboard/data/repository/repository.dart';
import 'package:spookify_v2/features/dashboard/data/service/service.dart';
import 'package:spookify_v2/features/dashboard/domain/model/save_category.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/repository.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/fetch_favorites_usecase.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/usecase.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/dashboard/dashboard.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/library/library_bloc.dart';
import 'package:spookify_v2/features/dashboard/presentation/bloc/search/search_bloc.dart';

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
