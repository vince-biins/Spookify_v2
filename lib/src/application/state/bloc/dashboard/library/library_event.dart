part of 'library_bloc.dart';

@freezed
class LibraryEvent with _$LibraryEvent {
  const factory LibraryEvent.loadLibrary() = _LoadLibrary;
  const factory LibraryEvent.navigateToTrackListPage(TrackParam track) =
      NavigateToTrackListPage;
}
