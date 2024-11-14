import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/data/models/guest_model.dart';
import 'package:halla/core/common/data/models/user_model.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';

abstract interface class DataBaseSource {
  // user
  Future<bool> isUserExit(UserModel user);

  Future<UserModel> uploadUser(UserModel user);

  Future<UserModel> getUser(String userId);

  // guest
  Future<GuestModel> logInGuest();

  Future<GuestModel?> getGuest();

  Future<void> forgetGuestPinCode();
}

class DataBaseSourceImpl implements DataBaseSource {
  final String _userCollection = AppConstants.userCollection;
  final _firestore = FirebaseFirestore.instance;

  // user
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
      final usern = await getUser(user.id);
      return usern;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<bool> _userExists(String userId) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
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
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
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

  // guest

  @override
  Future<GuestModel> logInGuest() async {
    return await getGuest().then(
      (guest) async {
        if (guest == null) {
          GuestModel guestModel = GuestModel(
            idGuestModel: await AppConstants.getGuestId(),
            fullNameGuestModel: "Guest",
            pinCodeGuestModel: AppConstants.generatePinCode(),
          );
          await _firestore
              .collection(_userCollection)
              .doc(await AppConstants.getGuestId())
              .set(
                guestModel.toMap(),
              );
          return guestModel;
        } else {
          return guest;
        }
      },
    ).onError(
      (error, stackTrace) {
        throw ServerException(error.toString());
      },
    );
  }

  @override
  Future<GuestModel?> getGuest() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _firestore
              .collection(_userCollection)
              .doc(await AppConstants.getGuestId())
              .get();
      if (documentSnapshot.exists) {
        return GuestModel.fromMap(documentSnapshot.data()!);
      } else {
        return null;
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> forgetGuestPinCode() async {
    try {
      await _firestore
          .collection(_userCollection)
          .doc(await AppConstants.getGuestId())
          .delete();
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
