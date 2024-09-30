import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fpdart/fpdart.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';

class UserModel extends User {
  final SocialMediaModel socialMediaModel;

  final CompanyModel companyModel;
  UserModel({
    super.id = '',
    super.email = '',
    super.fullName = '',
    super.primePhone = '',
    super.dateOfBirth = '',
    super.nationality = '',
    super.imageUrl = '',
    super.pinCode = '',
    super.phones = const [],
    super.nfcList = const [],
    super.favoriteCategories = const {},
    required this.socialMediaModel,
    required this.companyModel,
  }) : super(
          socialMedia: socialMediaModel,
          company: companyModel,
        );

  UserModel copyWith({
    String? id,
    String? email,
    String? fullName,
    String? primePhone,
    String? dateOfBirth,
    String? nationality,
    String? imageUrl,
    String? pinCode,
    List<String>? phones,
    List<String>? nfcList,
    Map<int, String>? favoriteCategories,
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
      imageUrl: imageUrl ?? this.imageUrl,
      pinCode: pinCode ?? this.pinCode,
      phones: phones ?? this.phones,
      nfcList: nfcList ?? this.nfcList,
      favoriteCategories: favoriteCategories ?? this.favoriteCategories,
      socialMediaModel: socialMedia ?? socialMediaModel,
      companyModel: company ?? companyModel,
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
      'imageUrl': imageUrl,
      'pinCode': pinCode,
      'phones': phones,
      'nfcList': nfcList,
      'favoriteCategories': favoriteCategories,
      'socialMedia': socialMediaModel.toMap(),
      'company': companyModel.toMap(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    Map<int, String> newMap = {};
    map["favoriteCategories"].forEach(
      (key, value) {
        newMap[int.parse(key)] = value.toString();
      },
    );

    return UserModel(
      id: map['id'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      primePhone: map['primePhone'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      nationality: map['nationality'] as String,
      imageUrl: map['imageUrl'] as String,
      pinCode: map['pinCode'] as String,
      phones: (map['phones'] as List<dynamic>).map((e) => e as String).toList(),
      nfcList:
          (map['nfcList'] as List<dynamic>).map((e) => e as String).toList(),
      favoriteCategories: newMap,
      socialMediaModel:
          SocialMediaModel.fromMap(map['socialMedia'] as Map<String, dynamic>),
      companyModel:
          CompanyModel.fromMap(map['company'] as Map<String, dynamic>),
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
      imageUrl: user.imageUrl,
      pinCode: user.pinCode,
      phones: user.phones,
      nfcList: user.nfcList,
      favoriteCategories: user.favoriteCategories,
      socialMediaModel: SocialMediaModel.fromSocialMedia(user.socialMedia),
      companyModel: CompanyModel.fromCompany(user.company),
    );
  }
}
