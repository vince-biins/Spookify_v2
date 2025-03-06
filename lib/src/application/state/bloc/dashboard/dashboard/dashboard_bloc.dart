import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/src/application/paramaters/track_id_provider.dart';
import 'package:spookify_v2/src/application/paramaters/track_param.dart';
import 'package:spookify_v2/utils/mixin/state_connectivity_mixin.dart';
import 'package:spookify_v2/src/domain/models/album.dart';
import 'package:spookify_v2/src/domain/models/artist.dart';
import 'package:spookify_v2/src/domain/models/category.dart';
import 'package:spookify_v2/src/domain/models/favorite.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/src/application/usecase/fetch_favorites_usecase.dart';
import 'package:spookify_v2/src/application/usecase/usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState>
    with StateConnectivityMixin {
  StreamSubscription? _connectivitySubscription;

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
    on<NavigateToTrackListPage>(_onNavigateToTrackListPage);
    on<NavigateToPlayerPage>(_onNavigateToPlayerPage);

    _connectivitySubscription = listenForConnectionChange();
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
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
          favorites: favorites.reversed.toList(),
          event: event,
        ),
      );
    }
  }

  FutureOr<void> _onNavigateToTrackListPage(
    NavigateToTrackListPage event,
    Emitter<DashboardState> emit,
  ) {
    if (state is _DashboardLoaded) {
      final currentState = state as _DashboardLoaded;
      emit(currentState.copyWith(event: event));
    }
  }

  FutureOr<void> _onNavigateToPlayerPage(
    NavigateToPlayerPage event,
    Emitter<DashboardState> emit,
  ) {
    if (state is _DashboardLoaded) {
      final currentState = state as _DashboardLoaded;
      emit(currentState.copyWith(event: event));
    }
  }
}
