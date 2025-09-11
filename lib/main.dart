import 'package:bmi_app/config/themes/app_theme.dart';
import 'package:bmi_app/core/routes/routes.dart';
import 'package:bmi_app/features/bmi/presentation/pages/main_bmi_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      themeMode: ThemeMode.light,
      theme: AppTheme.lightTheme(),
      darkTheme: AppTheme.darkTheme(),
      initialRoute: MainScreen.route,
      routes: AppRoutes.appRoutes,
    );
  }
}
