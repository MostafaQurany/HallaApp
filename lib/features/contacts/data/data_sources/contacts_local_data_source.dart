import 'package:flutter/foundation.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ContactsLocalDataSource {
  Future<ValueListenable<Box<Map>>> getContactModelBoxListenable();

  Future<void> addContact({
    required String userId,
    required ContactModel contactModel,
  });

  Future<void> addContactList({
    required String userId,
    required List<ContactModel> contactList,
  });

  Future<ContactModel> getContact({
    required String userId,
    required String contactId,
  });

  Future<List<ContactModel>> getContactList({
    required String userId,
  });

  Future<void> deleteContact({
    required String userId,
    required ContactModel contactModel,
  });
}

class ContactsLocalDataSourceImpl implements ContactsLocalDataSource {

  @override
  Future<void> addContact({
    required String userId,
    required ContactModel contactModel,
  }) async {
    try {
      final box = await _getBoxContact();
      Map<String, String>? contactMap = box.get(userId)?.cast<String, String>();

      if (contactMap != null) {
        contactMap[contactModel.idModel] = contactModel.toJson();
        await box.put(userId, contactMap);
      } else {
        final newContactMap = {contactModel.idModel: contactModel.toJson()};
        await box.put(userId, newContactMap);
      }

      print('Added/Updated contact: $contactMap');
    } catch (e) {
      print(e);
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addContactList({
    required String userId,
    required List<ContactModel> contactList,
  }) async {
    try {
      final box = await _getBoxContact();
      final contactMap = box.get(userId);
      if (contactMap != null) {
        for (final contact in contactList) {
          contactMap[contact.id] = contact.toJson();
        }
        await box.put(userId, contactMap);
      } else {
        Map<String, String> newContactMap = {};
        for (var element in contactList) {
          newContactMap[element.id] = element.toJson();
        }
        await box.put(userId, newContactMap);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteContact({
    required String userId,
    required ContactModel contactModel,
  }) async {
    try {
      final box = await _getBoxContact();
      final contactMap = box.get(userId);
      if (contactMap != null) {
        contactMap.remove(contactModel.id);
        await box.put(userId, contactMap);
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ContactModel> getContact({
    required String userId,
    required String contactId,
  }) async {
    try {
      final box = await _getBoxContact();
      final contactMap = box.get(userId);
      if (contactMap != null && contactMap[contactId] != null) {
        return ContactModel.fromJson(contactMap[contactId]!);
      } else {
        throw ServerException("Can't find the contact");
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ContactModel>> getContactList({
    required String userId,
  }) async {
    try {
      final box = await _getBoxContact();
      final contactMap = box.get(userId);
      if (contactMap != null) {
        List<ContactModel> contactModelList = [];
        box.get(userId);
        for (var k in contactMap.keys) {
          contactModelList.add(ContactModel.fromJson(contactMap[k]!));
        }
        return contactModelList;
      } else {
        Map<String, String> newContactMap = {};
        await box.put(userId, newContactMap);
        return [];
      }
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<ValueListenable<Box<Map>>> getContactModelBoxListenable() async {
    final box = await _getBoxContact();
    return box.listenable();
  }

  Future<Box<Map>> _getBoxContact() async {
    const String boxName = "contacts"; // Define box name
    if (Hive.isBoxOpen(boxName)) {
      return Hive.box<Map>(boxName);
    } else {
      return await Hive.openBox<Map>(boxName);
    }
  }
}
