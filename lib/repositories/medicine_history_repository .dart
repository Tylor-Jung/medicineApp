import 'dart:developer';

import 'package:app_project/models/medicine_history.dart';
import 'package:app_project/repositories/app_hive.dart';
import 'package:hive/hive.dart';

class MedicineHistoryRepository {
  Box<MedicineHistory>? _HistoryBox;

  Box<MedicineHistory> get HistoryBox {
    _HistoryBox ??= Hive.box<MedicineHistory>(AppHiveBox.medicineHistory);
    return _HistoryBox!;
  }

  void addHistory(MedicineHistory history) async {
    int key = await HistoryBox.add(history);

    log('[addHistory] add (key:$key) $history');
    log('result ${HistoryBox.values.toList()}');
  }

  void deleteHistory(int key) async {
    await HistoryBox.delete(key);

    log('[deleteHistory] delete (key:$key)');
    log('result ${HistoryBox.values.toList()}');
  }

  void updateHistory({
    required int key,
    required MedicineHistory history,
  }) async {
    await HistoryBox.put(key, history);

    log('[updateHistory] update (key:$key) $history');
    log('result ${HistoryBox.values.toList()}');
  }
}
