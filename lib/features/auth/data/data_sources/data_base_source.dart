import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class DataBaseSource {
  Future<UserModel> uploadUser(UserModel user);
  Future<UserModel> getUser(UserModel user);
}

class DataBaseSourceImpl implements DataBaseSource {
  final String _userCollection = 'users';
  final String _contactListCollection = 'contactList';
  final String _guestCollection = 'guest';
  final _firestore = FirebaseFirestore.instance;

  @override
  Future<UserModel> uploadUser(UserModel user) async {
    try {
      if (!await _userExists(user.id)) {
        await _firestore
            .collection(_userCollection)
            .doc(user.id)
            .set(user.toJson());
      } else {
        await _firestore
            .collection(_userCollection)
            .doc(user.id)
            .update(user.toJson());
      }
      return await getUser(user);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<bool> _userExists(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;
      if (userId.contains('guest')) {
        documentSnapshot =
            await _firestore.collection(_guestCollection).doc(userId).get();
      } else {
        documentSnapshot =
            await _firestore.collection(_userCollection).doc(userId).get();
      }
      if (documentSnapshot.exists) {
        return true;
      } else {
        return false;
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel> getUser(UserModel user) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _firestore.collection(_userCollection).doc(user.id).get();
    return UserModel.fromJson(documentSnapshot.data()!);
  }
}
