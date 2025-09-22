import 'package:bmi_app/features/bmi/data/data_sources/bmi_local_data_source.dart';
import 'package:bmi_app/features/bmi/domain/entities/bmi_history.dart';
import 'package:bmi_app/features/bmi/domain/repositories/bmi_repository.dart';

class BmiRepositoryImpl implements BmiRepository {
  BmiRepositoryImpl({required this.localDataSource});

  final BmiLocalDataSource localDataSource;
  List<BmiHistory> _cache = [];

  @override
  Future<List<BmiHistory>> getHistory() async {
    _cache = await localDataSource.getHistory();
    return _cache;
  }

  @override
  Future<void> addToHistory(BmiHistory newResult) async {
    await localDataSource.insertHistory(newResult);
    _cache = await localDataSource.getHistory();
  }

  @override
  Future<void> removeFromHistory(int index) async {
    final history = _cache[index];
    if (history.id != null) {
      await localDataSource.deleteHistory(history.id!);
    }
    _cache.removeAt(index);
  }
}
