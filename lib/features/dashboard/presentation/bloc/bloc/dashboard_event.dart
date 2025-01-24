part of 'dashboard_bloc.dart';

@freezed
class DashboardEvent with _$DashboardEvent {
  const factory DashboardEvent.loadDashboard() = LoadDashboard;
  const factory DashboardEvent.refreshedDashboard() = RefreshedDashboard;
}
