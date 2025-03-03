import 'package:flutter/material.dart';
import 'package:spookify_v2/presentation/theme/app_colors.dart';

enum ElevatedButtonType {
  normal,
  appbar,
}

class SpookifyTheme {
  // Dark Theme
  static final darkTheme = ThemeData(
      useMaterial3: true,
      fontFamily: 'CircularSpotify',
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
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Colors.transparent,
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.onSurface,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: elevatedButtonStyle(
            backgroundColor: AppColors.primary, textColor: AppColors.onPrimary),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: outlinedButtonStyle(AppColors.secondary, AppColors.secondary),
      ),
      textButtonTheme: TextButtonThemeData(
        style: textButtonStyle(AppColors.primary),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.secondary,
        iconColor: AppColors.background,
        prefixIconColor: AppColors.background,
        suffixIconColor: AppColors.background,
        hintStyle: const TextStyle(color: AppColors.background),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.onSurface),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.onSurface),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(4),
          borderSide: const BorderSide(color: AppColors.background),
        ),
      ));

  // Light Theme
  static final lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'CircularSpotify',
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
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Colors.transparent,
      selectedItemColor: AppColors.primary,
      unselectedItemColor: Colors.black87,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: elevatedButtonStyle(
          backgroundColor: AppColors.primary, textColor: AppColors.onPrimary),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: outlinedButtonStyle(AppColors.primary, AppColors.primary),
    ),
    textButtonTheme: TextButtonThemeData(
      style: textButtonStyle(AppColors.primary),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.surface,
      hintStyle: TextStyle(color: Colors.black.withOpacity(0.6)),
      prefixIconColor: AppColors.background,
      suffixIconColor: AppColors.background,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black87),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: Colors.black87),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(4),
        borderSide: const BorderSide(color: AppColors.background),
      ),
    ),
  );

  static ButtonStyle elevatedButtonStyle({
    required Color backgroundColor,
    required Color textColor,
    double? borderRadius,
    ElevatedButtonType type = ElevatedButtonType.normal,
  }) {
    return switch (type) {
      ElevatedButtonType.normal => ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 8.9),
          ),
        ),
      ElevatedButtonType.appbar => ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: textColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 30.0),
          ),
          padding: const EdgeInsets.all(12.0),
        ),
    };
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
