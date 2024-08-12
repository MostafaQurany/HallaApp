// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ContactModelAdapter extends TypeAdapter<ContactModel> {
  @override
  final int typeId = 1;

  @override
  ContactModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ContactModel(
      idModel: fields[0] as String,
      addTimeModel: fields[1] as Timestamp,
      fullNameModel: fields[2] as String,
      primePhoneModel: fields[3] as String,
      dateOfBirthModel: fields[4] as String,
      nationalityModel: fields[5] as String,
      phonesModel: (fields[6] as List).cast<String>(),
      socialMediaModel: fields[7] as SocialMediaModel,
      companyModel: fields[8] as CompanyModel,
    );
  }

  @override
  void write(BinaryWriter writer, ContactModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.idModel)
      ..writeByte(1)
      ..write(obj.addTimeModel)
      ..writeByte(2)
      ..write(obj.fullNameModel)
      ..writeByte(3)
      ..write(obj.primePhoneModel)
      ..writeByte(4)
      ..write(obj.dateOfBirthModel)
      ..writeByte(5)
      ..write(obj.nationalityModel)
      ..writeByte(6)
      ..write(obj.phonesModel)
      ..writeByte(7)
      ..write(obj.socialMediaModel)
      ..writeByte(8)
      ..write(obj.companyModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ContactModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
