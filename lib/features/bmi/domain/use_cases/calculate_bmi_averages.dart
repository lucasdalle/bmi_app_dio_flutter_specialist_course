import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';

class CalculateBmiHistoryAverages {
  const CalculateBmiHistoryAverages();

  double call(List<BmiHistory> history) {
    if (history.isEmpty) {
      return 0;
    }
    double averageBmiValue = history.map((element) => element.result.bmiValue).reduce((a, b) => a + b) / history.length;

    return averageBmiValue;
  }
}
