// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/domain/entities/company.dart';
import 'package:halla/core/common/domain/entities/social_media.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart';

@HiveType(typeId: 1)
class User extends HiveObject {
  @HiveField(0)
  String id;
  @HiveField(1)
  String email;
  @HiveField(2)
  String fullName;
  @HiveField(3)
  String primePhone;
  @HiveField(4)
  String dateOfBirth;
  @HiveField(5)
  String nationality;
  @HiveField(6)
  String imageUrl;
  @HiveField(7)
  String pinCode;
  @HiveField(8)
  List<String> phones;
  @HiveField(9)
  List<String> nfcList;
  @HiveField(10)
  SocialMedia socialMedia;
  @HiveField(11)
  Company company;
  @HiveField(12)
  bool isGuest;
  @HiveField(13)
  List<String> favoriteCategories;
  @HiveField(14)
  DocumentReference? ratingAverage;
  @HiveField(15)
  List<String>? jobTitles;
  @HiveField(16)
  String? latitude;
  @HiveField(17)
  String? longitude;

  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.primePhone,
    required this.dateOfBirth,
    required this.nationality,
    required this.imageUrl,
    required this.pinCode,
    required this.phones,
    required this.socialMedia,
    required this.company,
    this.nfcList = const [],
    this.favoriteCategories = const [],
    this.isGuest = false,
    this.ratingAverage,
    this.jobTitles,
    this.latitude,
    this.longitude,
  });

  Map<String, dynamic> toMap() {
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
      'socialMedia': socialMedia.toMap(),
      'company': company.toMap(),
      'isGuest': isGuest,
      'favoriteCategories': favoriteCategories,
      'ratingAverage': FirebaseFirestore.instance
          .collection(AppConstants.ratingUserCollection)
          .doc(id),
      'jobTitles': jobTitles?.toList() ?? [],
      'latitude': latitude,
      'longitude': longitude,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      primePhone: map['primePhone'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      nationality: map['nationality'] as String,
      imageUrl: map['imageUrl'] as String,
      pinCode: map['pinCode'] as String,
      socialMedia:
          SocialMedia.fromMap(map['socialMedia'] as Map<String, dynamic>),
      company: Company.fromMap(map['company'] as Map<String, dynamic>),
      isGuest: map['isGuest'] as bool,
      phones: (map['phones'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      nfcList: (map['nfcList'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      favoriteCategories: (map['favoriteCategories'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      ratingAverage: map['ratingAverage'],
      jobTitles: (map['jobTitles'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
}
