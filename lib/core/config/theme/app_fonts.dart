import 'package:flutter/material.dart';

class AppFonts {
  static const String primaryFontFamily = 'Ubuntu';

  static const TextStyle displayLarge = TextStyle(
    fontSize: 32,
    fontWeight: FontWeight.bold,
    letterSpacing: -1.0,
    fontFamily: primaryFontFamily,
  );

  static const TextStyle titleLarge = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.2,
    fontFamily: primaryFontFamily,
  );

  static const TextStyle titleMedium = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    letterSpacing: 0.2,
    fontFamily: primaryFontFamily,
  );

  static const TextStyle bodyLarge = TextStyle(
    fontSize: 16,
    height: 1.5,
    letterSpacing: 0.15,
    fontFamily: primaryFontFamily,
  );

  static const TextStyle bodyMedium = TextStyle(
    fontSize: 14,
    height: 1.4,
    letterSpacing: 0.1,
    fontFamily: primaryFontFamily,
  );

  static const TextStyle bodySmall = TextStyle(
    fontSize: 12,
    height: 1.3,
    letterSpacing: 0.1,
    fontFamily: primaryFontFamily,
  );
}
