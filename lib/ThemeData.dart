import 'package:flutter/material.dart';

class AppTheme{
  static ThemeData darkThemeData = ThemeData(
      colorScheme: const ColorScheme(
    brightness: Brightness.dark,
    background: Color(0xFFF6FFDE),
    primary: Color(0xFFE3F2C1),
    secondary: Color(0xFFC9DBB2),
    tertiary: Color(0xFFAAC8A7),
    error: Colors.red,
    onError: Colors.red,
    onBackground: Colors.black,
    surface: Color(0xFF393E46),
    onSurface: Colors.white,
    onPrimary: Colors.black54,
    onSecondary: Colors.black45,
  ));
}