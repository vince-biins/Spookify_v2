part of 'track_bloc.dart';

@freezed
class TrackEvent with _$TrackEvent {
  const factory TrackEvent.loadTrack() = LoadTrack;
  const factory TrackEvent.updateFavoriteTrack({
    required Track track,
    required String tempImageUrl,
    required bool isFavorite,
  }) = UpdateFavoriteTrack;
  const factory TrackEvent.saveAllTracks({
    required Category saveCategory,
    required List<Track> tracks,
  }) = SavedAllTracks;
}
