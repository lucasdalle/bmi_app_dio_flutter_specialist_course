import 'package:bmi_app/config/colors/colors.dart';
import 'package:bmi_app/config/constants.dart';
import 'package:bmi_app/config/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppInputDecorationThemes {
  AppInputDecorationThemes._();

  static InputDecorationTheme lightTheme() {
    return InputDecorationTheme(
      floatingLabelBehavior: FloatingLabelBehavior.always,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      hintStyle: AppTextThemes.lightTheme().bodyMedium?.copyWith(color: Colors.grey),
      labelStyle: AppTextThemes.lightTheme().titleLarge?.copyWith(
        color: AppColors.lightPrimary,
        fontWeight: FontWeight.bold,
      ),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(kCardBorderRadius)),
    );
  }
}
