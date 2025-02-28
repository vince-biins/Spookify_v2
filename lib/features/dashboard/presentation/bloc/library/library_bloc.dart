import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/core/network/mixin/state_connectivity_mixin.dart';
import 'package:spookify_v2/features/dashboard/domain/model/save_category.dart';
import 'package:spookify_v2/features/dashboard/domain/repository/repository.dart';

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
  }

  FutureOr<void> _onLoadLibrary(
    _LoadLibrary event,
    Emitter<LibraryState> emit,
  ) async {
    final result = await _repository.getSaveCategories();
    String errorMessage = '';
    List<SaveCategory> savedcategories = [];
    result.fold(
      (error) => errorMessage = error.message,
      (data) => savedcategories = data,
    );

    if (errorMessage.isNotEmpty) {
      emit(state.copyWith(error: errorMessage));
    }

    emit(state.copyWith(saveCategories: savedcategories, isLoading: false));
  }
}
