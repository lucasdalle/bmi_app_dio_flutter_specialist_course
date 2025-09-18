import 'package:bmi_app/config/themes/app_spacing_theme_extension.dart';
import 'package:bmi_app/features/bmi/presentation/widgets/unit_selection_card_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/result_card_widget.dart';
import '../widgets/weight_height_input_card_widget.dart';

class InputResultScreen extends StatelessWidget {
  const InputResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: context.spacing.md,
          right: context.spacing.md,
          top: context.spacing.md,
          bottom: context.spacing.md + MediaQuery.viewInsetsOf(context).bottom,
        ),
        child: Column(
          spacing: context.spacing.md,
          children: const [UnitSelectionCard(), WeightHeightInputCard(), ResultCard()],
        ),
      ),
    );
  }
}
