import 'package:bmi_app/features/bmi/data/data_sources/bmi_local_data_source.dart';
import 'package:bmi_app/features/bmi/data/repositories/bmi_repository_impl.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_result.dart';
import 'package:bmi_app/features/bmi/domain/use_cases/calculate_bmi.dart';
import 'package:bmi_app/features/bmi/domain/use_cases/calculate_bmi_averages.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/bmi_input.dart';
import '../notifiers/bmi_input_notifier.dart';

final bmiInputProvider = NotifierProvider<BmiInputNotifier, BmiInput>(() {
  return BmiInputNotifier();
});

final calculateBmiProvider = Provider<CalculateBmi>((ref) {
  return const CalculateBmi();
});

final bmiResultProvider = Provider<BmiResult?>((ref) {
  final BmiInput input = ref.read(bmiInputProvider);

  if (input.weight <= 0 || input.height <= 0) return null;

  final BmiResult result = ref.read(calculateBmiProvider).call(input);

  ref.read(bmiRepositoryProvider).addToHistory(BmiHistory(input: input, result: result));
  ref.invalidate(bmiHistoryListProvider);

  return result;
});

final bmiRepositoryProvider = Provider<BmiRepositoryImpl>((ref) {
  return BmiRepositoryImpl(localDataSource: BmiLocalDataSource());
});

final bmiHistoryListProvider = FutureProvider<List<BmiHistory>>((ref) async {
  return await ref.read(bmiRepositoryProvider).getHistory();
});

final calculateBmiHistAvgProvider = Provider<CalculateBmiHistoryAverages>((ref) {
  return const CalculateBmiHistoryAverages();
});
