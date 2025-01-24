part of 'dashboard_bloc.dart';

@freezed
class DashboardState with _$DashboardState {
  const factory DashboardState.initial() = _DashboardInitial;
  const factory DashboardState.loading() = _DashboardLoading;
  const factory DashboardState.loaded({
    required List<Category> categories,
    required List<Artist> artists,
    required List<Album> albums,
  }) = _DashboardLoaded;
  const factory DashboardState.error({
    required String message,
  }) = _DashboardError;
}
