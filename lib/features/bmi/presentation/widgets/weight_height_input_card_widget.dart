import 'package:bmi_app/features/bmi/application/formatters/bmi_input_hint_formatter.dart';
import 'package:bmi_app/features/bmi/application/validators/bmi_input_validator.dart';
import 'package:bmi_app/features/bmi/presentation/riverpod/providers/bmi_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../config/themes/app_spacing_theme_extension.dart';

class WeightHeightInputCard extends ConsumerStatefulWidget {
  const WeightHeightInputCard({super.key});

  @override
  ConsumerState<WeightHeightInputCard> createState() => _WeightHeightInputCardState();
}

class _WeightHeightInputCardState extends ConsumerState<WeightHeightInputCard> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _weightTextEditingController = TextEditingController();
  final TextEditingController _heightTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Form(
        key: _formKey,
        child: Column(
          spacing: context.spacing.xl,
          children: [
            Padding(
              padding: EdgeInsets.only(left: context.spacing.md, right: context.spacing.md, top: context.spacing.xl),
              child: TextFormField(
                controller: _weightTextEditingController,
                style: TextTheme.of(context).bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Weight (${BmiInputHintFormatter.getWeightUnit(ref.watch(bmiInputProvider).isMetric)})'),
                  hintText: BmiInputHintFormatter.getWeightHint(ref.watch(bmiInputProvider).isMetric),
                  contentPadding: EdgeInsets.symmetric(horizontal: context.spacing.md, vertical: context.spacing.md),
                ),
                validator: (value) {
                  return BmiInputValidator.validateWeight(value, ref.watch(bmiInputProvider).isMetric);
                },
                onSaved: (newValue) {
                  double? value = double.tryParse(newValue!);
                  if (value == null) return;

                  ref.read(bmiInputProvider.notifier).setWeight(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: context.spacing.md),
              child: TextFormField(
                controller: _heightTextEditingController,
                style: TextTheme.of(context).bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Height (${BmiInputHintFormatter.getHeightUnit(ref.watch(bmiInputProvider).isMetric)})'),
                  hintText: BmiInputHintFormatter.getHeightHint(ref.watch(bmiInputProvider).isMetric),
                  contentPadding: EdgeInsets.symmetric(horizontal: context.spacing.md, vertical: context.spacing.md),
                ),
                validator: (value) {
                  return BmiInputValidator.validateHeight(value, ref.watch(bmiInputProvider).isMetric);
                },
                onSaved: (newValue) {
                  double? value = double.tryParse(newValue!);
                  if (value == null) return;

                  ref.read(bmiInputProvider.notifier).setHeight(value);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: context.spacing.xl, right: context.spacing.xl, bottom: context.spacing.lg),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.calculate_rounded,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: context.spacing.lg,
                    applyTextScaling: true,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      ref.refresh(bmiResultProvider);
                    }
                  },
                  label: Padding(
                    padding: EdgeInsets.symmetric(vertical: context.spacing.md),
                    child: Text('Calculate BMI', style: TextTheme.of(context).titleLarge),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
