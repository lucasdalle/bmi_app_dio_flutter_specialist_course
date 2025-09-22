import 'dart:math';

import 'package:bmi_app/features/bmi/domain/entities/bmi_input.dart';
import 'package:units_converter/models/extension_converter.dart';
import 'package:units_converter/properties/length.dart';
import 'package:units_converter/properties/mass.dart';

import '../entities/bmi_category.dart';
import '../entities/bmi_result.dart';

class CalculateBmi {
  const CalculateBmi();

  BmiResult call(BmiInput input) {
    final double weightKg = input.isMetric ? input.weight : input.weight.convertFromTo(MASS.pounds, MASS.kilograms)!;
    final double heightM = input.isMetric ? input.height : input.height.convertFromTo(LENGTH.feet, LENGTH.meters)!;

    final bmi = (weightKg / pow(heightM, 2));
    final category = BmiCategory(category: BmiCategories.fromValue(bmi));

    return BmiResult(bmiValue: bmi, resultCategory: category);
  }
}
