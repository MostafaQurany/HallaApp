import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'contact_model.g.dart';
@HiveType(typeId: 1)
class ContactModel extends Contact with HiveObjectMixin {
  @HiveField(0)
  @override
  final String id;
  @HiveField(1)
  @override
  final Timestamp addTime;
  @HiveField(2)
  @override
  final String fullName;
  @HiveField(3)
  @override
  final String primePhone;
  @HiveField(4)
  @override
  final String dateOfBirth;
  @HiveField(5)
  @override
  final String nationality;
  @HiveField(6)
  @override
  final List<String> phones;
  @HiveField(7)
  @override
  final SocialMediaModel socialMedia;

  @HiveField(8)
  @override
  final CompanyModel company;

  ContactModel({
    required this.id,
    required this.addTime,
    required this.fullName,
    required this.primePhone,
    required this.dateOfBirth,
    required this.nationality,
    required this.phones,
    required this.socialMedia,
    required this.company,
  }) : super(
          id: id,
          addTime: addTime,
          dateOfBirth: dateOfBirth,
          fullName: fullName,
          nationality: nationality,
          phones: phones,
          primePhone: primePhone,
          socialMedia: socialMedia,
          company: company,
        );

  ContactModel copyWith({
    String? id,
    String? email,
    String? fullName,
    String? primePhone,
    String? dateOfBirth,
    String? nationality,
    String? pinCode,
    Timestamp? addTime,
    List<String>? phones,
    List<String>? nfcList,
    SocialMediaModel? socialMedia,
    CompanyModel? company,
  }) {
    return ContactModel(
      id: id ?? this.id,
      addTime: addTime ?? this.addTime,
      fullName: fullName ?? this.fullName,
      primePhone: primePhone ?? this.primePhone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      nationality: nationality ?? this.nationality,
      phones: phones ?? this.phones,
      socialMedia: socialMedia ?? this.socialMedia,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'addTime': addTime,
      'email': email,
      'fullName': fullName,
      'primePhone': primePhone,
      'dateOfBirth': dateOfBirth,
      'nationality': nationality,
      'pinCode': pinCode,
      'phones': phones,
      'nfcList': nfcList,
      'socialMedia': socialMedia.toMap(),
      'company': company.toMap(),
    };
  }

  factory ContactModel.fromJson(Map<String, dynamic> map) {
    return ContactModel(
      id: map['id'] as String,
      addTime: map['addTime'] as Timestamp,
      fullName: map['fullName'] as String,
      primePhone: map['primePhone'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      nationality: map['nationality'] as String,
      phones: (map['phones'] as List<dynamic>).map((e) => e as String).toList(),
      socialMedia:
          SocialMediaModel.fromMap(map['socialMedia'] as Map<String, dynamic>),
      company: CompanyModel.fromMap(map['company'] as Map<String, dynamic>),
    );
  }
  factory ContactModel.fromContact(Contact user) {
    return ContactModel(
      id: user.id,
      addTime: user.addTime,
      fullName: user.fullName,
      primePhone: user.primePhone,
      dateOfBirth: user.dateOfBirth,
      nationality: user.nationality,
      phones: user.phones,
      socialMedia: SocialMediaModel.fromSocialMedia(user.socialMedia),
      company: CompanyModel.fromCompany(user.company),
    );
  }
}
