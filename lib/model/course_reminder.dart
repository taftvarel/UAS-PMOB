import 'package:hive/hive.dart';
part 'course_reminder.g.dart';
@HiveType(typeId: 1)
class Course_reminder {
  @HiveField(0)
  final String namaMatkul;
  @HiveField(1)
  final String kodeMatkul;
  @HiveField(2)
  final String jadwalMatkul;
  Course_reminder({
    required this.namaMatkul,
    required this.kodeMatkul,
    required this.jadwalMatkul,
  });
}