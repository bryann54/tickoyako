import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const Color primaryColor = Colors.teal;
  static const Color secondaryColor = Colors.white;
  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);
  static const Color background = Color(0xFFF5F5F5);
  static const Color error = Color(0xFFD32F2F);
  static const Color surface = Colors.white;

  // Dark Theme Colors
  static const Color primaryColorDark = Color(0xFF009688);
  static const Color secondaryColorDark = Color(0xFF80CBC4);
  static const Color backgroundDark = Color(0xFF121212);
  static const Color surfaceColorDark = Color(0xFF1E1E1E);
  static const Color textPrimaryDark = Color(0xFFE0E0E0);
  static const Color textSecondaryDark = Color(0xFFB0B0B0);
  static const Color errorDark = Color(0xFFCF6679);

  // Light Theme Gradients
  static const LinearGradient lightButtonGradient = LinearGradient(
    colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Dark Theme Gradients
  static const LinearGradient darkButtonGradient = LinearGradient(
    colors: [Color(0xFF00838F), Color(0xFF4DB6AC)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Type Gradients for Image Overlay
  static const LinearGradient typeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black54,
    ],
  );

  static const LinearGradient darkTypeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.transparent,
      Colors.black87,
    ],
  );

  // Optional overlay colors for elevation simulation
  static const Color overlay4dp = Color(0x0AFFFFFF);
  static const Color overlay8dp = Color(0x0FFFFFFF);
}


