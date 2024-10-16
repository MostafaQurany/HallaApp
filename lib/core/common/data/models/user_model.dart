// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';
import 'package:halla/core/common/domain/entities/user.dart';
part 'user_model.g.dart';
@HiveType(typeId: 5)
class UserModel extends User with HiveObjectMixin {
  @HiveField(0)
  String idModel;

  @HiveField(1)
  String emailModel;

  @HiveField(2)
  String fullNameModel;

  @HiveField(3)
  String primePhoneModel;

  @HiveField(4)
  String dateOfBirthModel;

  @HiveField(5)
  String nationalityModel;

  @HiveField(6)
  String imageUrlModel;

  @HiveField(7)
  String pinCodeModel;

  @HiveField(8)
  List<String> phonesModel;

  @HiveField(9)
  List<String> nfcListModel;

  @HiveField(10)
  bool isGuestModel;

  @HiveField(11)
  List<String> favoriteCategoriesModel;

  @HiveField(12)
  final SocialMediaModel socialMediaModel;

  @HiveField(13)
  final CompanyModel companyModel;

  UserModel({
    this.idModel = '',
    this.emailModel = '',
    this.fullNameModel = '',
    this.primePhoneModel = '',
    this.dateOfBirthModel = '',
    this.nationalityModel = '',
    this.imageUrlModel = '',
    this.pinCodeModel = '',
    this.phonesModel = const [],
    this.nfcListModel = const [],
    this.isGuestModel = false,
    this.favoriteCategoriesModel = const [],
    required this.socialMediaModel,
    required this.companyModel,
  }) : super(
          id: idModel,
          email: emailModel,
          fullName: fullNameModel,
          primePhone: primePhoneModel,
          dateOfBirth: dateOfBirthModel,
          nationality: nationalityModel,
          imageUrl: imageUrlModel,
          pinCode: pinCodeModel,
          nfcList: nfcListModel,
          phones: phonesModel,
          favoriteCategories: favoriteCategoriesModel,
          
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
    List<String>? favoriteCategories,
    SocialMediaModel? socialMedia,
    CompanyModel? company,
  }) {
    return UserModel(
      idModel: id ?? idModel,
      emailModel: email ?? emailModel,
      fullNameModel: fullName ?? fullNameModel,
      primePhoneModel: primePhone ?? primePhoneModel,
      dateOfBirthModel: dateOfBirth ?? dateOfBirthModel,
      nationalityModel: nationality ?? nationalityModel,
      imageUrlModel: imageUrl ?? imageUrlModel,
      pinCodeModel: pinCode ?? pinCodeModel,
      phonesModel: phones ?? phonesModel,
      nfcListModel: nfcList ?? nfcListModel,
      isGuestModel: isGuestModel,
      favoriteCategoriesModel: favoriteCategories ?? favoriteCategoriesModel,
      socialMediaModel: socialMedia ?? socialMediaModel,
      companyModel: company ?? companyModel,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': idModel,
      'email': emailModel,
      'fullName': fullNameModel,
      'primePhone': primePhoneModel,
      'dateOfBirth': dateOfBirthModel,
      'nationality': nationalityModel,
      'imageUrl': imageUrlModel,
      'pinCode': pinCodeModel,
      'phones': phonesModel,
      'nfcList': nfcListModel,
      'favoriteCategories': favoriteCategoriesModel,
      'socialMedia': socialMediaModel.toMap(),
      'company': companyModel.toMap(),
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      idModel: map['id'] as String,
      emailModel: map['email'] as String,
      fullNameModel: map['fullName'] as String,
      primePhoneModel: map['primePhone'] as String,
      dateOfBirthModel: map['dateOfBirth'] as String,
      nationalityModel: map['nationality'] as String,
      imageUrlModel: map['imageUrl'] as String,
      pinCodeModel: map['pinCode'] as String,
      phonesModel:
          (map['phones'] as List<dynamic>).map((e) => e as String).toList(),
      nfcListModel:
          (map['nfcList'] as List<dynamic>).map((e) => e as String).toList(),
      favoriteCategoriesModel: (map['favoriteCategories'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      socialMediaModel:
          SocialMediaModel.fromMap(map['socialMedia'] as Map<String, dynamic>),
      companyModel:
          CompanyModel.fromMap(map['company'] as Map<String, dynamic>),
    );
  }

  factory UserModel.fromUser(User user) {
    return UserModel(
      idModel: user.id,
      emailModel: user.email,
      fullNameModel: user.fullName,
      primePhoneModel: user.primePhone,
      dateOfBirthModel: user.dateOfBirth,
      nationalityModel: user.nationality,
      imageUrlModel: user.imageUrl,
      pinCodeModel: user.pinCode,
      phonesModel: user.phones,
      nfcListModel: user.nfcList,
      favoriteCategoriesModel: user.favoriteCategories,
      socialMediaModel: SocialMediaModel.fromSocialMedia(user.socialMedia),
      companyModel: CompanyModel.fromCompany(user.company),
    );
  }
}
