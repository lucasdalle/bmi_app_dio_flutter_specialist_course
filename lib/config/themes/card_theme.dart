import 'package:bmi_app/config/colors/colors.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class AppCardThemes {
  AppCardThemes._();

  static CardThemeData lightTheme() {
    return const CardThemeData(
      color: AppColors.lightAccent,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.all(Radius.circular(kCardBorderRadius))),
    );
  }
}
