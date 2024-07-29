import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';

class UserModel extends User {
  @override
  final SocialMediaModel socialMedia;

  @override
  final CompanyModel company;
  UserModel({
    super.id = '',
    super.email = '',
    super.fullName = '',
    super.primePhone = '',
    super.dateOfBirth = '',
    super.nationality = '',
    super.pinCode = '',
    super.phones = const [],
    super.nfcList = const [],
    required this.socialMedia,
    required this.company,
  }) : super(socialMedia: socialMedia, company: company);

  UserModel copyWith({
    String? id,
    String? email,
    String? fullName,
    String? primePhone,
    String? dateOfBirth,
    String? nationality,
    String? pinCode,
    List<String>? phones,
    List<String>? nfcList,
    SocialMediaModel? socialMedia,
    CompanyModel? company,
  }) {
    return UserModel(
      id: id ?? this.id,
      email: email ?? this.email,
      fullName: fullName ?? this.fullName,
      primePhone: primePhone ?? this.primePhone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      nationality: nationality ?? this.nationality,
      pinCode: pinCode ?? this.pinCode,
      phones: phones ?? this.phones,
      nfcList: nfcList ?? this.nfcList,
      socialMedia: socialMedia ?? this.socialMedia,
      company: company ?? this.company,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
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

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      primePhone: map['primePhone'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      nationality: map['nationality'] as String,
      pinCode: map['pinCode'] as String,
      phones: (map['phones'] as List<dynamic>).map((e) => e as String).toList(),
      nfcList:
          (map['nfcList'] as List<dynamic>).map((e) => e as String).toList(),
      socialMedia:
          SocialMediaModel.fromMap(map['socialMedia'] as Map<String, dynamic>),
      company: CompanyModel.fromMap(map['company'] as Map<String, dynamic>),
    );
  }
  factory UserModel.fromUser(User user) {
    return UserModel(
      id: user.id,
      email: user.email,
      fullName: user.fullName,
      primePhone: user.primePhone,
      dateOfBirth: user.dateOfBirth,
      nationality: user.nationality,
      pinCode: user.pinCode,
      phones: user.phones,
      nfcList: user.nfcList,
      socialMedia: SocialMediaModel.fromSocialMedia(user.socialMedia),
      company: CompanyModel.fromCompany(user.company),
    );
  }
}
