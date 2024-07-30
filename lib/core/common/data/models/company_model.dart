import 'package:halla/core/common/domain/entities/company.dart';
import 'package:hive_flutter/hive_flutter.dart';
part 'company_model.g.dart';

@HiveType(typeId: 2)
class CompanyModel extends Company with HiveObjectMixin {
  @HiveField(0)
  @override
  final String name;
  @HiveField(1)
  @override
  final String phoneNumber;
  @HiveField(2)
  @override
  final String website;
  @HiveField(3)
  @override
  final String position;
  CompanyModel({
    this.name = '',
    this.phoneNumber = '',
    this.website = '',
    this.position = '',
  }) : super(
          name: name,
          phoneNumber: phoneNumber,
          position: position,
          website: website,
        );

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
      name: company.name,
      phoneNumber: company.phoneNumber,
      website: company.website,
      position: company.phoneNumber,
    );
  }
}
