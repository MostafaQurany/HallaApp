import 'package:halla/core/common/data/models/guest_model.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/core/common/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

abstract interface class DataBaseSource {
  Future<bool> isUserExit(UserModel user);
  Future<UserModel> uploadUser(UserModel user);
  Future<UserModel> getUser(String userId);

  Future<GuestModel> logInGuest();
  Future<bool> isGuestExit();
  Future<GuestModel> getGuest();
  Future<bool> isGuestUpdate();
}

class DataBaseSourceImpl implements DataBaseSource {
  final String _userCollection = AppConstants.userCollection;
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
      return await getUser(user.id);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<bool> _userExists(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;

      documentSnapshot =
          await _firestore.collection(_userCollection).doc(userId).get();
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
  Future<UserModel> getUser(String userId) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _firestore.collection(_userCollection).doc(userId).get();
    return UserModel.fromJson(documentSnapshot.data()!);
  }

  @override
  Future<bool> isUserExit(UserModel user) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;

      documentSnapshot =
          await _firestore.collection(_userCollection).doc(user.id).get();

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
  Future<bool> isGuestExit() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot;
      documentSnapshot = await _firestore
          .collection(_userCollection)
          .doc(await AppConstants.getGuestId())
          .get();

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
  Future<GuestModel> logInGuest() async {
    try {
      if (await isGuestExit()) {
        return getGuest();
      } else {
        GuestModel guestModel = GuestModel(
          idGuest: await AppConstants.getGuestId(),
          fullNameGuest: "Guest",
          pinCodeGuest: AppConstants.generatePinCode(),
        );
        await _firestore
            .collection(_userCollection)
            .doc(await AppConstants.getGuestId())
            .set(
              guestModel.toMap(),
            );
        return getGuest();
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<GuestModel> getGuest() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _firestore
              .collection(_userCollection)
              .doc(await AppConstants.getGuestId())
              .get();
      print(documentSnapshot.data()!);
      return GuestModel.fromMap(documentSnapshot.data()!);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<bool> isGuestUpdate() async {
    try {
      GuestModel guestModel = await getGuest();
      return guestModel.isUpGraded;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
