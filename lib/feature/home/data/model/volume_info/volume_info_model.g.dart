// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'volume_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class VolumeInfoAdapter extends TypeAdapter<VolumeInfo> {
  @override
  final int typeId = 1;

  @override
  VolumeInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return VolumeInfo(
      title: fields[0] as String?,
      authors: (fields[1] as List?)?.cast<String>(),
      publisher: fields[2] as String?,
      publishedDate: fields[3] as String?,
      description: fields[4] as String?,
      pageCount: fields[5] as int?,
      industryIdentifiers: (fields[6] as List?)?.cast<IndustryIdentifier>(),
      averageRating: fields[7] as num?,
      ratingsCount: fields[8] as int?,
      language: fields[9] as String?,
      previewLink: fields[10] as String?,
      infoLink: fields[11] as String?,
      imageLinks: fields[12] as ImageLinks?,
      categories: (fields[13] as List?)?.cast<String>(),
      readingModes: fields[14] as ReadingModes?,
      panelizationSummary: fields[15] as PanelizationSummary?,
    );
  }

  @override
  void write(BinaryWriter writer, VolumeInfo obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.authors)
      ..writeByte(2)
      ..write(obj.publisher)
      ..writeByte(3)
      ..write(obj.publishedDate)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.pageCount)
      ..writeByte(6)
      ..write(obj.industryIdentifiers)
      ..writeByte(7)
      ..write(obj.averageRating)
      ..writeByte(8)
      ..write(obj.ratingsCount)
      ..writeByte(9)
      ..write(obj.language)
      ..writeByte(10)
      ..write(obj.previewLink)
      ..writeByte(11)
      ..write(obj.infoLink)
      ..writeByte(12)
      ..write(obj.imageLinks)
      ..writeByte(13)
      ..write(obj.categories)
      ..writeByte(14)
      ..write(obj.readingModes)
      ..writeByte(15)
      ..write(obj.panelizationSummary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is VolumeInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
