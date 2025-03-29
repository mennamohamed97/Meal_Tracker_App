// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_meal.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AddMealAdapter extends TypeAdapter<AddMeal> {
  @override
  final int typeId = 0;

  @override
  AddMeal read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AddMeal(
      name: fields[0] as String,
      time: fields[1] as String,
      calories: fields[2] as int,
      imageUrl: fields[3] as String,
      date: fields[4] as DateTime,
      id: fields[5] as String,
    );
  }

  @override
  void write(BinaryWriter writer, AddMeal obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.time)
      ..writeByte(2)
      ..write(obj.calories)
      ..writeByte(3)
      ..write(obj.imageUrl)
      ..writeByte(4)
      ..write(obj.date)
      ..writeByte(5)
      ..write(obj.id);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AddMealAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
