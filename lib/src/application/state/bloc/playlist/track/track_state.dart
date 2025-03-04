part of 'track_bloc.dart';

@freezed
class TrackState with _$TrackState {
  const factory TrackState.initial() = _InitialTrack;
  const factory TrackState.loading() = _LoadingTrack;
  const factory TrackState.loaded({
    required List<Track> tracks,
    required bool isDownloaded,
  }) = _LoadedTrack;
  const factory TrackState.error({required String message}) = _ErrorTrack;
}
