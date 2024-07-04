import 'package:halla/core/common/domain/entities/company.dart';

class CompanyModel extends Company {
  CompanyModel({
    super.name = '',
    super.phoneNumber = '',
    super.website = '',
    super.position = '',
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
  factory CompanyModel.fromCompany(Company company) {
    return CompanyModel(
      name:  company.name,
      phoneNumber:company.phoneNumber,
      website:company.website,
      position:company.phoneNumber,
    );
  }
}
