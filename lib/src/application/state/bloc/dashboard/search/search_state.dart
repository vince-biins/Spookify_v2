part of 'search_bloc.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.loading() = _$SearchLoading;
  const factory SearchState.loaded({
    required List<Category> categories,
  }) = _$SearchLoaded;
  const factory SearchState.error({
    required String message,
  }) = _$SearchError;
}
