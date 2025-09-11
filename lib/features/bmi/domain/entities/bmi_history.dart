import 'package:bmi_app/features/bmi/domain/entities/bmi_input.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_result.dart';

class BmiHistory {
  BmiHistory({required this.input, required this.result});

  final BmiInput input;
  final BmiResult result;
}
