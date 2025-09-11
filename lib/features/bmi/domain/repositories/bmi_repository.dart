import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';

abstract class BmiRepository {
  List<BmiHistory> getHistory();
  void addToHistory(BmiHistory newResult);
  void removeFromHistory(int index);
  double get averageBmiValue;
  //TODO save result
  //TODO get history
}
