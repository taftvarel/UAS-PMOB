// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'course_reminder.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CoursereminderAdapter extends TypeAdapter<Course_reminder> {
  @override
  final int typeId = 1;

  @override
  Course_reminder read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Course_reminder(
      namaMatkul: fields[0] as String,
      kodeMatkul: fields[1] as String,
      jadwalMatkul: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Course_reminder obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.namaMatkul)
      ..writeByte(1)
      ..write(obj.kodeMatkul)
      ..writeByte(2)
      ..write(obj.jadwalMatkul);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CoursereminderAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
