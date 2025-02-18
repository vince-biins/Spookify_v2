import 'dart:async';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/core/network/internet_connection/bloc/connectivity_bloc.dart';
import 'package:spookify_v2/core/network/internet_connection/connectivity_status.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/usecase.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';
part 'dashboard_bloc.freezed.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final ConnectivityBloc connectivityBloc;
  final List<Function> _failedRequests = [];

  final int _limit = 8;
  final FetchCategoryUsecase _fetchCategoryUsecase;
  final FetchArtistUsecase _fetchArtistUsecase;
  final FetchAlbumUsecase _fetchAlbumUsecase;

  DashboardBloc({
    required this.connectivityBloc,
    required FetchCategoryUsecase fetchCategoryUsecase,
    required FetchArtistUsecase fetchArtistUsecase,
    required FetchAlbumUsecase fetchAlbumUsecase,
  })  : _fetchCategoryUsecase = fetchCategoryUsecase,
        _fetchArtistUsecase = fetchArtistUsecase,
        _fetchAlbumUsecase = fetchAlbumUsecase,
        super(const DashboardState.initial()) {
    on<LoadDashboard>(_onLoadDashboard);

    connectivityBloc.stream.listen((state) {
      if (state.status == ConnectivityStatus.connected) {
        _retryFailedRequests();
      }
    });
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

    await Future.wait<void>([
      _fetchCategoryUsecase(limit: _limit).then((data) {
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
    ]);

    if (errorMessage.isNotEmpty) {
      emit(DashboardState.error(message: errorMessage.join()));
      _failedRequests.add(() => add(const LoadDashboard()));
    }

    if (!emit.isDone && errorMessage.isEmpty) {
      emit(
        DashboardState.loaded(
          categories: categories,
          artists: artists,
          albums: albums,
        ),
      );
    }
  }

  void _retryFailedRequests() {
    for (var request in _failedRequests) {
      request();
    }
    _failedRequests.clear();
  }
}
