import 'package:flutter/material.dart';
import 'package:spookify_v2/core/theme/spookify_theme.dart';
import 'package:spookify_v2/router.dart';
import 'package:spookify_v2/service_locator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: SpookifyTheme.lightTheme,
      darkTheme: SpookifyTheme.darkTheme,
      themeMode: ThemeMode.system,
      routerConfig: mainRouter,
    );
  }
}
