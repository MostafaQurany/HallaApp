// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/domain/entities/company.dart';
import 'package:halla/core/common/domain/entities/social_media.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact.g.dart';

@HiveType(typeId: 4)
class Contact extends HiveObject {
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
  List<String> phones;
  @HiveField(8)
  SocialMedia socialMedia;
  @HiveField(9)
  Company company;
  @HiveField(10)
  Timestamp? timestamp;
  @HiveField(11)
  String? favoriteCategory;
  Contact({
    required this.id,
    required this.email,
    required this.fullName,
    required this.primePhone,
    required this.dateOfBirth,
    required this.nationality,
    required this.imageUrl,
    required this.phones,
    required this.socialMedia,
    required this.company,
    this.timestamp,
    this.favoriteCategory,
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
      'phones': phones,
      'socialMedia': socialMedia.toMap(),
      'company': company.toMap(),
      'timestamp': timestamp?.millisecondsSinceEpoch ??
          Timestamp.now().millisecondsSinceEpoch,
      'favoriteCategory': favoriteCategory,
    };
  }

  factory Contact.fromMap(Map<String, dynamic> map) {
    return Contact(
      id: map['id'] as String,
      email: map['email'] as String,
      fullName: map['fullName'] as String,
      primePhone: map['primePhone'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      nationality: map['nationality'] as String,
      imageUrl: map['imageUrl'] as String,
      phones: List<String>.from(map['phones'] ?? [] as List<String>),
      socialMedia:
          SocialMedia.fromMap(map['socialMedia'] as Map<String, dynamic>),
      company: Company.fromMap(map['company'] as Map<String, dynamic>),
      timestamp: map['timestamp'] != null
          ? Timestamp.fromMillisecondsSinceEpoch(map['timestamp'] as int)
          : Timestamp.now(),
      favoriteCategory: map['favoriteCategory'] != null
          ? map['favoriteCategory'] as String
          : '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Contact.fromJson(String source) =>
      Contact.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Contact && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
