import 'package:flutter/material.dart';

class AppColors {
  // Private constructor to prevent instantiation
  AppColors._();

  // Define your custom colors as static constants
  static const Color primaryColor = Colors.teal;
  static const Color secondaryColor = Colors.white;
  static const Color accentColor = Color(0xFFFFA726);

  static const Color textPrimary = Color(0xFF212121);
  static const Color textSecondary = Color(0xFF757575);

  static const Color background = Color(0xFFF5F5F5);
  static const Color error = Color(0xFFD32F2F);

  // You can also define color variations
  static const Color primaryLight = Color(0xFF64B5F6);
  static const LinearGradient buttonGradient = LinearGradient(
    colors: [Color(0xFF00C9FF), Color(0xFF92FE9D)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static LinearGradient typeGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.transparent, Colors.black.withOpacity(0.7)],
  );
}
