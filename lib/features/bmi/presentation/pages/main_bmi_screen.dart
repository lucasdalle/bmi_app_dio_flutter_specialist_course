import 'package:bmi_app/features/bmi/presentation/pages/history_screen.dart';
import 'package:bmi_app/features/bmi/presentation/pages/input_result_screen.dart';
import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';

List<Widget> _mainScreens = [const InputResultScreen(), const HistoryScreen()];

List<Widget> _destinations = [
  const NavigationDestination(
    icon: Icon(Icons.input_rounded, color: AppColors.lightAccent),
    selectedIcon: Icon(Icons.input_rounded),
    label: 'Input',
  ),
  const NavigationDestination(
    icon: Icon(Icons.history_rounded, color: AppColors.lightAccent),
    selectedIcon: Icon(Icons.history_rounded),
    label: 'History',
  ),
];

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});
  static const String route = '/main';

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentDestinationIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(child: _mainScreens[_currentDestinationIndex]),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _currentDestinationIndex,
        onDestinationSelected: (newValue) {
          setState(() {
            _currentDestinationIndex = newValue;
          });
        },
        destinations: _destinations,
      ),
    );
  }
}
