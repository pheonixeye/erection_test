import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart'; // optional

/// AppTypography builds a TextTheme that's responsive and consistent.
/// It uses a simple scale factor based on screen width to adjust sizes.
class AppTypography {
  // Base font families (change as you like)
  // If you use google_fonts, uncomment and use the GoogleFonts.* calls below.
  static const String fallbackFontFamily =
      'Inter'; // ensure in pubspec if local
  static const String arabicFontFamily = 'Cairo';

  // Base sizes (these are "design" sizes on a ~390px width baseline)
  static const double _baseHeadline = 26;
  static const double _baseTitle = 20;
  static const double _baseBodyLarge = 16;
  static const double _baseBody = 15;
  static const double _baseCaption = 12;

  // Letter-spacing defaults
  static const double _tight = -0.2;
  static const double _normalSpacing = 0.0;
  static const double _loose = 0.2;

  // Weights
  static const FontWeight _w400 = FontWeight.w400;
  static const FontWeight _w500 = FontWeight.w500;
  static const FontWeight _w600 = FontWeight.w600;
  static const FontWeight _w700 = FontWeight.w700;

  /// Computes a responsive scale factor from device width.
  /// Baseline width is 390 (iPhone 13-like). Clamp for extremes.
  static double scaleFactor(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final factor = width / 390.0;
    return factor.clamp(0.85, 1.25);
  }

  /// Builds a TextTheme for the app. `isArabic` toggles Arabic-friendly font.
  static TextTheme buildTextTheme(
    BuildContext context, {
    bool isArabic = false,
  }) {
    final s = scaleFactor(context);

    // Option A: Use GoogleFonts to get high-quality fonts (uncomment if using google_fonts)
    TextStyle _font(
      double size,
      FontWeight weight, {
      double letterSpacing = _normalSpacing,
    }) {
      final scaledSize = (size * s);
      if (isArabic) {
        // Example: GoogleFonts.cairo for Arabic support
        return GoogleFonts.cairo(
          fontSize: scaledSize,
          fontWeight: weight,
          letterSpacing: letterSpacing,
        );
      } else {
        // Example: GoogleFonts.inter for a clean modern Latin font
        return GoogleFonts.inter(
          fontSize: scaledSize,
          fontWeight: weight,
          letterSpacing: letterSpacing,
        );
      }
    }

    // Option B: If you prefer local fonts (no google_fonts), replace _font with:
    // TextStyle _fontLocal(double size, FontWeight weight, {double letterSpacing = _normalSpacing}) {
    //   return TextStyle(
    //     fontFamily: fallbackFontFamily,
    //     fontSize: size * s,
    //     fontWeight: weight,
    //     letterSpacing: letterSpacing,
    //   );
    // }

    return TextTheme(
      // Big headings for question title
      headlineMedium: _font(_baseHeadline, _w700, letterSpacing: _tight),

      // Secondary titles
      titleLarge: _font(_baseTitle, _w600),

      // Primary body text
      bodyLarge: _font(_baseBodyLarge, _w400),

      // Smaller body / paragraph / option text
      bodyMedium: _font(_baseBody, _w400),

      // Option labels, footnotes
      labelSmall: _font(_baseCaption, _w500, letterSpacing: _loose),

      // Caption
      // caption: _font(_baseCaption, _w400),
    );
  }
}
