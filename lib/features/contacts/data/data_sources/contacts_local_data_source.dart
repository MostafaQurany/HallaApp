import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ContactsLocalDataSource {
  Future<void> addContact({
    required String userId,
    required Contact contactModel,
  });

  Future<void> addContactList({
    required String userId,
    required List<Contact> contactList,
  });

  Future<List<Contact>> getContactList({
    required String userId,
  });

  Future<void> deleteContact({
    required String userId,
    required String contactId,
  });
}

class ContactsLocalDataSourceImpl extends ContactsLocalDataSource {
  final Box<List<Contact>> _contactBox =
      Hive.box<List<Contact>>(AppConstants.contactBox);

  @override
  Future<void> addContact({
    required String userId,
    required Contact contactModel,
  }) async {
    try {
      var contactList = _contactBox.get(userId);
      contactList ??= [];
      if (contactList.any((c) => c.id == contactModel.id)) {
        throw ServerException('Contact already exists in local storage');
      }
      contactList.add(contactModel);
      _contactBox.put(userId, contactList);
    } catch (e) {
      throw ServerException('Failed to add contact to local storage');
    }
  }

  @override
  Future<void> addContactList({
    required String userId,
    required List<Contact> contactList,
  }) async {
    try {
      var contactListBox = _contactBox.get(userId);

      if (contactListBox == null ||
          contactListBox == [] ||
          contactListBox.isEmpty) {
        contactListBox = [];
      }
      for (var element in contactListBox) {
        if (contactListBox.any((c) => c.id != element.id)) {
          contactListBox.add(element);
        }
      }
      contactListBox.addAll(contactList);
      _contactBox.put(userId, contactListBox);
    } catch (e) {
      throw ServerException('Failed to add contact list to local storage');
    }
  }

  @override
  Future<void> deleteContact({
    required String userId,
    required String contactId,
  }) async {
    try {
      var contactListBox = _contactBox.get(userId);
      contactListBox ??= [];
      contactListBox.removeWhere(
        (element) {
          return element.id == contactId;
        },
      );
      _contactBox.put(userId, contactListBox);
    } catch (e) {
      throw ServerException('Failed to delete contact list from local storage');
    }
  }

  @override
  Future<List<Contact>> getContactList({
    required String userId,
  }) async {
    try {
      var contactList = _contactBox.get(userId);
      contactList ??= [];
      return contactList;
    } catch (e) {
      throw ServerException('Failed to get contact list from local storage');
    }
  }
}
