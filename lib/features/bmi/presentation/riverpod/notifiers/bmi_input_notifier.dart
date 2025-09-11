import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/bmi_input.dart';

class BmiInputNotifier extends Notifier<BmiInput> {
  @override
  BmiInput build() {
    return const BmiInput();
  }

  void setWeight(double value) {
    state = state.copyWith(weight: value);
  }

  void setHeight(double value) {
    state = state.copyWith(height: value);
  }

  void setIsMetric(bool value) {
    state = state.copyWith(isMetric: value);
  }
}
