// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'industry_identifier_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class IndustryIdentifierAdapter extends TypeAdapter<IndustryIdentifier> {
  @override
  final int typeId = 6;

  @override
  IndustryIdentifier read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return IndustryIdentifier(
      type: fields[0] as String?,
      identifier: fields[1] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, IndustryIdentifier obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.type)
      ..writeByte(1)
      ..write(obj.identifier);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is IndustryIdentifierAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
