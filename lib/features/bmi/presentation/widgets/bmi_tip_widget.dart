import 'package:bmi_app/config/themes/app_spacing_theme_extension.dart';
import 'package:flutter/material.dart';

import '../../../../config/colors/colors.dart';

class BmiTip extends StatelessWidget {
  const BmiTip({super.key, required this.tip});

  final String tip;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: context.spacing.xs,
      children: [
        Icon(Icons.tips_and_updates_rounded, color: Theme.of(context).colorScheme.primary, applyTextScaling: true),
        Expanded(
          child: Text(
            tip,
            softWrap: true,
            style: TextTheme.of(context).bodyLarge?.copyWith(color: AppColors.lightPrimary),
          ),
        ),
      ],
    );
  }
}
