import 'package:flutter/material.dart';

class AppColors {
  static const Color lightPrimary = Color(0xFF712839);
  static const Color lightAccent = Colors.white;
  static final ColorScheme appColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.light,
    seedColor: AppColors.lightPrimary,
    dynamicSchemeVariant: DynamicSchemeVariant.fidelity,
  );
}
