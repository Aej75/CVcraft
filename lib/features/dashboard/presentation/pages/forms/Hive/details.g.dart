// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'details.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PersonalDetailsAdapter extends TypeAdapter<PersonalDetails> {
  @override
  final int typeId = 1;

  @override
  PersonalDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PersonalDetails(
      fields[1] as String,
      fields[2] as String,
      fields[0] as String,
    );
  }

  @override
  void write(BinaryWriter writer, PersonalDetails obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.address)
      ..writeByte(2)
      ..write(obj.age);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PersonalDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
