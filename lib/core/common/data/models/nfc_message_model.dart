import 'dart:convert';

import 'package:halla/core/common/domain/entities/nfc_message.dart';
import 'package:halla/core/utils/encryption.dart';

class NfcMessageModel extends NfcMessage {
  NfcMessageModel({
    required super.id,
    required super.uId,
    required super.email,
    required super.phone,
    required super.pinCode,
  });

  NfcMessageModel copyWith({
    String? id,
    String? uId,
    String? email,
    String? phone,
    String? pinCode,
  }) {
    return NfcMessageModel(
      id: id ?? this.id,
      uId: uId ?? this.uId,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      pinCode: pinCode ?? this.pinCode,
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'uId': uId,
      'email': email,
      'phone': phone,
      'pinCode': pinCode,
    };
  }

  factory NfcMessageModel.fromJson(Map<String, dynamic> map) {
    return NfcMessageModel(
      id: map['id'] as String,
      uId: map['uId'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      pinCode: map['pinCode'] as String,
    );
  }
  factory NfcMessageModel.fromNfcMessage(NfcMessage nfcMessage) {
    return NfcMessageModel(
      id: nfcMessage.id,
      uId: nfcMessage.uId,
      email: nfcMessage.email,
      phone: nfcMessage.phone,
      pinCode: nfcMessage.pinCode,
    );
  }
  factory NfcMessageModel.fromDecrypt(String data) {
    EncryptedBackend encryptedBackend = EncryptedBackendImpl();
    String decryptData = encryptedBackend.decrypted(data);
    Map<String, dynamic> map = json.decode(decryptData);
    return NfcMessageModel(
      id: map['id'] as String,
      uId: map['uId'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      pinCode: map['pinCode'] as String,
    );
  }
  String toDecrypt() {
    EncryptedBackend encryptedBackend = EncryptedBackendImpl();
    String ecryptData = encryptedBackend.encrypted(jsonEncode({
      'id': id,
      'uId': uId,
      'email': email,
      'phone': phone,
      'pinCode': pinCode,
    }));
    return ecryptData;
  }
}
