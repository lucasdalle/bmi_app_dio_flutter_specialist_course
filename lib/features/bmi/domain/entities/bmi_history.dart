import 'package:bmi_app/features/bmi/domain/entities/bmi_category.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_input.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_result.dart';

class BmiHistory {
  const BmiHistory({this.id, required this.input, required this.result});

  final int? id;
  final BmiInput input;
  final BmiResult result;

  factory BmiHistory.fromMap(Map<String, dynamic> map) {
    return BmiHistory(
      id: map['id'],
      input: BmiInput(weight: map['weight'], height: map['height'], isMetric: map['isMetric'] == 1),
      result: BmiResult(
        bmiValue: map['bmiValue'],
        resultCategory: BmiCategory(category: BmiCategories.values[map['category']]),
      ),
    );
  }
}
