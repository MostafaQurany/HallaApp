import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';

abstract class ProfileDataSource {
  Future<String> getImage(String userId);
  Future<String> setImage({required String userId, required File image});
}

class ProfileDataSourceImpl implements ProfileDataSource {
  final FirebaseStorage _storage = FirebaseStorage.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final String _userCollection = AppConstants.userCollection;
  String _fileName(String userId) => 'profile_images/$userId.png';
  @override
  Future<String> getImage(String userId) async {
    try {
      return await _firestore
          .collection(_userCollection)
          .doc(userId)
          .get()
          .then(
        (DocumentSnapshot<Map<String, dynamic>> value) async {
          if (value.exists) {
            return value.data()!["imageUrl"];
          } else {
            return "";
          }
        },
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<String> setImage({required String userId, required File image}) async {
    try {
      Reference ref = _storage.ref().child(_fileName(userId));
      await ref.putFile(image);
      String downloadURL = await ref.getDownloadURL();
      await _firestore.collection(_userCollection).doc(userId).update({
        "imageUrl": downloadURL,
      });
      return downloadURL;
    } on FirebaseException catch (e) {
      throw ServerException(e.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
