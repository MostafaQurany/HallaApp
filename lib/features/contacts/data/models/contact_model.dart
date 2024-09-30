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
  final String emailModel;
  @HiveField(2)
  final Timestamp addTimeModel;
  @HiveField(3)
  final String fullNameModel;
  @HiveField(4)
  final String primePhoneModel;
  @HiveField(5)
  final String dateOfBirthModel;
  @HiveField(6)
  final String nationalityModel;
  @HiveField(7)
  final List<String> phonesModel;
  @override
  @HiveField(8)
  final SocialMediaModel socialMediaModel;
  @HiveField(9)
  final CompanyModel companyModel;
  @HiveField(10)
  final String imageUrlModel;

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
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': idModel,
      'addTime': addTimeModel,
      'fullName': fullNameModel,
      'email': emailModel,
      'primePhone': primePhoneModel,
      'dateOfBirth': dateOfBirthModel,
      'nationality': nationalityModel,
      'imageUrl': imageUrlModel,
      'phones': phones,
      'socialMedia': socialMediaModel.toMap(),
      'company': companyModel.toMap(),
    };
  }

  factory ContactModel.fromMap(Map<String, dynamic> json) {
    return ContactModel(
      primePhoneModel: json['primePhone'] ?? '',
      nationalityModel: json['nationality'] ?? '',
      imageUrlModel: json['imageUrl'] ?? '',
      emailModel: json['email'] ?? '',
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
      imageUrlModel: user.imageUrl,
      emailModel: user.email,
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
      'email': emailModel,
      'primePhone': primePhoneModel,
      'dateOfBirth': dateOfBirthModel,
      'nationality': nationalityModel,
      'imageUrl': imageUrlModel,
      'phones': phonesModel,
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
      socialMediaModel: SocialMediaModel.fromMap(json['socialMedia']),
      addTimeModel: Timestamp.fromMillisecondsSinceEpoch(
        json['addTime'],
      ),
    );
  }
}
