import 'dart:convert';

import 'package:halla/core/common/domain/entities/guest.dart';

class GuestModel extends Guest {
  GuestModel({
    required super.id,
    required super.name,
    required super.pinCode,
    super.isUpGraded,
    super.uId,
  });
  GuestModel copyWith({
    String? id,
    String? name,
    String? pinCode,
    bool? isUpGraded,
    String? uId,
  }) {
    return GuestModel(
      id: id ?? this.id,
      name: name ?? this.name,
      pinCode: pinCode ?? this.pinCode,
      isUpGraded: isUpGraded ?? this.isUpGraded,
      uId: uId ?? this.uId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'pinCode': pinCode,
      'isUpGraded': isUpGraded,
      'uId': uId,
    };
  }

  factory GuestModel.fromMap(Map<String, dynamic> map) {
    return GuestModel(
      id: map['id'] as String,
      name: map['name'] as String,
      pinCode: map['pinCode'] as String,
      isUpGraded: map['isUpGraded'] as bool,
      uId: map['uId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestModel.fromJson(String source) =>
      GuestModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Guest(id: $id, name: $name, pinCode: $pinCode, isUpGraded: $isUpGraded, uId: $uId)';
  }

  @override
  bool operator ==(covariant GuestModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.pinCode == pinCode &&
        other.isUpGraded == isUpGraded &&
        other.uId == uId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        pinCode.hashCode ^
        isUpGraded.hashCode ^
        uId.hashCode;
  }
}
