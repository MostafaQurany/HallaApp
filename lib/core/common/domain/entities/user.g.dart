// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 1;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[0] as String,
      email: fields[1] as String,
      fullName: fields[2] as String,
      primePhone: fields[3] as String,
      dateOfBirth: fields[4] as String,
      nationality: fields[5] as String,
      imageUrl: fields[6] as String,
      pinCode: fields[7] as String,
      phones: (fields[8] as List).cast<String>(),
      socialMedia: fields[10] as SocialMedia,
      company: fields[11] as Company,
      nfcList: (fields[9] as List).cast<String>(),
      favoriteCategories: (fields[13] as List).cast<String>(),
      isGuest: fields[12] as bool,
      ratingAverage: fields[14] as DocumentReference<Object>?,
      jobTitles: (fields[15] as List?)?.cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.fullName)
      ..writeByte(3)
      ..write(obj.primePhone)
      ..writeByte(4)
      ..write(obj.dateOfBirth)
      ..writeByte(5)
      ..write(obj.nationality)
      ..writeByte(6)
      ..write(obj.imageUrl)
      ..writeByte(7)
      ..write(obj.pinCode)
      ..writeByte(8)
      ..write(obj.phones)
      ..writeByte(9)
      ..write(obj.nfcList)
      ..writeByte(10)
      ..write(obj.socialMedia)
      ..writeByte(11)
      ..write(obj.company)
      ..writeByte(12)
      ..write(obj.isGuest)
      ..writeByte(13)
      ..write(obj.favoriteCategories)
      ..writeByte(14)
      ..write(obj.ratingAverage)
      ..writeByte(15)
      ..write(obj.jobTitles?.toList());
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
