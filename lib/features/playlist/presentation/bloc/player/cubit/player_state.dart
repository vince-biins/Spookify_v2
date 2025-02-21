part of 'player_cubit.dart';

@freezed
class PlayerState with _$PlayerState {
  const factory PlayerState({
    required bool isLoading,
    required bool isPlaying,
    required Track track,
    required String error,
    required String prevId,
    required String currId,
    required String nextId,
    required bool hasNext,
  }) = _PlayerState;
  factory PlayerState.initialized() => const PlayerState(
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
        isPlaying: false,
        hasNext: true,
        prevId: '',
        currId: '',
        nextId: '',
        error: '',
      );
}
