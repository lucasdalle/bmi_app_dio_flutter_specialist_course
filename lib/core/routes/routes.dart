import 'package:flutter/material.dart';

import '../../features/bmi/presentation/pages/main_bmi_screen.dart';

class AppRoutes {
  AppRoutes._();

  static Map<String, Widget Function(BuildContext)> appRoutes = {MainScreen.route: (context) => const MainScreen()};
}
