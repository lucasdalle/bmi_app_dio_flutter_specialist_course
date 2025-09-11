class BmiInputHintFormatter {
  BmiInputHintFormatter._();

  static String getHeightUnit(bool isMetric) {
    if (isMetric) {
      return 'm';
    } else {
      return 'ft';
    }
  }

  static String getWeightUnit(bool isMetric) {
    if (isMetric) {
      return 'kg';
    } else {
      return 'lb';
    }
  }

  static String getHeightHint(bool isMetric) {
    if (isMetric) {
      return 'e.g. 1.7';
    } else {
      return 'e.g. 5.6';
    }
  }

  static String getWeightHint(bool isMetric) {
    if (isMetric) {
      return 'e.g. 75 or 75.5';
    } else {
      return 'e.g. 165 or 165.5';
    }
  }
}
