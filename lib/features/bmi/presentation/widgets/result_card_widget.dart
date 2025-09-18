import 'package:bmi_app/config/colors/colors.dart';
import 'package:bmi_app/features/bmi/presentation/riverpod/providers/bmi_providers.dart';
import 'package:bmi_app/features/bmi/presentation/widgets/bmi_category_card_widget.dart';
import 'package:bmi_app/features/bmi/presentation/widgets/bmi_tip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/themes/app_spacing_theme_extension.dart';

class ResultCard extends ConsumerWidget {
  const ResultCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(bmiResultProvider) != null
        ? Card(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.lg, vertical: context.spacing.lg),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: context.spacing.xl,
                children: [
                  Column(
                    children: [
                      Text(
                        'Your BMI',
                        style: TextTheme.of(
                          context,
                        ).headlineMedium?.copyWith(color: AppColors.lightPrimary, fontWeight: FontWeight.w900),
                        softWrap: true,
                      ),
                      Text(
                        ref.watch(bmiResultProvider)!.bmiValue.toStringAsFixed(1),
                        textAlign: TextAlign.center,
                        style: TextTheme.of(
                          context,
                        ).displayLarge?.copyWith(color: AppColors.lightPrimary, fontWeight: FontWeight.w900),
                        softWrap: true,
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      spacing: context.spacing.md,
                      children: [
                        BmiCategoryCard(category: ref.watch(bmiResultProvider)!.resultCategory.toString()),
                        BmiTip(tip: ref.watch(bmiResultProvider)!.getTip()),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        : const SizedBox();
  }
}
