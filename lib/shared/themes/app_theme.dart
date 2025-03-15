import 'package:flutter/material.dart';

import 'app_typography.dart';

class AppTheme {
  static ThemeData get lightTheme {
    var themeData = ThemeData.light();
    return ThemeData(
      brightness: Brightness.light,
      textTheme: AppTypography.getTextTheme(themeData.textTheme),
    );
  }

  static ThemeData get darkTheme {
    var themeData = ThemeData.dark();

    return ThemeData(
      brightness: Brightness.dark,
      textTheme: AppTypography.getTextTheme(themeData.textTheme),
    );
  }
}
