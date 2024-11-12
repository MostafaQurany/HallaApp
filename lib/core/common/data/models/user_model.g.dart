// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      idModel: fields[0] as String,
      emailModel: fields[1] as String,
      fullNameModel: fields[2] as String,
      primePhoneModel: fields[3] as String,
      dateOfBirthModel: fields[4] as String,
      nationalityModel: fields[5] as String,
      imageUrlModel: fields[6] as String,
      pinCodeModel: fields[7] as String,
      phonesModel: (fields[8] as List).cast<String>(),
      nfcListModel: (fields[9] as List).cast<String>(),
      isGuestModel: fields[10] as bool,
      favoriteCategoriesModel: (fields[11] as List).cast<String>(),
      socialMediaModel: fields[12] as SocialMediaModel,
      companyModel: fields[13] as CompanyModel,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.idModel)
      ..writeByte(1)
      ..write(obj.emailModel)
      ..writeByte(2)
      ..write(obj.fullNameModel)
      ..writeByte(3)
      ..write(obj.primePhoneModel)
      ..writeByte(4)
      ..write(obj.dateOfBirthModel)
      ..writeByte(5)
      ..write(obj.nationalityModel)
      ..writeByte(6)
      ..write(obj.imageUrlModel)
      ..writeByte(7)
      ..write(obj.pinCodeModel)
      ..writeByte(8)
      ..write(obj.phonesModel)
      ..writeByte(9)
      ..write(obj.nfcListModel)
      ..writeByte(10)
      ..write(obj.isGuestModel)
      ..writeByte(11)
      ..write(obj.favoriteCategoriesModel)
      ..writeByte(12)
      ..write(obj.socialMediaModel)
      ..writeByte(13)
      ..write(obj.companyModel);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
