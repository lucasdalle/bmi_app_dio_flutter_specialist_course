import 'package:bmi_app/features/bmi/data/repositories/bmi_repository_impl.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_result.dart';
import 'package:bmi_app/features/bmi/domain/use_cases/calculate_bmi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/bmi_input.dart';
import '../notifiers/bmi_input_notifier.dart';

final bmiInputProvider = NotifierProvider<BmiInputNotifier, BmiInput>(() {
  return BmiInputNotifier();
});

final bmiRepositoryProvider = Provider<BmiRepositoryImpl>((ref) {
  return BmiRepositoryImpl();
});

final calculateBmiProvider = Provider<CalculateBmi>((ref) {
  return CalculateBmi();
});

final bmiResultProvider = Provider<BmiResult?>((ref) {
  final BmiInput input = ref.read(bmiInputProvider);

  if (input.weight <= 0 || input.height <= 0) return null;

  BmiResult result = ref.read(calculateBmiProvider).call(input);

  ref.read(bmiRepositoryProvider).addToHistory(BmiHistory(input: input, result: result));

  return result;
});
