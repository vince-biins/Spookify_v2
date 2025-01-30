part of 'track_bloc.dart';

@freezed
class TrackEvent with _$TrackEvent {
  const factory TrackEvent.loadTrack() = LoadTrack;
  const factory TrackEvent.updateFavoriteTrack(
      {required Track track, required bool isFavorite}) = UpdateFavoriteTrack;
}
