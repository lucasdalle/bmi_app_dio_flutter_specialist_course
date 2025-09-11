import 'package:flutter/material.dart';

import '../../../../config/constants.dart';

class BmiCategoryCard extends StatelessWidget {
  const BmiCategoryCard({super.key, required this.category});

  final String category;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kCardBorderRadius),
            color: Theme.of(context).colorScheme.secondaryContainer,
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.05,
              vertical: constraints.maxWidth * 0.015,
            ),
            child: Text(
              category,
              style: TextTheme.of(context).headlineSmall?.copyWith(color: Theme.of(context).colorScheme.primary),
            ),
          ),
        );
      },
    );
  }
}
