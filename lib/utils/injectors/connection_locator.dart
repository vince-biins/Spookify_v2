import 'package:get_it/get_it.dart';
import 'package:spookify_v2/src/application/state/bloc/internet_connection/connectivity_bloc.dart';

void initializedInternetConnectivity(GetIt getIt) {
  getIt.registerSingleton<ConnectivityBloc>(ConnectivityBloc());
}
