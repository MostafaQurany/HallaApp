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

  Future<void> contactSync({
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
  Future<void> contactSync({
    required String userId,
    required List<Contact> contactList,
  }) async {
    try {
      Box<List<Map>> contactBox = await Hive.openBox('Ccontacts');
      List<Map> contactListMap = contactList
          .map(
            (e) => e.toMap(),
          )
          .toList();

      contactBox.put(userId, contactListMap);
    } catch (e) {
      throw ServerException('Failed to sync contact to local storage');
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
      Box<List<Map>> contactBox = await Hive.openBox('Ccontacts');
      var contactListMap = contactBox.get(userId, defaultValue: []) ?? [];
      List<Contact> contactList = contactListMap
          .map((item) => Contact.fromMap(item.map(
                (key, value) => MapEntry(key as String, value),
              )))
          .toList();
      print(contactBox.values);
      return contactList;
      /*
     //await _contactBox.clear();
      final rawData2 = _contactBox.get(userId);
      print('Raw Data: $rawData2');
      final dynamic rawData = _contactBox.get(userId);

      if (rawData is List<Contact>) {
        return rawData; // If it's already the correct type
      } else if (rawData is List<dynamic>) {
        // Map dynamic items to Contact
        return rawData.map((item) => item as Contact).toList();
      } else {
        return []; // Return an empty list if the data is invalid
      } */
    } catch (e) {
      print(e);
      throw ServerException('Failed to get contact list from local storage');
    }
  }
}
