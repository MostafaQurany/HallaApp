import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/core/common/data/models/user_model.dart';
import 'package:hive/hive.dart';

abstract interface class LocalUserDataSource {
  Future<bool> isUserSavedLocal();
  Future<void> addUserToLocal(UserModel user);
  Future<UserModel> getUserFromLocal();
  Future<void> deleteUserFromLocal();
}

class LocalUserDataSourceImpl implements LocalUserDataSource {
  final String _boxName = AppConstants.userLocalBox;
  final String _keyName = AppConstants.userLocalKey;

  @override
  Future<void> addUserToLocal(UserModel user) async {
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
  Future<UserModel> getUserFromLocal() async {
    try {
      final box = await _getBoxContact();
      final UserModel user = box.get(_keyName)!;
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

  Future<Box<UserModel>> _getBoxContact() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<UserModel>(_boxName);
    } else {
      return await Hive.openBox<UserModel>(_boxName);
    }
  }
}
