import 'package:flutter/material.dart';
import 'app_typography.dart';

class AppTheme {
  static const green = Colors.green;
  static const double iconWeight = 500;

  static ThemeData get lightTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: green,
        brightness: Brightness.light,
      ),
      textTheme: AppTypography.getTextTheme(ThemeData.light().textTheme),
      iconTheme: const IconThemeData(
        weight: iconWeight,
      ),
    );
  }

  static ThemeData get darkTheme {
    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: green,
        brightness: Brightness.dark,
      ),
      textTheme: AppTypography.getTextTheme(ThemeData.dark().textTheme),
      iconTheme: const IconThemeData(
        weight: iconWeight,
      ),
    );
  }
}
