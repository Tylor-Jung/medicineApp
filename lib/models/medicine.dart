import 'package:hive/hive.dart';

part 'medicine.g.dart';

@HiveType(typeId: 1)
class Medicine extends HiveObject {
  Medicine({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.alarms,
  });
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String? imagePath;

  @HiveField(3)
  final List<String> alarms;

  @override
  String toString() {
    return 'id: $id, name: $name, imagePath: $imagePath, alarms: $alarms';
  }
}

  // id, name, image(optional), alarms

  // unique 한 ID 만드는 방법
  // 1.auto increment, 2.UUID(String 으로 문자+숫자 고유값), 3.millisecondsSinceEpoch, 4.random