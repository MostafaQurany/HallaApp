// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:halla/core/common/domain/entities/company.dart';
import 'package:halla/core/common/domain/entities/social_media.dart';

class User {
  String id;
  String email;
  String fullName;
  String primePhone;
  String dateOfBirth;
  String nationality;
  String pinCode;
  List<String> phones;
  List<String> nfcList;
  SocialMedia socialMedia;
  Company company;
  bool isGuest;
  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.primePhone,
    required this.dateOfBirth,
    required this.nationality,
    required this.pinCode,
    required this.nfcList,
    required this.phones,
    required this.socialMedia,
    required this.company,
    this.isGuest = false,
  });

  @override
  String toString() {
    return 'User(id: $id, email: $email, fullName: $fullName, primePhone: $primePhone, dateOfBirth: $dateOfBirth, nationality: $nationality, pinCode: $pinCode, nfcList: $nfcList, socialMedia: ${socialMedia.toString()}, company: ${company.toString()})';
  }
}
