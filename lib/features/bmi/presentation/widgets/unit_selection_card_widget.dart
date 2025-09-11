import 'package:bmi_app/core/widgets/glass_card_widget.dart';
import 'package:bmi_app/features/bmi/presentation/riverpod/providers/bmi_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/colors/colors.dart';

class UnitSelectionCard extends ConsumerStatefulWidget {
  const UnitSelectionCard({super.key, required this.constraints});

  final BoxConstraints constraints;

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
        spacing: widget.constraints.maxHeight * 0.015,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: widget.constraints.maxWidth * 0.05,
              right: widget.constraints.maxWidth * 0.05,
              top: widget.constraints.maxHeight * 0.025,
            ),
            child: Text('Know your number', style: TextTheme.of(context).headlineLarge, textAlign: TextAlign.start),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: widget.constraints.maxWidth * 0.05),
            child: Text(
              'Body Mass Index estimates body fat using height and weight.',
              style: TextTheme.of(context).bodyLarge,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: widget.constraints.maxWidth * 0.05,
              right: widget.constraints.maxWidth * 0.05,
              bottom: widget.constraints.maxHeight * 0.025,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: widget.constraints.maxWidth * 0.025,
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                    icon: ref.watch(bmiInputProvider).isMetric
                        ? const Icon(Icons.check, color: AppColors.lightAccent)
                        : null,
                    onPressed: () {
                      ref.read(bmiInputProvider.notifier).setIsMetric(true);
                    },
                    label: FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Metric (kg, m)', style: TextTheme.of(context).bodyLarge),
                    ),
                    style: ElevatedButtonTheme.of(context).style?.copyWith(
                      backgroundColor: ref.watch(bmiInputProvider).isMetric
                          ? WidgetStatePropertyAll<Color?>(Theme.of(context).colorScheme.primary)
                          : WidgetStatePropertyAll<Color?>(Theme.of(context).colorScheme.primaryContainer),
                    ),
                  ),
                ),
                Expanded(
                  child: ElevatedButton.icon(
                    icon: ref.watch(bmiInputProvider).isMetric
                        ? null
                        : const Icon(Icons.check, color: AppColors.lightAccent),
                    onPressed: () {
                      ref.read(bmiInputProvider.notifier).setIsMetric(false);
                    },
                    label: FittedBox(
                      fit: BoxFit.contain,
                      child: Text('Imperial (lb, ft)', style: TextTheme.of(context).bodyLarge),
                    ),
                    style: ElevatedButtonTheme.of(context).style?.copyWith(
                      backgroundColor: ref.watch(bmiInputProvider).isMetric
                          ? WidgetStatePropertyAll<Color?>(Theme.of(context).colorScheme.primaryContainer)
                          : WidgetStatePropertyAll<Color?>(Theme.of(context).colorScheme.primary),
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
