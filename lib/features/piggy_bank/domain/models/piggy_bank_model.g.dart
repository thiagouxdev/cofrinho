// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'piggy_bank_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PiggyBankModelAdapter extends TypeAdapter<PiggyBankModel> {
  @override
  final int typeId = 0;

  @override
  PiggyBankModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PiggyBankModel(
      id: fields[0] as String,
      name: fields[1] as String,
      goal: fields[2] as String,
      goalAmount: fields[3] as double,
      initialAmount: fields[4] as double,
      monthlyContribution: fields[5] as double,
      creationDate: fields[6] as DateTime,
      currentAmount: fields[7] as double,
    );
  }

  @override
  void write(BinaryWriter writer, PiggyBankModel obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.goal)
      ..writeByte(3)
      ..write(obj.goalAmount)
      ..writeByte(4)
      ..write(obj.initialAmount)
      ..writeByte(5)
      ..write(obj.monthlyContribution)
      ..writeByte(6)
      ..write(obj.creationDate)
      ..writeByte(7)
      ..write(obj.currentAmount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PiggyBankModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
