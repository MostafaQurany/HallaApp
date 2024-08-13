// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'social_media_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SocialMediaModelAdapter extends TypeAdapter<SocialMediaModel> {
  @override
  final int typeId = 3;

  @override
  SocialMediaModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SocialMediaModel(
      facebookModel: fields[0] as String,
      instagramModel: fields[1] as String,
      linkedinModel: fields[2] as String,
      twitterModel: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SocialMediaModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.facebookModel)
      ..writeByte(1)
      ..write(obj.instagramModel)
      ..writeByte(2)
      ..write(obj.linkedinModel)
      ..writeByte(3)
      ..write(obj.twitterModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialMediaModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
