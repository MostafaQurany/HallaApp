import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:hive/hive.dart';

abstract interface class LocalUserDataSource {
  Future<bool> isUserSavedLocal();
  Future<void> addUserToLocal(User user);
  Future<User> getUserFromLocal();
  Future<void> deleteUserFromLocal();
}

class LocalUserDataSourceImpl implements LocalUserDataSource {
  final String _boxName = AppConstants.userLocalBox;
  final String _keyName = AppConstants.userLocalKey;

  @override
  Future<void> addUserToLocal(User user) async {
    try {
      final box = await _getBoxContact();
      await box.put(_keyName, user);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteUserFromLocal() async {
    try {
      final box = await _getBoxContact();
      await box.delete(_keyName);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<User> getUserFromLocal() async {
    try {
      final box = await _getBoxContact();
      final User user = box.get(_keyName)!;
      return user;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<bool> isUserSavedLocal() async {
    try {
      final box = await _getBoxContact();
      if (box.get(_keyName) != null) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Box<User>> _getBoxContact() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<User>(_boxName);
    } else {
      return await Hive.openBox<User>(_boxName);
    }
  }
}
