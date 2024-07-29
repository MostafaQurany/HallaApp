import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';

class ContactModel extends Contact {
  @override
  final SocialMediaModel socialMedia;

  @override
  final CompanyModel company;

  ContactModel({
    required super.id,
    required super.addTime,
    required super.fullName,
    required super.primePhone,
    required super.dateOfBirth,
    required super.nationality,
    required super.phones,
    required this.socialMedia,
    required this.company,
  }) : super(socialMedia: socialMedia, company: company);

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
