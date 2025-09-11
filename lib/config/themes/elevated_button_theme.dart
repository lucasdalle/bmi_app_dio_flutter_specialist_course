import 'package:bmi_app/config/colors/colors.dart';
import 'package:bmi_app/config/constants.dart';
import 'package:flutter/material.dart';

class AppElevatedButtonThemes {
  AppElevatedButtonThemes._();

  static ElevatedButtonThemeData lightTheme() {
    return const ElevatedButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll<Color?>(AppColors.lightPrimary),
        shape: WidgetStatePropertyAll<OutlinedBorder?>(
          RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(kButtonBorderRadius))),
        ),
      ),
    );
  }
}
