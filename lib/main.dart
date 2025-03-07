import 'package:flutter/material.dart';
import 'package:spookify_v2/src/presentation/theme/spookify_theme.dart';
import 'package:spookify_v2/src/presentation/routes/router.dart';
import 'package:spookify_v2/utils/injectors/service_locator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await initializeDependencies();

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
