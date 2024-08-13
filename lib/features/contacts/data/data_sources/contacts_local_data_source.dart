import 'package:flutter/foundation.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ContactsLocalDataSource {
  Future<ValueListenable<Box<Map>>>
      getContactModelBoxListenable();

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
  final String _boxName = AppConstants.contactBox;

  @override
  Future<void> addContact({
    required String userId,
    required ContactModel contactModel,
  }) async {
    try {
      final box = await _getBoxContact();
      final contactMap = box.get(userId);
      print(contactMap);
      if (contactMap != null) {
        contactMap[contactModel.id] = contactModel.toJsonHive();
        await box.put(userId, contactMap);
      } else {
        final newContactMap = {contactModel.id: contactModel.toJsonHive()};
        await box.put(userId, newContactMap);
      }
      print(contactMap);
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
          contactMap[contact.id] = contact.toJsonHive();
        }
        await box.put(userId, contactMap);
      } else {
        Map<String, String> newContactMap = {};
        for (var element in contactList) {
          newContactMap[element.id] = element.toJsonHive();
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
        return ContactModel.fromJsonHive(contactMap[contactId]!);
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
        for (var k in contactMap.keys) {
          contactModelList.add(ContactModel.fromJsonHive(contactMap[k]!));
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
  Future<ValueListenable<Box<Map>>>
      getContactModelBoxListenable() async {
    final box = await _getBoxContact();
    return box.listenable();
  }

  Future<Box<Map>> _getBoxContact() async {
    if (Hive.isBoxOpen(_boxName)) {
      return Hive.box<Map>(_boxName);
    } else {
      return await Hive.openBox<Map>(_boxName);
    }
  }
}
