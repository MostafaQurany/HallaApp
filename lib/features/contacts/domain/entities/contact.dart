import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/domain/entities/user.dart';

class Contact extends User {
  Timestamp addTime;
  String favoriteCategory;
  Contact({
    required super.id,
    required this.addTime,
    required super.fullName,
    required super.primePhone,
    required super.dateOfBirth,
    required super.nationality,
    required super.phones,
    required super.socialMedia,
    required super.company,
    required super.email,
    required super.imageUrl,
    required this.favoriteCategory,
  }) : super(
          nfcList: [],
          pinCode: '',
        );
}
