// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:halla/core/common/domain/entities/company.dart';
import 'package:halla/core/common/domain/entities/social_media.dart';

class User {
  final String id;
  final String email;
  final String fullName;
  final String primePhone;
  final String dateOfBirth;
  final String nationality;
  final SocialMedia socialMedia;
  final Company company;
  User({
    required this.id,
    required this.email,
    required this.fullName,
    required this.primePhone,
    required this.dateOfBirth,
    required this.nationality,
    required this.socialMedia,
    required this.company,
  });

  @override
  String toString() {
    return 'User(id: $id, email: $email, fullName: $fullName, primePhone: $primePhone, dateOfBirth: $dateOfBirth, nationality: $nationality, socialMedia: ${socialMedia.toString()}, company: ${company.toString()})';
  }
}
