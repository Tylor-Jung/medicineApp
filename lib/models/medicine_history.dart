import 'package:hive/hive.dart';

part 'medicine_history.g.dart';

@HiveType(typeId: 2)
class MedicineHistory extends HiveObject {
  MedicineHistory({
    required this.medicineId,
    required this.alarmTime,
    required this.takeTime,
  });
  @HiveField(0)
  final int medicineId;

  @HiveField(1)
  final String alarmTime;

  @HiveField(2)
  final DateTime takeTime;

  @override
  String toString() {
    return '{medicineid: $medicineId, alarmTime: $alarmTime, takeTime: $takeTime,}';
  }
}

  // id, name, image(optional), alarms

  // unique 한 ID 만드는 방법
  // 1.auto increment, 2.UUID(String 으로 문자+숫자 고유값), 3.millisecondsSinceEpoch, 4.random