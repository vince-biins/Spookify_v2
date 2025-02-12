import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spookify_v2/core/network/internet_connection/bloc/connectivity_bloc.dart';
import 'package:spookify_v2/core/network/internet_connection/connectivity_status.dart';
import 'package:spookify_v2/core/theme/spookify_theme.dart';
import 'package:spookify_v2/router.dart';
import 'package:spookify_v2/service_locator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initializeDependencies();

  runApp(const MainApp());
  FlutterNativeSplash.remove();
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: SpookifyTheme.darkTheme,
      darkTheme: SpookifyTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: mainRouter,
    );
  }
}
// @override
// Widget build(BuildContext context) {
//   return MaterialApp.router(
//     debugShowCheckedModeBanner: false,
//     theme: SpookifyTheme.darkTheme,
//     darkTheme: SpookifyTheme.darkTheme,
//     themeMode: ThemeMode.system,
//     routerConfig: mainRouter,
//     builder: (context, child) {
//       return BlocListener<ConnectivityBloc, ConnectivityState>(
//         bloc: getIt<ConnectivityBloc>(),
//         listener: (context, state) {
//           if (state.status == ConnectivityStatus.disconnected) {
//             WidgetsBinding.instance.addPostFrameCallback((_) {
//               ScaffoldMessenger.of(context).showSnackBar(
//                 SnackBar(
//                   content: SizedBox(
//                     width: double.infinity,
//                     height: 20,
//                     child: const Align(
//                       alignment: Alignment.bottomCenter,
//                       child: Text('No internet Connection'),
//                     ),
//                   ),
//                   backgroundColor: Colors.red,
//                   duration: const Duration(days: 1),
//                   behavior: SnackBarBehavior.fixed,
//                 ),
//               );
//             });
//           } else {
//             ScaffoldMessenger.of(context).hideCurrentSnackBar();
//           }
//         },
//         child: child,
//       );
//     },
//   );
// }
