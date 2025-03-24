import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:spookify_v2/src/application/resources/connectivity_status.dart';
import 'package:internet_connection_checker_plus/internet_connection_checker_plus.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';
part 'connectivity_bloc.freezed.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  final InternetConnection _internetConnection = InternetConnection();
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityBloc() : super(ConnectivityState.initial()) {
    on<ConnectivityEvent>((event, emit) async {
      if (event is ChangedConnectivity) {
        final hasConnectivity = await _connectivity.checkConnectivity();
        final hasInternetConnection =
            await _internetConnection.hasInternetAccess;
        emit(
          ConnectivityState(
            isLoading: false,
            status: !hasInternetConnection &&
                    hasConnectivity.contains(ConnectivityResult.none)
                ? ConnectivityStatus.disconnected
                : ConnectivityStatus.connected,
          ),
        );
      }
    });

    _subscription = _connectivity.onConnectivityChanged.listen((result) async {
      final hasInternetConnection = await _internetConnection.hasInternetAccess;
      add(ChangedConnectivity(result, hasInternetConnection));
    });

    _checkInitialConnection();
  }

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }

  Future<void> _checkInitialConnection() async {
    final result = await _connectivity.checkConnectivity();
    final hasConnection = await _internetConnection.hasInternetAccess;
    add(ChangedConnectivity(result, hasConnection));
  }
}
