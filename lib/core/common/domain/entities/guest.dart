// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:halla/core/common/domain/entities/company.dart';
import 'package:halla/core/common/domain/entities/social_media.dart';
import 'package:halla/core/common/domain/entities/user.dart';

class Guest extends User {
  final String idGuest;
  final String upgradedId;
  final String fullNameGuest;
  final String pinCodeGuest;
  final bool isUpGraded;

  Guest({
    required this.idGuest,
    required this.fullNameGuest,
    required this.pinCodeGuest,
    this.isUpGraded = false,
    this.upgradedId = '',
  }) : super(
          id: idGuest,
          email: '',
          fullName: fullNameGuest,
          primePhone: '',
          dateOfBirth: '',
          nationality: '',
          imageUrl: '',
          pinCode: pinCodeGuest,
          nfcList: [],
          phones: [],
          isGuest: true,
          favoriteCategories: [],
          socialMedia: SocialMedia(
            facebook: '',
            instagram: '',
            linkedin: '',
            twitter: '',
          ),
          company: Company(
            name: '',
            phoneNumber: '',
            website: '',
            position: '',
          ),

        );

  @override
  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': idGuest,
      'name': fullNameGuest,
      'pinCode': pinCodeGuest,
      'isUpGraded': isUpGraded,
      'upgradedId': upgradedId,
    };
  }

  factory Guest.fromMap(Map<String, dynamic> map) {
    return Guest(
      idGuest: map['id'] ?? '',
      fullNameGuest: map['name'] ?? '',
      pinCodeGuest: map['pinCode'] ?? '',
      isUpGraded: map['isUpGraded'] ?? false,
      upgradedId: map['upgradedId'] ?? '',
    );
  }

  @override
  String toJson() => json.encode(toMap());

  factory Guest.fromJson(String source) =>
      Guest.fromMap(json.decode(source) as Map<String, dynamic>);
}
