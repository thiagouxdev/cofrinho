// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cofrinho_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CofrinhoModelAdapter extends TypeAdapter<CofrinhoModel> {
  @override
  final int typeId = 0;

  @override
  CofrinhoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CofrinhoModel(
      name: fields[0] as String,
      goal: fields[1] as String,
      initialAmount: fields[2] as double?,
      monthlySaving: fields[3] as double,
    );
  }

  @override
  void write(BinaryWriter writer, CofrinhoModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.goal)
      ..writeByte(2)
      ..write(obj.initialAmount)
      ..writeByte(3)
      ..write(obj.monthlySaving);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CofrinhoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
