import 'package:flutter/material.dart';

import '../../../../config/constants.dart';
import '../../../../config/themes/app_spacing_theme_extension.dart';

class BmiCategoryCard extends StatelessWidget {
  const BmiCategoryCard({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kCardBorderRadius),
        color: Theme.of(context).colorScheme.secondaryContainer,
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: context.spacing.md, vertical: context.spacing.xs),
        child: Text(
          category,
          style: TextTheme.of(context).headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
