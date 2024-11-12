// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact_model.g.dart';

@HiveType(typeId: 1)
class ContactModel extends Contact with HiveObjectMixin {
  @HiveField(0)
  String idModel;
  @HiveField(1)
  String emailModel;
  @HiveField(2)
  Timestamp addTimeModel;
  @HiveField(3)
  String fullNameModel;
  @HiveField(4)
  String primePhoneModel;
  @HiveField(5)
  String dateOfBirthModel;
  @HiveField(6)
  String nationalityModel;
  @HiveField(7)
  List<String> phonesModel;
  @HiveField(8)
  SocialMediaModel socialMediaModel;
  @HiveField(9)
  CompanyModel companyModel;
  @HiveField(10)
  String imageUrlModel;
  @HiveField(11)
  String favoriteCategoryModel;

  ContactModel({
    required this.idModel,
    required this.addTimeModel,
    required this.fullNameModel,
    required this.primePhoneModel,
    required this.dateOfBirthModel,
    required this.nationalityModel,
    required this.phonesModel,
    required this.socialMediaModel,
    required this.companyModel,
    required this.emailModel,
    required this.imageUrlModel,
    required this.favoriteCategoryModel,
  }) : super(
          id: idModel,
          addTime: addTimeModel,
          dateOfBirth: dateOfBirthModel,
          fullName: fullNameModel,
          nationality: nationalityModel,
          imageUrl: imageUrlModel,
          phones: phonesModel,
          primePhone: primePhoneModel,
          socialMedia: socialMediaModel,
          company: companyModel,
          email: emailModel,
          favoriteCategory: favoriteCategoryModel,
        );

  ContactModel copyWith({
    String? id,
    String? fullName,
    String? email,
    String? primePhone,
    String? dateOfBirth,
    String? nationality,
    String? imageUrl,
    Timestamp? addTime,
    List<String>? phones,
    SocialMediaModel? socialMedia,
    CompanyModel? company,
    String? favoriteCategory,
  }) {
    return ContactModel(
        idModel: id ?? idModel,
        addTimeModel: addTime ?? addTimeModel,
        fullNameModel: fullName ?? fullNameModel,
        primePhoneModel: primePhone ?? primePhoneModel,
        dateOfBirthModel: dateOfBirth ?? dateOfBirthModel,
        nationalityModel: nationality ?? nationalityModel,
        imageUrlModel: imageUrl ?? imageUrlModel,
        phonesModel: phones ?? phonesModel,
        socialMediaModel: socialMedia ?? socialMediaModel,
        companyModel: company ?? companyModel,
        emailModel: email ?? emailModel,
        favoriteCategoryModel: favoriteCategory ?? favoriteCategoryModel);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'idModel': idModel,
      'emailModel': emailModel,
      'addTimeModel': addTimeModel.millisecondsSinceEpoch,
      'fullNameModel': fullNameModel,
      'primePhoneModel': primePhoneModel,
      'dateOfBirthModel': dateOfBirthModel,
      'nationalityModel': nationalityModel,
      'phonesModel': phonesModel,
      'socialMediaModel': socialMediaModel.toMap(),
      'companyModel': companyModel.toMap(),
      'imageUrlModel': imageUrlModel,
      'favoriteCategoryModel': favoriteCategoryModel,
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> json) {
    return ContactModel(
      primePhoneModel: json['primePhone'] ?? '',
      nationalityModel: json['nationality'] ?? '',
      imageUrlModel: json['imageUrl'] ?? '',
      emailModel: json['email'] ?? '',
      phonesModel: List<String>.from(json['phones'] ?? []),
      fullNameModel: json['fullName'] ?? '',
      companyModel: CompanyModel.fromMap(json['company']),
      dateOfBirthModel: json['dateOfBirth'] ?? '',
      idModel: json['id'] ?? '',
      socialMediaModel: SocialMediaModel.fromMap(json['socialMedia']),
      addTimeModel: json['addTime'] == null
          ? Timestamp.now()
          : Timestamp.fromMillisecondsSinceEpoch(json['addTime']),
      favoriteCategoryModel: json['favoriteCategory'] ?? '',
    );
  }

  factory ContactModel.fromContact(Contact user) {
    return ContactModel(
      idModel: user.id,
      addTimeModel: user.addTime,
      fullNameModel: user.fullName,
      primePhoneModel: user.primePhone,
      dateOfBirthModel: user.dateOfBirth,
      nationalityModel: user.nationality,
      imageUrlModel: user.imageUrl,
      emailModel: user.email,
      phonesModel: user.phones,
      favoriteCategoryModel: '',
      socialMediaModel: SocialMediaModel.fromSocialMedia(user.socialMedia),
      companyModel: CompanyModel.fromCompany(user.company),
    );
  }

  String toJson() => json.encode(toMap());

  factory ContactModel.fromJson(String source) =>
      ContactModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}

/*
String toJsonHive() {
    return jsonEncode({
      'id': idModel,
      'addTime': addTimeModel.millisecondsSinceEpoch,
      'fullName': fullNameModel,
      'email': emailModel,
      'primePhone': primePhoneModel,
      'dateOfBirth': dateOfBirthModel,
      'nationality': nationalityModel,
      'imageUrl': imageUrlModel,
      'phones': phonesModel,
      'favoriteCategory': favoriteCategoryModel,
      'socialMedia': socialMediaModel.toMap(),
      'company': companyModel.toMap(),
    });
  }

  factory ContactModel.fromJsonHive(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    return ContactModel(
      primePhoneModel: json['primePhone'] ?? '',
      nationalityModel: json['nationality'] ?? '',
      imageUrlModel: json['imageUrl'] ?? '',
      phonesModel: List<String>.from(json['phones']),
      fullNameModel: json['fullName'] ?? '',
      companyModel: CompanyModel.fromMap(json['company']),
      dateOfBirthModel: json['dateOfBirth'] ?? '',
      idModel: json['id'] ?? '',
      emailModel: json['email'] ?? '',
      favoriteCategoryModel: json['favoriteCategory'] ?? '',
      socialMediaModel: SocialMediaModel.fromMap(json['socialMedia']),
      addTimeModel: Timestamp.fromMillisecondsSinceEpoch(
        json['addTime'],
      ),
    );
  }*/
