import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTypography {
  static TextTheme getTextTheme(TextTheme baseTextTheme) {
    var fontFamily = GoogleFonts.inter;
    var fontFamilyTheme = GoogleFonts.interTextTheme;

    return fontFamilyTheme(baseTextTheme).copyWith(
      headlineSmall: fontFamily(
        textStyle: baseTextTheme.headlineSmall,
        fontWeight: FontWeight.w600,
      ),
      headlineMedium: fontFamily(
        textStyle: baseTextTheme.headlineMedium,
        fontWeight: FontWeight.w600,
      ),
      headlineLarge: fontFamily(
        textStyle: baseTextTheme.headlineLarge,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}
