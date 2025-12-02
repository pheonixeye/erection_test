import 'package:erection_test/core/utils/app_typography.dart';
import 'package:flutter/material.dart';

class AppTheme {
  // ---------- COLORS ----------
  static const Color primary = Color(0xFF4A90E2); // Modern blue
  static const Color secondary = Color(0xFF50E3C2); // Mint green
  static const Color backgroundLight = Color(0xFFF6F7FB);
  static const Color backgroundDark = Color(0xFF0F1115);

  static const Color surfaceLight = Colors.white;
  static const Color surfaceDark = Color(0xFF1A1C20);

  static const seedColor = Color(0xFF4A90E2);

  static const Color backgroundSoft = Color(0xFFECEFF4);
  static const Color surfaceSoft = Color(0xFFF5F7FA);
  static const Color shadowLight = Color(0xFFFFFFFF);
  static const Color shadowDark = Color(0xFFC8CCD5);

  // ---- LIGHT THEME (NEUMORPHIC) ----
  static ThemeData lightTheme(BuildContext context, bool isArabic) {
    final textTheme = AppTypography.buildTextTheme(context, isArabic: isArabic);
    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.light,
      ),

      textTheme: textTheme,

      scaffoldBackgroundColor: Colors.grey.shade100,

      cardTheme: CardThemeData(
        color: surfaceSoft,
        elevation: 0,
        margin: const EdgeInsets.all(0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        shadowColor: Colors.transparent,
      ),

      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: backgroundSoft,
        foregroundColor: Color(0xFF2E3440),
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          surfaceTintColor: Colors.transparent,
          backgroundColor: surfaceSoft,
          foregroundColor: Color(0xFF2E3440),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
          textStyle: textTheme.bodyLarge,
        ),
      ),

      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
    );
  }

  // ---- DARK MODE UNCHANGED ----
  static ThemeData darkTheme(BuildContext context, bool isArabic) {
    final textTheme = AppTypography.buildTextTheme(context, isArabic: isArabic);

    return ThemeData(
      useMaterial3: true,
      textTheme: textTheme,
      colorScheme: ColorScheme.fromSeed(
        seedColor: seedColor,
        brightness: Brightness.dark,
      ),
      // scaffoldBackgroundColor: const Color(0xFF0F1115),
      scaffoldBackgroundColor: Colors.grey.shade800,

      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: backgroundDark,
        foregroundColor: Colors.white,
        centerTitle: false,
        titleTextStyle: textTheme.titleLarge,
      ),

      cardTheme: CardThemeData(
        color: surfaceDark,
        elevation: 2,
        shadowColor: Colors.black.withValues(alpha: 0.25),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),

      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          textStyle: textTheme.bodyLarge,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
        ),
      ),

      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceDark,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 14,
          horizontal: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),

      iconTheme: IconThemeData(
        color: Colors.grey,
      ),
    );
  }
}
