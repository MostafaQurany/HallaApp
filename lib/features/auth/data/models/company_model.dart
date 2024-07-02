import 'package:halla/core/domain/entities/company.dart';

class CompanyModel extends Company{
  CompanyModel({
    required super.name,
    required super.phoneNumber,
    required super.website,
    required super.position,
  });

  CompanyModel copyWith({
    String? name,
    String? phoneNumber,
    String? website,
    String? position,
  }) {
    return CompanyModel(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      website: website ?? this.website,
      position: position ?? this.position,
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNumber': phoneNumber,
      'website': website,
      'position': position,
    };
  }

  factory CompanyModel.fromMap(Map<String, dynamic> map) {
    return CompanyModel(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      website: map['website'] as String,
      position: map['position'] as String,
    );
  }
}