import 'package:bmi_app/features/bmi/presentation/widgets/result_card_widget.dart';
import 'package:bmi_app/features/bmi/presentation/widgets/unit_selection_card_widget.dart';
import 'package:bmi_app/features/bmi/presentation/widgets/weight_height_input_card_widget.dart';
import 'package:flutter/material.dart';

class InputResultScreen extends StatelessWidget {
  const InputResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(
              left: constraints.maxWidth * 0.05,
              right: constraints.maxWidth * 0.05,
              top: constraints.maxHeight * 0.025,
              bottom: constraints.maxHeight * 0.025 + MediaQuery.viewInsetsOf(context).bottom,
            ),
            child: Column(
              spacing: constraints.maxWidth * 0.05,
              children: [
                UnitSelectionCard(constraints: constraints),
                WeightHeightInputCard(constraints: constraints),
                ResultCard(constraints: constraints),
              ],
            ),
          ),
        );
      },
    );
  }
}
