// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Epub_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EpubAdapter extends TypeAdapter<Epub> {
  @override
  final int typeId = 8;

  @override
  Epub read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Epub(
      isAvailable: fields[0] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, Epub obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.isAvailable);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EpubAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
