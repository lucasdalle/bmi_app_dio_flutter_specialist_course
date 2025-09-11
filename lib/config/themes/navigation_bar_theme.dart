import 'package:bmi_app/config/themes/text_theme.dart';
import 'package:flutter/material.dart';

import '../colors/colors.dart';

class AppNavigationBarTheme {
  AppNavigationBarTheme._();

  static NavigationBarThemeData lightTheme() {
    return NavigationBarThemeData(
      backgroundColor: AppColors.appColorScheme.primary,
      labelTextStyle: WidgetStatePropertyAll<TextStyle?>(AppTextThemes.lightTheme().bodyLarge),
      indicatorColor: AppColors.lightAccent,
    );
  }
}
