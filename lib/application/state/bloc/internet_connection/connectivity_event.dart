part of 'connectivity_bloc.dart';

@freezed
class ConnectivityEvent with _$ConnectivityEvent {
  const factory ConnectivityEvent.changed(
          List<ConnectivityResult> result, bool hasInternetConnection) =
      ChangedConnectivity;
}
