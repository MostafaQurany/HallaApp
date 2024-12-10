import 'dart:convert';

import 'package:halla/core/utils/encryption.dart';

class NfcMessage {
  final String id;
  final String uId;
  final String email;
  final String phone;
  final String pinCode;

  NfcMessage({
    required this.id,
    required this.uId,
    required this.email,
    required this.phone,
    required this.pinCode,
  });

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'uId': uId,
      'email': email,
      'phone': phone,
      'pinCode': pinCode,
    };
  }

  factory NfcMessage.fromJson(Map<String, dynamic> map) {
    return NfcMessage(
      id: map['id'] as String,
      uId: map['uId'] as String,
      email: map['email'] as String,
      phone: map['phone'] as String,
      pinCode: map['pinCode'] as String,
    );
  }
  factory NfcMessage.fromNfcMessage(NfcMessage nfcMessage) {
    return NfcMessage(
      id: nfcMessage.id,
      uId: nfcMessage.uId,
      email: nfcMessage.email,
      phone: nfcMessage.phone,
      pinCode: nfcMessage.pinCode,
    );
  }
  factory NfcMessage.fromDecrypt(String data) {
    EncryptedBackend encryptedBackend = EncryptedBackendImpl();
    String decryptData = encryptedBackend.decrypted(data);
    Map<String, dynamic> map = json.decode(decryptData);
    return NfcMessage(
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

  @override
  String toString() {
    return 'NfcMessage(id: $id, uId: $uId, email: $email, phone: $phone, pinCode: $pinCode)';
  }
}
