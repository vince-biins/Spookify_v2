part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.loadDashboard() = LoadDashboard;
  const factory DashboardEvent.refreshedDashboard() = RefreshedDashboard;
  const factory DashboardEvent.navigateToTrackListPage(TrackParam track) =
      NavigateToTrackListPage;
  const factory DashboardEvent.navigateToPlayerPage(TrackIdProvider track) =
      NavigateToPlayerPage;
}
