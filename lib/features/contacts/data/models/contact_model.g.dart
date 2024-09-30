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
      addTimeModel: fields[2] as Timestamp,
      fullNameModel: fields[3] as String,
      primePhoneModel: fields[4] as String,
      dateOfBirthModel: fields[5] as String,
      nationalityModel: fields[6] as String,
      phonesModel: (fields[7] as List).cast<String>(),
      socialMediaModel: fields[8] as SocialMediaModel,
      companyModel: fields[9] as CompanyModel,
      emailModel: fields[1] as String,
      imageUrlModel: fields[10] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ContactModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.idModel)
      ..writeByte(1)
      ..write(obj.emailModel)
      ..writeByte(2)
      ..write(obj.addTimeModel)
      ..writeByte(3)
      ..write(obj.fullNameModel)
      ..writeByte(4)
      ..write(obj.primePhoneModel)
      ..writeByte(5)
      ..write(obj.dateOfBirthModel)
      ..writeByte(6)
      ..write(obj.nationalityModel)
      ..writeByte(7)
      ..write(obj.phonesModel)
      ..writeByte(8)
      ..write(obj.socialMedia)
      ..writeByte(9)
      ..write(obj.companyModel)
      ..writeByte(10)
      ..write(obj.imageUrlModel);
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
