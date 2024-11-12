import 'package:halla/core/common/domain/entities/company.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'company_model.g.dart';

@HiveType(typeId: 2)
class CompanyModel extends Company with HiveObjectMixin {
  @HiveField(0)
  final String nameModel;
  @HiveField(1)
  final String phoneNumberModel;
  @HiveField(2)
  final String websiteModel;
  @HiveField(3)
  final String positionModel;

  CompanyModel({
    this.nameModel = '',
    this.phoneNumberModel = '',
    this.websiteModel = '',
    this.positionModel = '',
  }) : super(
          name: nameModel,
          phoneNumber: phoneNumberModel,
          position: positionModel,
          website: websiteModel,
        );

  CompanyModel copyWith({
    String? name,
    String? phoneNumber,
    String? website,
    String? position,
  }) {
    return CompanyModel(
      nameModel: name ?? this.name,
      phoneNumberModel: phoneNumber ?? this.phoneNumber,
      websiteModel: website ?? this.website,
      positionModel: position ?? this.position,
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
      nameModel: map['name'] ?? '',
      phoneNumberModel: map['phoneNumber'] ?? '',
      websiteModel: map['website'] ?? '',
      positionModel: map['position'] ?? '',
    );
  }

  factory CompanyModel.fromCompany(Company company) {
    return CompanyModel(
      nameModel: company.name,
      phoneNumberModel: company.phoneNumber,
      websiteModel: company.website,
      positionModel: company.phoneNumber,
    );
  }
}
