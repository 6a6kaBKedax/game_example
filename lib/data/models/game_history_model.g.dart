// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_history_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GameHistoryModelAdapter extends TypeAdapter<GameHistoryModel> {
  @override
  final int typeId = 0;

  @override
  GameHistoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GameHistoryModel(
      time: fields[0] as DateTime,
      points: fields[1] as int,
    );
  }

  @override
  void write(BinaryWriter writer, GameHistoryModel obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.time)
      ..writeByte(1)
      ..write(obj.points);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GameHistoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
