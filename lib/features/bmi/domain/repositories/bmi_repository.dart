import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';

abstract class BmiRepository {
  Future<List<BmiHistory>> getHistory();
  Future<void> addToHistory(BmiHistory newResult);
  Future<void> removeFromHistory(int index);
}
