part of 'launch_bloc.dart';

@freezed
class LaunchEvent with _$LaunchEvent {
  const factory LaunchEvent.tabChanged({required int index}) = _TabChanged;
}
