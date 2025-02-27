import 'dart:async';

import 'package:spookify_v2/core/network/internet_connection/bloc/connectivity_bloc.dart';
import 'package:spookify_v2/core/network/internet_connection/connectivity_status.dart';
import 'package:spookify_v2/service_locator.dart';

mixin StateConnectivityMixin {
  final ConnectivityBloc connectivityBloc = getIt<ConnectivityBloc>();
  final List<Function> _failedRequests = [];

  StreamSubscription listenForConnectionChange() {
    return connectivityBloc.stream.listen((state) {
      if (state.status == ConnectivityStatus.connected) {
        _retryFailedRequests();
      }
    });
  }

  void _retryFailedRequests() {
    for (var request in _failedRequests) {
      request();
    }
    _failedRequests.clear();
  }

  void addNewFailedRequest(Function failedRequest) {
    _failedRequests.add(failedRequest);
  }
}
