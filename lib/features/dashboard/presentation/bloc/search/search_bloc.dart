import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/features/dashboard/domain/model/model.dart';
import 'package:spookify_v2/features/dashboard/domain/usecase/usecase.dart';
part 'search_event.dart';
part 'search_state.dart';

part 'search_bloc.freezed.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final FetchCategoryUsecase _fetchCategoryUsecase;
  SearchBloc({
    required FetchCategoryUsecase fetchCategoryUsecase,
  })  : _fetchCategoryUsecase = fetchCategoryUsecase,
        super(const SearchState.loading()) {
    on<LoadedSearch>(_onLoadedSeach);
  }

  FutureOr<void> _onLoadedSeach(
    LoadedSearch event,
    Emitter<SearchState> emit,
  ) async {
    String errorMessage = '';

    List<Category> categories = [];
    final categoriesResult = await _fetchCategoryUsecase();

    categoriesResult.fold(
      (error) => errorMessage = error.message,
      (data) => categories = data,
    );

    emit(SearchState.loaded(categories: categories));

    if (errorMessage.isNotEmpty) {
      emit(SearchState.error(message: errorMessage));
    }
  }
}
