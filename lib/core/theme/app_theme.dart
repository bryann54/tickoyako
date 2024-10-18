// Theme configuration
import 'package:flutter/material.dart';
import 'package:tickoyako/core/colors.dart';

class AppTheme {
  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.background,
    colorScheme: const ColorScheme.light(
      primary: AppColors.primaryColor,
      secondary: AppColors.secondaryColor,
      error: AppColors.error,
      surface: AppColors.surface,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimary),
      bodyMedium: TextStyle(color: AppColors.textSecondary),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.primaryColor,
      foregroundColor: AppColors.secondaryColor,
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      color: AppColors.surface,
      elevation: 2,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: AppColors.primaryColorDark,
    scaffoldBackgroundColor: AppColors.backgroundDark,
    colorScheme: const ColorScheme.dark(
      primary: AppColors.primaryColorDark,
      secondary: AppColors.secondaryColorDark,
      error: AppColors.errorDark,
      surface: AppColors.surfaceColorDark,
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: AppColors.textPrimaryDark),
      bodyMedium: TextStyle(color: AppColors.textSecondaryDark),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.surfaceColorDark,
      foregroundColor: AppColors.textPrimaryDark,
      elevation: 0,
    ),
    cardTheme: const CardTheme(
      color: AppColors.surfaceColorDark,
      elevation: 2,
    ),
  );
}
