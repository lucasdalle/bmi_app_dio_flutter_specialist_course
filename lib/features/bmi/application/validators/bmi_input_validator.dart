import 'package:bmi_app/features/bmi/application/formatters/bmi_input_hint_formatter.dart';

class BmiInputValidator {
  BmiInputValidator._();

  static final RegExp _weightRegExp = RegExp(r'^\d+(\.\d{1})?$');
  static final RegExp _heightRegExp = RegExp(r'^\d+(\.\d{1})?$');

  static String? validateWeight(String? rawWeight, bool isMetric) {
    if (rawWeight == null || rawWeight.isEmpty) {
      return 'Weight cannot be empty!';
    }

    if (!_weightRegExp.hasMatch(rawWeight)) {
      return 'Invalid weight format (${BmiInputHintFormatter.getWeightHint(isMetric)})';
    }

    final weight = double.tryParse(rawWeight);
    if (weight == null || weight <= 0) {
      return 'Weight must be greater than zero';
    }

    if (isMetric && (weight < 30 || weight > 300)) {
      return 'Unrealistic weight for metric';
    }

    if (!isMetric && (weight < 66 || weight > 660)) {
      return 'Unrealistic weight for imperial';
    }

    return null;
  }

  static String? validateHeight(String? rawHeight, bool isMetric) {
    if (rawHeight == null || rawHeight.isEmpty) {
      return 'Height cannot be empty!';
    }

    if (!_heightRegExp.hasMatch(rawHeight)) {
      return 'Invalid height format (${BmiInputHintFormatter.getHeightHint(isMetric)})';
    }

    final height = double.tryParse(rawHeight);
    if (height == null || height <= 0) {
      return 'Height must be greater than zero';
    }

    if (isMetric && (height < 1.2 || height > 2.5)) {
      return 'Unrealistic height for metric';
    }

    if (!isMetric && (height < 4.0 || height > 8.0)) {
      return 'Unrealistic height for imperial';
    }

    return null;
  }
}
