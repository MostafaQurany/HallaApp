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
  final String idModel;
  @HiveField(1)
  final Timestamp addTimeModel;
  @HiveField(2)
  final String fullNameModel;
  @HiveField(3)
  final String primePhoneModel;
  @HiveField(4)
  final String dateOfBirthModel;
  @HiveField(5)
  final String nationalityModel;
  @HiveField(6)
  final List<String> phonesModel;
  @HiveField(7)
  final SocialMediaModel socialMediaModel;
  @HiveField(8)
  final CompanyModel companyModel;

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
  }) : super(
          id: idModel,
          addTime: addTimeModel,
          dateOfBirth: dateOfBirthModel,
          fullName: fullNameModel,
          nationality: nationalityModel,
          phones: phonesModel,
          primePhone: primePhoneModel,
          socialMedia: socialMediaModel,
          company: companyModel,
        );

  ContactModel copyWith({
    String? id,
    String? fullName,
    String? primePhone,
    String? dateOfBirth,
    String? nationality,
    Timestamp? addTime,
    List<String>? phones,
    SocialMediaModel? socialMedia,
    CompanyModel? company,
  }) {
    return ContactModel(
      idModel: id ?? idModel,
      addTimeModel: addTime ?? addTimeModel,
      fullNameModel: fullName ?? fullNameModel,
      primePhoneModel: primePhone ?? primePhoneModel,
      dateOfBirthModel: dateOfBirth ?? dateOfBirthModel,
      nationalityModel: nationality ?? nationalityModel,
      phonesModel: phones ?? phonesModel,
      socialMediaModel: socialMedia ?? socialMediaModel,
      companyModel: company ?? companyModel,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': idModel,
      'addTime': addTimeModel,
      'fullName': fullNameModel,
      'primePhone': primePhoneModel,
      'dateOfBirth': dateOfBirthModel,
      'nationality': nationalityModel,
      'phones': phones,
      'socialMedia': socialMediaModel.toMap(),
      'company': companyModel.toMap(),
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> json) {
    return ContactModel(
      primePhoneModel: json['primePhone'] ?? '',
      nationalityModel: json['nationality'] ?? '',
      phonesModel: List<String>.from(json['phones']),
      fullNameModel: json['fullName'] ?? '',
      companyModel: CompanyModel.fromMap(json['company']),
      dateOfBirthModel: json['dateOfBirth'] ?? '',
      idModel: json['id'] ?? '',
      socialMediaModel: SocialMediaModel.fromMap(json['socialMedia']),
      addTimeModel: json['addTime'],
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
      phonesModel: user.phones,
      socialMediaModel: SocialMediaModel.fromSocialMedia(user.socialMedia),
      companyModel: CompanyModel.fromCompany(user.company),
    );
  }

  String toJsonHive() {
    return jsonEncode({
      'id': idModel,
      'addTime': addTimeModel.millisecondsSinceEpoch,
      'fullName': fullNameModel,
      'primePhone': primePhoneModel,
      'dateOfBirth': dateOfBirthModel,
      'nationality': nationalityModel,
      'phones': phonesModel,
      'socialMedia': socialMediaModel.toMap(),
      'company': companyModel.toMap(),
    });
  }

  factory ContactModel.fromJsonHive(String jsonString) {
    Map<String,dynamic> json = jsonDecode(jsonString) ;
    return ContactModel(
      primePhoneModel: json['primePhone'] ?? '',
      nationalityModel: json['nationality'] ?? '',
      phonesModel: List<String>.from(json['phones']),
      fullNameModel: json['fullName'] ?? '',
      companyModel: CompanyModel.fromMap(json['company']),
      dateOfBirthModel: json['dateOfBirth'] ?? '',
      idModel: json['id'] ?? '',
      socialMediaModel: SocialMediaModel.fromMap(json['socialMedia']),
      addTimeModel: Timestamp.fromMillisecondsSinceEpoch(
        json['addTime'],
      ), 
    );
  }


}
