import 'dart:convert';

import 'package:halla/core/common/domain/entities/guest.dart';

class GuestModel extends Guest {
  GuestModel({
    required super.idGuest,
    required super.fullNameGuest,
    required super.pinCodeGuest,
    super.isUpGraded,
    super.upgradedId,
  });
  GuestModel copyWith({
    String? id,
    String? fullNameGuest,
    String? pinCode,
    bool? isUpGraded,
    String? upgradedId,
  }) {
    return GuestModel(
      idGuest: id ?? this.id,
      fullNameGuest: fullNameGuest ?? this.fullNameGuest,
      pinCodeGuest: pinCode ?? this.pinCode,
      isUpGraded: isUpGraded ?? this.isUpGraded,
      upgradedId: upgradedId ?? this.upgradedId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': idGuest,
      'name': fullNameGuest,
      'pinCode': pinCodeGuest,
      'isUpGraded': isUpGraded,
      'upgradedId': upgradedId,
    };
  }

  factory GuestModel.fromMap(Map<String, dynamic> map) {
    return GuestModel(
      idGuest: map['id'] as String,
      fullNameGuest: map['name'] as String,
      pinCodeGuest: map['pinCode'] as String,
      isUpGraded: map['isUpGraded'] as bool,
      upgradedId: map['upgradedId'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestModel.fromJson(String source) =>
      GuestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
