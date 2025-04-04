part of 'library_bloc.dart';

@freezed
sealed class LibraryState with _$LibraryState {
  const factory LibraryState({
    required bool isLoading,
    required String error,
    required List<Downloads> saveCategories,
    required LibraryEvent event,
  }) = _LibraryState;

  factory LibraryState.initialized() => const LibraryState(
        isLoading: true,
        error: '',
        saveCategories: [],
        event: _LoadLibrary(),
      );
}
