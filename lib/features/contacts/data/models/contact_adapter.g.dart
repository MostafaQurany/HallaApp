// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_adapter.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactAdapterA extends TypeAdapter<ContactAdapter> {
  @override
  final int typeId = 0;

  @override
  ContactAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactAdapter(
      id: fields[0] as String,
      fullName: fields[1] as String,
      primePhone: fields[2] as String,
      dateOfBirth: fields[3] as String,
      nationality: fields[4] as String,
      phones: (fields[5] as List).cast<String>(),
      nfcList: (fields[6] as List).cast<String>(),
      socialMedia: fields[7] as SocialMedia,
      company: fields[8] as Company,
      addTime: fields[9] as Timestamp,
    );
  }

  @override
  void write(BinaryWriter writer, ContactAdapter obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.primePhone)
      ..writeByte(3)
      ..write(obj.dateOfBirth)
      ..writeByte(4)
      ..write(obj.nationality)
      ..writeByte(5)
      ..write(obj.phones)
      ..writeByte(6)
      ..write(obj.nfcList)
      ..writeByte(7)
      ..write(obj.socialMedia)
      ..writeByte(8)
      ..write(obj.company)
      ..writeByte(9)
      ..write(obj.addTime);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactAdapterA &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SocialMediaAdapterA extends TypeAdapter<SocialMediaAdapter> {
  @override
  final int typeId = 1;

  @override
  SocialMediaAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SocialMediaAdapter(
      facebook: fields[0] as String,
      instagram: fields[1] as String,
      linkedin: fields[2] as String,
      twitter: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, SocialMediaAdapter obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.facebook)
      ..writeByte(1)
      ..write(obj.instagram)
      ..writeByte(2)
      ..write(obj.linkedin)
      ..writeByte(3)
      ..write(obj.twitter);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SocialMediaAdapterA &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CompanyAdapterA extends TypeAdapter<CompanyAdapter> {
  @override
  final int typeId = 2;

  @override
  CompanyAdapter read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CompanyAdapter(
      name: fields[0] as String,
      phoneNumber: fields[1] as String,
      website: fields[2] as String,
      position: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CompanyAdapter obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.phoneNumber)
      ..writeByte(2)
      ..write(obj.website)
      ..writeByte(3)
      ..write(obj.position);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CompanyAdapterA &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
