import 'package:flutter/material.dart';
import 'package:spookify_v2/core/theme/spookify_theme.dart';
import 'package:spookify_v2/features/dashboard/presentation/ui/dashboard/dashboard_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: SpookifyTheme.lightTheme,
      darkTheme: SpookifyTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const DashboardPage(),
    );
  }
}
