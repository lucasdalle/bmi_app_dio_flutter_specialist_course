import 'package:bmi_app/core/widgets/glass_card_widget.dart';
import 'package:bmi_app/features/bmi/presentation/riverpod/providers/bmi_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/themes/app_spacing_theme_extension.dart';

class UnitSelectionCard extends ConsumerStatefulWidget {
  const UnitSelectionCard({super.key});

  @override
  ConsumerState<UnitSelectionCard> createState() => _UnitSelectionCardState();
}

class _UnitSelectionCardState extends ConsumerState<UnitSelectionCard> {
  @override
  Widget build(BuildContext context) {
    return GlassCard(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: context.spacing.md,
        children: [
          Padding(
            padding: EdgeInsets.only(left: context.spacing.lg, right: context.spacing.lg, top: context.spacing.md),
            child: Text('Know your number', style: TextTheme.of(context).headlineLarge, textAlign: TextAlign.start),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: context.spacing.lg),
            child: Text(
              'Body Mass Index estimates body fat using height and weight.',
              style: TextTheme.of(context).bodyLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: context.spacing.lg, right: context.spacing.lg, bottom: context.spacing.lg),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: context.spacing.xl,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButtonTheme.of(context).style?.copyWith(
                      padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(
                        EdgeInsetsGeometry.symmetric(horizontal: context.spacing.md),
                      ),
                      backgroundColor: ref.watch(bmiInputProvider).isMetric
                          ? WidgetStatePropertyAll<Color?>(Theme.of(context).colorScheme.primary)
                          : WidgetStatePropertyAll<Color?>(Theme.of(context).colorScheme.secondaryContainer),
                    ),
                    onPressed: () {
                      ref.read(bmiInputProvider.notifier).setIsMetric(true);
                    },
                    icon: ref.watch(bmiInputProvider).isMetric
                        ? Icon(Icons.check, color: Theme.of(context).colorScheme.onPrimary)
                        : null,
                    label: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Metric (kg, m)',
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: ref.watch(bmiInputProvider).isMetric
                              ? Theme.of(context).colorScheme.onPrimary
                              : Theme.of(context).colorScheme.primary,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    style: ElevatedButtonTheme.of(context).style?.copyWith(
                      padding: WidgetStatePropertyAll<EdgeInsetsGeometry?>(
                        EdgeInsetsGeometry.symmetric(horizontal: context.spacing.md),
                      ),
                      backgroundColor: ref.watch(bmiInputProvider).isMetric
                          ? WidgetStatePropertyAll<Color?>(Theme.of(context).colorScheme.secondaryContainer)
                          : WidgetStatePropertyAll<Color?>(Theme.of(context).colorScheme.primary),
                    ),
                    onPressed: () {
                      ref.read(bmiInputProvider.notifier).setIsMetric(false);
                    },
                    icon: ref.watch(bmiInputProvider).isMetric
                        ? null
                        : Icon(Icons.check, color: Theme.of(context).colorScheme.onPrimary),
                    label: FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        'Imperial (lb, ft)',
                        style: TextTheme.of(context).bodyLarge?.copyWith(
                          color: ref.watch(bmiInputProvider).isMetric
                              ? Theme.of(context).colorScheme.primary
                              : Theme.of(context).colorScheme.onPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
