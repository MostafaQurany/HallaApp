// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CompanyModelAdapter extends TypeAdapter<CompanyModel> {
  @override
  final int typeId = 2;

  @override
  CompanyModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyModel(
      nameModel: fields[0] as String,
      phoneNumberModel: fields[1] as String,
      websiteModel: fields[2] as String,
      positionModel: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.nameModel)
      ..writeByte(1)
      ..write(obj.phoneNumberModel)
      ..writeByte(2)
      ..write(obj.websiteModel)
      ..writeByte(3)
      ..write(obj.positionModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
