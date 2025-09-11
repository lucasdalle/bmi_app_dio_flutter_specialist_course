import 'package:flutter/material.dart';

class AppTextThemes {
  AppTextThemes._();

  static TextTheme lightTheme() {
    return const TextTheme(
      displayLarge: TextStyle(fontSize: 57.0, color: Colors.white, fontWeight: FontWeight.normal),
      displayMedium: TextStyle(fontSize: 45.0, color: Colors.white, fontWeight: FontWeight.normal),
      displaySmall: TextStyle(fontSize: 36.0, color: Colors.white, fontWeight: FontWeight.normal),

      headlineLarge: TextStyle(fontSize: 32.0, color: Colors.white, fontWeight: FontWeight.normal),
      headlineMedium: TextStyle(fontSize: 28.0, color: Colors.white, fontWeight: FontWeight.normal),
      headlineSmall: TextStyle(fontSize: 24.0, color: Colors.white, fontWeight: FontWeight.normal),

      titleLarge: TextStyle(fontSize: 22.0, color: Colors.white, fontWeight: FontWeight.w500),
      titleMedium: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w500),
      titleSmall: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.w500),

      bodyLarge: TextStyle(fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.normal),
      bodyMedium: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.normal),
      bodySmall: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.normal),

      labelLarge: TextStyle(fontSize: 14.0, color: Colors.white, fontWeight: FontWeight.normal),
      labelMedium: TextStyle(fontSize: 12.0, color: Colors.white, fontWeight: FontWeight.normal),
      labelSmall: TextStyle(fontSize: 11.0, color: Colors.white, fontWeight: FontWeight.normal),
    );
  }

  static TextTheme darkTheme = TextTheme();
}
