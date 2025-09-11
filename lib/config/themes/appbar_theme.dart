import 'package:bmi_app/config/colors/colors.dart';
import 'package:bmi_app/config/themes/text_theme.dart';
import 'package:flutter/material.dart';

class AppBarThemes {
  AppBarThemes._();

  static AppBarTheme lightTheme() {
    return AppBarTheme(backgroundColor: AppColors.lightPrimary, titleTextStyle: AppTextThemes.lightTheme().titleLarge);
  }
}
