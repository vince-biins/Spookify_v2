part of 'player_cubit.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required bool isLoading,
    required bool isFavorite,
    required Track track,
    required String error,
  }) = _PlayerState;
  factory PlayerState.initialized() => const PlayerState(
        isFavorite: false,
        track: Track(
          trackId: '',
          albumId: '',
          artistName: '',
          trackNumber: 1,
          type: TrackType.favorite,
          imageUrl: '',
          trackName: '',
          isFavorite: false,
          durationMs: 0,
        ),
        isLoading: true,
        error: '',
      );
}
