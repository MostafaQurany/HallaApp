import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';
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
      await box.put(_keyName, user.toJson());
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
      final Map<dynamic, dynamic> rawMap = box.get(_keyName)!;
      final Map<String, dynamic> userMap = rawMap.map(
        (key, value) => MapEntry(key, value),
      );
      Map<dynamic, dynamic> soucialMapDynamic = userMap['socialMedia'];

      final Map<String, dynamic> soucialMap = soucialMapDynamic.map(
        (key, value) => MapEntry(key, value),
      );
      userMap["socialMedia"] = soucialMap;

      Map<dynamic, dynamic> companyMapDynamic = userMap['company'];

      final Map<String, dynamic> companyMap = companyMapDynamic.map(
        (key, value) => MapEntry(key, value),
      );
      userMap["company"] = companyMap;
      print(companyMap);
      print(soucialMap);

      return UserModel.fromJson(userMap);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<bool> isUserSavedLocal() async {
    try {
      final box = await _getBoxContact();
      if (box.get(_keyName) == null) {
        return false;
      } else if (box.get(_keyName)!.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Box<Map>> _getBoxContact() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<Map>(_boxName);
    } else {
      return await Hive.openBox<Map>(_boxName);
    }
  }
}
