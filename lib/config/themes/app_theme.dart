import 'package:bmi_app/config/colors/colors.dart';
import 'package:bmi_app/config/themes/card_theme.dart';
import 'package:bmi_app/config/themes/elevated_button_theme.dart';
import 'package:bmi_app/config/themes/input_decoration_theme.dart';
import 'package:bmi_app/config/themes/navigation_bar_theme.dart';
import 'package:bmi_app/config/themes/text_theme.dart';
import 'package:flutter/material.dart';

import 'appbar_theme.dart';

class AppTheme {
  const AppTheme._();

  static ThemeData lightTheme() {
    return ThemeData(
      useMaterial3: true,
      colorScheme: AppColors.appColorScheme,
      scaffoldBackgroundColor: AppColors.appColorScheme.primaryContainer,
      textTheme: AppTextThemes.lightTheme(),
      appBarTheme: AppBarThemes.lightTheme(),
      cardTheme: AppCardThemes.lightTheme(),
      elevatedButtonTheme: AppElevatedButtonThemes.lightTheme(),
      inputDecorationTheme: AppInputDecorationThemes.lightTheme(),
      navigationBarTheme: AppNavigationBarTheme.lightTheme(),
    );
  }

  static ThemeData darkTheme() {
    return ThemeData(useMaterial3: true);
  }
}
