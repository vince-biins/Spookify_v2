import 'package:get_it/get_it.dart';
import 'package:spookify_v2/core/network/internet_connection/bloc/connectivity_bloc.dart';

void initializedInternetConnectivity(GetIt getIt) {
  getIt.registerSingleton<ConnectivityBloc>(ConnectivityBloc());
}
