import 'package:bmi_app/core/widgets/glass_card_widget.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';
import 'package:bmi_app/features/bmi/presentation/widgets/bmi_history_list_tile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/colors/colors.dart';
import '../../../../config/themes/app_spacing_theme_extension.dart';
import '../riverpod/providers/bmi_providers.dart';

class HistoryScreen extends ConsumerStatefulWidget {
  const HistoryScreen({super.key});

  @override
  ConsumerState<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends ConsumerState<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: context.spacing.md, vertical: context.spacing.md),
          child: GlassCard(
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: context.spacing.xs),
                child: Column(
                  children: [
                    Text('Average', style: TextTheme.of(context).titleLarge, textAlign: TextAlign.center),
                    Text(
                      ref.watch(bmiRepositoryProvider).averageBmiValue.toStringAsFixed(1),
                      style: TextTheme.of(context).headlineLarge,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: ref.watch(bmiRepositoryProvider).getHistory().length,
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: context.spacing.xs),
                child: Dismissible(
                  key: ValueKey<BmiHistory>(ref.watch(bmiRepositoryProvider).getHistory()[index]),
                  background: Container(
                    color: Colors.red.shade700,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(right: context.spacing.xl),
                          child: const Icon(Icons.delete_rounded, color: AppColors.lightAccent),
                        ),
                      ],
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  onDismissed: (DismissDirection direction) {
                    setState(() {
                      ref.read(bmiRepositoryProvider).removeFromHistory(index);
                    });
                  },
                  child: BmiHistoryListTile(resultHistory: ref.watch(bmiRepositoryProvider).getHistory()[index]),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
