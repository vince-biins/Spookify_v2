import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/src/application/paramaters/track_param.dart';
import 'package:spookify_v2/utils/mixin/state_connectivity_mixin.dart';
import 'package:spookify_v2/src/domain/models/downloads.dart';
import 'package:spookify_v2/src/domain/repositories/dashboard_repository.dart';
part 'library_event.dart';
part 'library_state.dart';
part 'library_bloc.freezed.dart';

class LibraryBloc extends Bloc<LibraryEvent, LibraryState>
    with StateConnectivityMixin {
  final DashboardRepository _repository;

  LibraryBloc({required DashboardRepository repository})
      : _repository = repository,
        super(LibraryState.initialized()) {
    on<_LoadLibrary>(_onLoadLibrary);
    on<NavigateToTrackListPage>(_onNavigateToTrackListPage);
  }

  FutureOr<void> _onLoadLibrary(
    _LoadLibrary event,
    Emitter<LibraryState> emit,
  ) async {
    final result = await _repository.getAllDownloads();
    String errorMessage = '';
    List<Downloads> savedcategories = [];
    result.fold(
      (error) => errorMessage = error.message,
      (data) => savedcategories = data,
    );

    if (errorMessage.isNotEmpty) {
      emit(state.copyWith(error: errorMessage));
    }

    emit(
      state.copyWith(
        saveCategories: savedcategories,
        isLoading: false,
        event: event,
      ),
    );
  }

  FutureOr<void> _onNavigateToTrackListPage(
    NavigateToTrackListPage event,
    Emitter<LibraryState> emit,
  ) {
    emit(state.copyWith(event: event));
  }
}
