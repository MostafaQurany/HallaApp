import 'package:encrypt/encrypt.dart';

abstract interface class EncryptedBackend {
  String encrypted(String plainText);
  String decrypted(String encrypted);
}

class EncryptedBackendImpl implements EncryptedBackend {
  late Key _key;
  late IV _iv;
  late Encrypter _encrypter;

  _encryptSittings() {
    _key = Key.fromBase16(
        '50317f6ee5969493675230b137b5d4dfe2fb0f50cd2dc1a243365bf47ca38fb1');
    _iv = IV.fromBase16('5297970dfe6738835cf36082ab2ec6e5');
    _encrypter = Encrypter(AES(_key));
  }

  @override
  String encrypted(String plainText) {
    _encryptSittings();
    final encrypted = _encrypter.encrypt(plainText, iv: _iv);
    return encrypted.base16;
  }

  @override
  String decrypted(String encrypted) {
    _encryptSittings();
    final decrypted = _encrypter.decrypt(
      Encrypted.fromBase16(
        encrypted,
      ),
      iv: _iv,
    );
    return decrypted;
  }
}
