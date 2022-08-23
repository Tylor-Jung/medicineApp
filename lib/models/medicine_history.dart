import 'package:hive/hive.dart';

part 'medicine_history.g.dart';

@HiveType(typeId: 2)
class MedicineHistory extends HiveObject {
  MedicineHistory({
    required this.medicineKey,
    required this.medicineId,
    required this.alarmTime,
    required this.takeTime,
    required this.name,
    required this.imagePath,
  });
  @HiveField(0)
  final int medicineId;

  @HiveField(1)
  final String alarmTime;

  @HiveField(2)
  final DateTime takeTime;

  @HiveField(3, defaultValue: -1)
  final int medicineKey;

  @HiveField(4, defaultValue: '삭제된 약 입니다.')
  final String name;

  @HiveField(5)
  final String? imagePath;

  @override
  String toString() {
    return '{medicineId: $medicineId, alarmTime: $alarmTime, takeTime: $takeTime, medicineKey: $medicineKey, imagePath: $imagePath, name: $name,}';
  }
}

  // id, name, image(optional), alarms

  // unique 한 ID 만드는 방법
  // 1.auto increment, 2.UUID(String 으로 문자+숫자 고유값), 3.millisecondsSinceEpoch, 4.random