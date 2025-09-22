import 'package:bmi_app/core/widgets/glass_card_widget.dart';
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
    final history = ref.watch(bmiHistoryListProvider);

    return history.when(
      error: (err, _) => Center(child: Text('Error: $err')),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (history) {
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
                          ref.read(calculateBmiHistAvgProvider).call(history).toStringAsFixed(1),
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
                itemCount: history.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: context.spacing.xs),
                    child: Dismissible(
                      key: ValueKey<int>(history[index].id ?? index),
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
                      onDismissed: (DismissDirection direction) async {
                        await ref.read(bmiRepositoryProvider).removeFromHistory(index);
                        ref.invalidate(bmiHistoryListProvider);
                      },
                      child: BmiHistoryListTile(resultHistory: history[index]),
                    ),
                  );
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
