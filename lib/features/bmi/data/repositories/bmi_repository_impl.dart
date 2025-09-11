import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';
import 'package:bmi_app/features/bmi/domain/repositories/bmi_repository.dart';

class BmiRepositoryImpl implements BmiRepository {
  final List<BmiHistory> _resultHistory = [];
  double _averageBmiValue = 0;

  @override
  double get averageBmiValue => _averageBmiValue;

  @override
  List<BmiHistory> getHistory() {
    return _resultHistory.reversed.toList();
  }

  @override
  void addToHistory(BmiHistory newResult) {
    _resultHistory.add(newResult);
    _updateAverage();
  }

  @override
  void removeFromHistory(int index) {
    _resultHistory.removeAt(_resultHistory.length - 1 - index);
    _updateAverage();
  }

  void _updateAverage() {
    if (_resultHistory.isEmpty) {
      _averageBmiValue = 0;
      return;
    }
    _averageBmiValue =
        _resultHistory.map((element) => element.result.bmiValue).reduce((a, b) => a + b) / _resultHistory.length;
  }
}
