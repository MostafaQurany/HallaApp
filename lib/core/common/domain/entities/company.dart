// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';

part 'company.g.dart';

@HiveType(typeId: 3)
class Company  extends HiveObject{
  @HiveField(0)
  String name;
  @HiveField(1)
  String phoneNumber;
  @HiveField(2)
  String website;
  @HiveField(3)
  String position;
  Company({
    this.name = '',
    this.phoneNumber = '',
    this.website = '',
    this.position = '',
  });

  Company copyWith({
    String? name,
    String? phoneNumber,
    String? website,
    String? position,
  }) {
    return Company(
      name: name ?? this.name,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      website: website ?? this.website,
      position: position ?? this.position,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'phoneNumber': phoneNumber,
      'website': website,
      'position': position,
    };
  }

  factory Company.fromMap(Map<String, dynamic> map) {
    return Company(
      name: map['name'] as String,
      phoneNumber: map['phoneNumber'] as String,
      website: map['website'] as String,
      position: map['position'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Company.fromJson(String source) =>
      Company.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Company(name: $name, phoneNumber: $phoneNumber, website: $website, position: $position)';
  }

  @override
  bool operator ==(covariant Company other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.phoneNumber == phoneNumber &&
        other.website == website &&
        other.position == position;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        phoneNumber.hashCode ^
        website.hashCode ^
        position.hashCode;
  }
}
