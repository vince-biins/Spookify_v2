import 'package:flutter/material.dart';
import 'package:spookify_v2/core/theme/app_colors.dart';

class SpookifyTheme {
  // Dark Theme
  static final darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Rubik',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: AppColors.surface,
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: AppColors.onSurface,
      onError: AppColors.onError,
      brightness: Brightness.dark,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.onSurface,
      elevation: 0,
      surfaceTintColor: AppColors.background,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: elevatedButtonStyle(AppColors.primary, AppColors.onPrimary),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlinedButtonStyle(AppColors.secondary, AppColors.secondary),
    ),
    textButtonTheme: TextButtonThemeData(
      style: textButtonStyle(AppColors.primary),
    ),
  );

  // Light Theme
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Rubik',
    brightness: Brightness.light,
    scaffoldBackgroundColor: AppColors.secondary,
    colorScheme: const ColorScheme(
      primary: AppColors.primary,
      secondary: AppColors.secondary,
      surface: Color(0xFFF5F5F5),
      error: AppColors.error,
      onPrimary: AppColors.onPrimary,
      onSecondary: AppColors.onSecondary,
      onSurface: Colors.black87,
      onError: AppColors.onError,
      brightness: Brightness.light,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      foregroundColor: AppColors.onSurface,
      elevation: 0,
      surfaceTintColor: AppColors.background,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: elevatedButtonStyle(AppColors.primary, AppColors.onPrimary),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlinedButtonStyle(AppColors.primary, AppColors.primary),
    ),
    textButtonTheme: TextButtonThemeData(
      style: textButtonStyle(AppColors.primary),
    ),
  );

  static ButtonStyle elevatedButtonStyle(
    Color backgroundColor,
    Color textColor,
  ) {
    return ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: textColor,
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static ButtonStyle outlinedButtonStyle(Color borderColor, Color textColor) {
    return OutlinedButton.styleFrom(
      foregroundColor: textColor,
      side: BorderSide(color: borderColor),
      textStyle: const TextStyle(fontSize: 16),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
    );
  }

  static ButtonStyle textButtonStyle(Color textColor) {
    return TextButton.styleFrom(
      foregroundColor: textColor,
      textStyle: const TextStyle(fontSize: 16),
    );
  }
}
