import 'package:flutter/material.dart';
import 'package:spookify_v2/core/theme/spookify_theme.dart';
import 'package:spookify_v2/features/auth/domain/auth_repository.dart';
import 'package:spookify_v2/router.dart';
import 'package:spookify_v2/service_locator.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  initializeDependencies();
  await fetchAndStoreToken();
  runApp(const MainApp());
  FlutterNativeSplash.remove();
}

Future<void> fetchAndStoreToken() async {
  final tokenRepository = getIt<AuthRepository>();
  print('GET TOKEN');

  try {
    await tokenRepository.getToken();
    // Exit the loop if the token fetch is successful
  } catch (e) {
    // Handle the exception after max retries (e.g., log the error, show an error message, etc.)
    print('Error fetching token after retries: $e');
  }
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
