import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/domain/entities/company.dart';
import 'package:halla/core/common/domain/entities/social_media.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'contact_adapter.g.dart';

@HiveType(typeId: 0)
class ContactAdapter extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String fullName;

  @HiveField(2)
  String primePhone;

  @HiveField(3)
  String dateOfBirth;

  @HiveField(4)
  String nationality;

  @HiveField(5)
  List<String> phones;

  @HiveField(6)
  List<String> nfcList;

  @HiveField(7)
  SocialMedia socialMedia;

  @HiveField(8)
  Company company;

  @HiveField(9)
  Timestamp addTime;

  ContactAdapter({
    required this.id,
    required this.fullName,
    required this.primePhone,
    required this.dateOfBirth,
    required this.nationality,
    required this.phones,
    required this.nfcList,
    required this.socialMedia,
    required this.company,
    required this.addTime,
  });

  factory ContactAdapter.fromContact(Contact contact) => ContactAdapter(
        id: contact.id,
        fullName: contact.fullName,
        primePhone: contact.primePhone,
        dateOfBirth: contact.dateOfBirth,
        nationality: contact.nationality,
        phones: contact.phones,
        nfcList: contact.nfcList,
        socialMedia: contact.socialMedia,
        company: contact.company,
        addTime: contact.addTime,
      );
}

@HiveType(typeId: 1)
class SocialMediaAdapter extends HiveObject {
  @HiveField(0)
  String facebook;

  @HiveField(1)
  String instagram;

  @HiveField(2)
  String linkedin;

  @HiveField(3)
  String twitter;

  SocialMediaAdapter({
    required this.facebook,
    required this.instagram,
    required this.linkedin,
    required this.twitter,
  });
  factory SocialMediaAdapter.fromContact(SocialMedia socialMedia) =>
      SocialMediaAdapter(
        facebook: socialMedia.facebook,
        instagram: socialMedia.instagram,
        linkedin: socialMedia.linkedin,
        twitter: socialMedia.twitter,
      );
}

@HiveType(typeId: 2)
class CompanyAdapter extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String phoneNumber;

  @HiveField(2)
  String website;

  @HiveField(3)
  String position;

  CompanyAdapter({
    required this.name,
    required this.phoneNumber,
    required this.website,
    required this.position,
  });
  factory CompanyAdapter.fromContact(Company company) => CompanyAdapter(
      name: company.name,
      phoneNumber: company.phoneNumber,
      website: company.website,
      position: company.position);
}
