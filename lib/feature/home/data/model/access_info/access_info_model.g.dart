// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'access_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AccessInfoAdapter extends TypeAdapter<AccessInfo> {
  @override
  final int typeId = 9;

  @override
  AccessInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AccessInfo(
      country: fields[0] as String?,
      viewability: fields[1] as String?,
      embeddable: fields[2] as bool?,
      publicDomain: fields[3] as bool?,
      webReaderLink: fields[4] as String?,
      epub: fields[5] as Epub?,
      pdf: fields[6] as Pdf?,
    );
  }

  @override
  void write(BinaryWriter writer, AccessInfo obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.viewability)
      ..writeByte(2)
      ..write(obj.embeddable)
      ..writeByte(3)
      ..write(obj.publicDomain)
      ..writeByte(4)
      ..write(obj.webReaderLink)
      ..writeByte(5)
      ..write(obj.epub)
      ..writeByte(6)
      ..write(obj.pdf);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AccessInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
