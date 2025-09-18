import 'package:bmi_app/config/colors/colors.dart';
import 'package:bmi_app/features/bmi/application/formatters/bmi_input_hint_formatter.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';
import 'package:bmi_app/features/bmi/presentation/widgets/bmi_tip_widget.dart';
import 'package:flutter/material.dart';

import '../../../../config/themes/app_spacing_theme_extension.dart';
import 'bmi_category_card_widget.dart';

class BmiHistoryListTile extends StatelessWidget {
  const BmiHistoryListTile({super.key, required this.resultHistory});

  final BmiHistory resultHistory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.spacing.md),
      child: Card(
        color: AppColors.lightAccent,
        child: ListTile(
          title: Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing.sm, vertical: context.spacing.sm),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Flexible(
                  child: Column(
                    children: [
                      Text(
                        'BMI ${resultHistory.result.bmiValue.toStringAsFixed(1)}',
                        style: TextTheme.of(
                          context,
                        ).headlineLarge?.copyWith(color: AppColors.lightPrimary, fontWeight: FontWeight.w900),
                      ),
                    ],
                  ),
                ),
                Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${resultHistory.input.weight.toStringAsFixed(1)} '
                        '${BmiInputHintFormatter.getWeightUnit(resultHistory.input.isMetric)}',
                        style: TextTheme.of(context).bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                      Text(
                        '${resultHistory.input.height.toStringAsFixed(1)} '
                        '${BmiInputHintFormatter.getHeightUnit(resultHistory.input.isMetric)}',
                        style: TextTheme.of(context).bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(left: context.spacing.sm, right: context.spacing.sm, bottom: context.spacing.sm),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: context.spacing.md,
              children: [
                BmiCategoryCard(category: resultHistory.result.resultCategory.toString()),
                BmiTip(tip: resultHistory.result.getTip()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
