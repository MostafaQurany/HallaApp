import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/models/contact_adapter.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ContactsLocalDataSource {
  Future<void> addContactModel({
    required String userId,
    required ContactModel contactModel,
  });
}

class ContactsLocalDataSourceImpl implements ContactsLocalDataSource {
  @override
  Future<void> addContactModel({
    required String userId,
    required ContactModel contactModel,
  }) async {
    try {
      Box myBox = await _openBox(userId);
      myBox.put(
        contactModel.id,
        ContactAdapter.fromContact(contactModel),
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Box> _openBox(String userId) async {
    return await Hive.openBox<ContactAdapterA>(AppConstants.boxName);
  }
}
