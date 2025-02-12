part of 'connectivity_bloc.dart';

@freezed
class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState({
    required bool isLoading,
    required ConnectivityStatus status,
  }) = _ConnectivityState;
  factory ConnectivityState.initial() => const ConnectivityState(
      isLoading: true, status: ConnectivityStatus.connected);
}
