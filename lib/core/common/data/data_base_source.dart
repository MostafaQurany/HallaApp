import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/domain/entities/guest.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';

abstract interface class DataBaseSource {
  // user
  Future<bool> isUserExit(User user);

  Future<User> uploadUser(User user);

  Future<User> getUser(String userId);

  // guest
  Future<Guest> logInGuest();

  Future<Guest?> getGuest();

  Future<void> forgetGuestPinCode();

}

class DataBaseSourceImpl implements DataBaseSource {
  final String _userCollection = AppConstants.userCollection;
  final _fireStore = FirebaseFirestore.instance;

  // user
  @override
  Future<User> uploadUser(User user) async {
    try {
      if (!await _userExists(user.id)) {
        await _fireStore
            .collection(_userCollection)
            .doc(user.id)
            .set(user.toMap());
      } else {
        await _fireStore
            .collection(_userCollection)
            .doc(user.id)
            .update(user.toMap());
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
          await _fireStore.collection(_userCollection).doc(userId).get();
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
  Future<User> getUser(String userId) async {
    final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await _fireStore.collection(_userCollection).doc(userId).get();
    return User.fromMap(documentSnapshot.data()!);
  }

  @override
  Future<bool> isUserExit(User user) async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _fireStore.collection(_userCollection).doc(user.id).get();

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
  Future<Guest> logInGuest() async {
    return await getGuest().then(
      (guest) async {
        if (guest == null) {
          Guest guest = Guest(
            idGuest: await AppConstants.getGuestId(),
            fullNameGuest: "Guest",
            pinCodeGuest: AppConstants.generatePinCode(),
          );
          await _fireStore
              .collection(_userCollection)
              .doc(await AppConstants.getGuestId())
              .set(
                guest.toMap(),
              );
          return guest;
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
  Future<Guest?> getGuest() async {
    try {
      final DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
          await _fireStore
              .collection(_userCollection)
              .doc(await AppConstants.getGuestId())
              .get();
      if (documentSnapshot.exists) {
        return Guest.fromMap(documentSnapshot.data()!);
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
      await _fireStore
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
