import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/core/network/mixin/state_connectivity_mixin.dart';
import 'package:spookify_v2/features/dashboard/domain/model/favorite.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/fetch_favorites_usecase.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>
    with StateConnectivityMixin {
  final int _limit = 8;
  final FetchCategoryUsecase _fetchCategoryUsecase;
  final FetchArtistUsecase _fetchArtistUsecase;
  final FetchAlbumUsecase _fetchAlbumUsecase;
  final FetchFavoritesUsecase _fetchFavoriteUsecase;

  DashboardBloc({
    required FetchCategoryUsecase fetchCategoryUsecase,
    required FetchArtistUsecase fetchArtistUsecase,
    required FetchAlbumUsecase fetchAlbumUsecase,
    required FetchFavoritesUsecase fetchFavoriteUsecase,
  })  : _fetchCategoryUsecase = fetchCategoryUsecase,
        _fetchArtistUsecase = fetchArtistUsecase,
        _fetchAlbumUsecase = fetchAlbumUsecase,
        _fetchFavoriteUsecase = fetchFavoriteUsecase,
        super(const DashboardState.initial()) {
    on<LoadDashboard>(_onLoadDashboard);

    listenForConnectionChange();
  }

  FutureOr<void> _onLoadDashboard(
    LoadDashboard event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    List<String> errorMessage = [];
    List<Category> categories = [];
    List<Artist> artists = [];
    List<Album> albums = [];
    List<Favorite> favorites = [];

    await Future.wait<void>([
      _fetchCategoryUsecase().then((data) {
        data.fold(
          (err) => errorMessage.add(err.message),
          (data) => categories = data,
        );
      }),
      _fetchArtistUsecase().then((data) {
        data.fold(
          (err) => errorMessage.add(err.message),
          (data) => artists = data,
        );
      }),
      _fetchAlbumUsecase().then((data) {
        data.fold(
          (err) => errorMessage.add(err.message),
          (data) => albums = data,
        );
      }),
      _fetchFavoriteUsecase().then((data) {
        data.fold(
          (err) => errorMessage.add(err.message),
          (data) => favorites = data,
        );
      }),
    ]);

    if (errorMessage.isNotEmpty) {
      emit(DashboardState.error(message: errorMessage.join()));
      addNewFailedRequest(() => add(const LoadDashboard()));
      // _failedRequests.add(() => add(const LoadDashboard()));
    }

    if (!emit.isDone && errorMessage.isEmpty) {
      emit(
        DashboardState.loaded(
          categories: categories,
          artists: artists,
          albums: albums,
          favorites: favorites,
        ),
      );
    }
  }
}
