import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final int _limit = 8;
  final FetchCategoryUsecase _fetchCategoryUsecase;
  final FetchArtistUsecase _fetchArtistUsecase;
  final FetchAlbumUsecase _fetchAlbumUsecase;

  DashboardBloc({
    required FetchCategoryUsecase fetchCategoryUsecase,
    required FetchArtistUsecase fetchArtistUsecase,
    required FetchAlbumUsecase fetchAlbumUsecase,
  })  : _fetchCategoryUsecase = fetchCategoryUsecase,
        _fetchArtistUsecase = fetchArtistUsecase,
        _fetchAlbumUsecase = fetchAlbumUsecase,
        super(const DashboardState.initial()) {
    on<LoadDashboard>(_onLoadDashboard);
  }

  FutureOr<void> _onLoadDashboard(
    LoadDashboard event,
    Emitter<DashboardState> emit,
  ) async {
    emit(const DashboardState.loading());
    List<String> errorMessage = [];

    List<Category> categories = [];
    final categoriesResult = await _fetchCategoryUsecase(limit: _limit);
    print(categories);

    categoriesResult.fold(
      (error) => errorMessage.add(error.message),
      (data) => categories = data,
    );

    List<Artist> artists = [];
    final artistsResult = await _fetchArtistUsecase();

    artistsResult.fold(
      (error) => errorMessage.add(error.message),
      (data) => artists = data,
    );
    print(artists);
    List<Album> albums = [];
    final albumsResult = await _fetchAlbumUsecase();

    albumsResult.fold(
      (error) => errorMessage.add(error.message),
      (data) => albums = data,
    );
    print(albums);

    emit(
      DashboardState.loaded(
        categories: categories,
        artists: artists,
        albums: albums,
      ),
    );
  }
}
