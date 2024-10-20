// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sale_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SaleInfoAdapter extends TypeAdapter<SaleInfo> {
  @override
  final int typeId = 2;

  @override
  SaleInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SaleInfo(
      country: fields[0] as String?,
      saleability: fields[1] as String?,
      isEbook: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, SaleInfo obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.saleability)
      ..writeByte(2)
      ..write(obj.isEbook);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SaleInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
