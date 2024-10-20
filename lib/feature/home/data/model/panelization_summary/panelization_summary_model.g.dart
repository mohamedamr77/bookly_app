// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'panelization_summary_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PanelizationSummaryAdapter extends TypeAdapter<PanelizationSummary> {
  @override
  final int typeId = 5;

  @override
  PanelizationSummary read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PanelizationSummary(
      containsEpubBubbles: fields[0] as bool?,
      containsImageBubbles: fields[1] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, PanelizationSummary obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.containsEpubBubbles)
      ..writeByte(1)
      ..write(obj.containsImageBubbles);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PanelizationSummaryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
