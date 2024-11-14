import 'dart:convert';

import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:hive_flutter/hive_flutter.dart';

@HiveType(typeId: 3)
class GuestModel extends Guest {
  @HiveField(0)
  final String idGuestModel;
  @HiveField(1)
  final String fullNameGuestModel;
  @HiveField(2)
  final String pinCodeGuestModel;
  @HiveField(3)
  bool isUpGradedModel;
  @HiveField(4)
  String upgradedIdModel;

  GuestModel({
    required this.idGuestModel,
    required this.fullNameGuestModel,
    required this.pinCodeGuestModel,
    this.isUpGradedModel = false,
    this.upgradedIdModel = '',
  }) : super(
          idGuest: idGuestModel,
          fullNameGuest: fullNameGuestModel,
          pinCodeGuest: pinCodeGuestModel,
          isUpGraded: isUpGradedModel,
          upgradedId: upgradedIdModel,
        );

  GuestModel copyWith({
    String? id,
    String? fullNameGuest,
    String? pinCode,
    bool? isUpGraded,
    String? upgradedId,
  }) {
    return GuestModel(
      idGuestModel: id ?? this.id,
      fullNameGuestModel: fullNameGuest ?? this.fullNameGuest,
      pinCodeGuestModel: pinCode ?? this.pinCode,
      isUpGradedModel: isUpGraded ?? this.isUpGraded,
      upgradedIdModel: upgradedId ?? this.upgradedId,
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
      idGuestModel: map['id'] ?? '',
      fullNameGuestModel: map['name'] ?? '',
      pinCodeGuestModel: map['pinCode'] ?? '',
      isUpGradedModel: map['isUpGraded'] ?? false,
      upgradedIdModel: map['upgradedId'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GuestModel.fromJson(String source) =>
      GuestModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
