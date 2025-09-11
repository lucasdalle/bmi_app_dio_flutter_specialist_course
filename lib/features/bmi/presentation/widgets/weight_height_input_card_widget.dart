import 'package:bmi_app/features/bmi/application/formatters/bmi_input_hint_formatter.dart';
import 'package:bmi_app/features/bmi/application/validators/bmi_input_validator.dart';
import 'package:bmi_app/features/bmi/presentation/riverpod/providers/bmi_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeightHeightInputCard extends ConsumerStatefulWidget {
  const WeightHeightInputCard({super.key, required this.constraints});

  final BoxConstraints constraints;

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
          spacing: widget.constraints.maxHeight * 0.05,
          children: [
            Padding(
              padding: EdgeInsets.only(
                left: widget.constraints.maxWidth * 0.05,
                right: widget.constraints.maxWidth * 0.05,
                top: widget.constraints.maxHeight * 0.05,
              ),
              child: TextFormField(
                controller: _weightTextEditingController,
                style: TextTheme.of(context).bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Weight (${BmiInputHintFormatter.getWeightUnit(ref.watch(bmiInputProvider).isMetric)})'),
                  hintText: BmiInputHintFormatter.getWeightHint(ref.watch(bmiInputProvider).isMetric),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: widget.constraints.maxWidth * 0.05,
                    vertical: widget.constraints.maxHeight * 0.025,
                  ),
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
              padding: EdgeInsets.symmetric(horizontal: widget.constraints.maxWidth * 0.05),
              child: TextFormField(
                controller: _heightTextEditingController,
                style: TextTheme.of(context).bodyLarge?.copyWith(color: Theme.of(context).colorScheme.primary),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Height (${BmiInputHintFormatter.getHeightUnit(ref.watch(bmiInputProvider).isMetric)})'),
                  hintText: BmiInputHintFormatter.getHeightHint(ref.watch(bmiInputProvider).isMetric),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: widget.constraints.maxWidth * 0.05,
                    vertical: widget.constraints.maxHeight * 0.025,
                  ),
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
              padding: EdgeInsets.only(
                left: widget.constraints.maxWidth * 0.05,
                right: widget.constraints.maxWidth * 0.05,
                bottom: widget.constraints.maxHeight * 0.025,
              ),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: Icon(
                    Icons.calculate_rounded,
                    color: Theme.of(context).colorScheme.onPrimary,
                    size: widget.constraints.maxWidth * 0.05,
                    applyTextScaling: true,
                  ),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState?.save();
                      ref.refresh(bmiResultProvider);
                    }
                  },
                  label: Padding(
                    padding: EdgeInsets.symmetric(vertical: widget.constraints.maxHeight * 0.015),
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
