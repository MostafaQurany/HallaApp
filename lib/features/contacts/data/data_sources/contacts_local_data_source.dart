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

  Future<List<String>> addIdToOfflineList({
    required String userId,
    required String contactId,
  });

  Future<List<String>> getIdFromOfflineList({
    required String userId,
  });

  Future<void> clearOfflineContact({
    required String userId,
  });
}

class ContactsLocalDataSourceImpl extends ContactsLocalDataSource {
  Future<Box<List>> get _contactBox async =>
      await Hive.openBox(AppConstants.contactBox);

  Future<Box<List>> get _contactOfflineBox async =>
      await Hive.openBox(AppConstants.contactOfflineBox);

  @override
  Future<void> addContact({
    required String userId,
    required Contact contactModel,
  }) async {
    try {
      Box<List> contactBox = await _contactBox;
      List<Contact> contactList = contactBox.get(userId)?.cast<Contact>() ?? [];
      if (contactList.any((c) => c.id == contactModel.id)) {
        throw ServerException('Contact already exists in local storage');
      }
      contactList.add(contactModel);
      await contactBox.put(userId, contactList);
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
      Box<List> contactBox = await _contactBox;
      List<Contact> contactListBox =
          contactBox.get(userId)?.cast<Contact>() ?? [];
      for (var element in contactList) {
        if (contactListBox.any((c) => c.id != element.id)) {
          contactListBox.add(element);
        }
      }
      contactBox.put(userId, contactListBox);
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
      Box<List> contactBox = await _contactBox;
      contactBox.put(userId, contactList);
    } catch (e) {
      print(e);
      throw ServerException('Failed to sync contact to local storage');
    }
  }

  @override
  Future<void> deleteContact({
    required String userId,
    required String contactId,
  }) async {
    try {
      Box<List> contactBox = await _contactBox;
      List<Contact> contactList = contactBox.get(userId)?.cast<Contact>() ?? [];
      contactList.removeWhere(
        (element) {
          return element.id == contactId;
        },
      );
      contactBox.put(userId, contactList);
    } catch (e) {
      throw ServerException('Failed to delete contact list from local storage');
    }
  }

  @override
  Future<List<Contact>> getContactList({
    required String userId,
  }) async {
    try {
      Box<List> contactBox = await _contactBox;
      List<Contact> contactList = contactBox.get(userId)?.cast<Contact>() ?? [];
      return contactList;
    } catch (e) {
      print(e);
      throw ServerException('Failed to get contact list from local storage');
    }
  }

  List<Contact> _convertFromMapToContact(
      List<Map<String, dynamic>> contactListMap) {
    return contactListMap.map(
      (e) {
        return Contact.fromMap(e);
      },
    ).toList();
  }

  List<Map<String, dynamic>> _convertFromContactToMap(
      List<Contact> contactList) {
    return contactList.map(
      (e) {
        return e.toMap();
      },
    ).toList();
  }

  List<Map<String, dynamic>> _convertToMap(List<Contact> contactList) {
    return contactList.map((e) => e.toMap()).toList();
  }

  @override
  Future<List<String>> addIdToOfflineList(
      {required String userId, required String contactId}) async {
    try {
      Box<List> contactBox = await _contactOfflineBox;
      List<String> contactIdList = contactBox.get(userId)?.cast<String>() ?? [];
      contactIdList.toSet();
      contactIdList.add(contactId);
      contactIdList.toList();
      contactBox.put(userId, contactIdList);
      return contactIdList;
    } catch (e) {
      print(e);
      throw ServerException('Failed to add contact offline');
    }
  }

  @override
  Future<List<String>> getIdFromOfflineList({required String userId}) async {
    try {
      Box<List> contactBox = await _contactOfflineBox;
      List<String> contactIdList = contactBox.get(userId)?.cast<String>() ?? [];
      return contactIdList;
    } catch (e) {
      print(e);
      throw ServerException('Failed to get contact offline');
    }
  }

  @override
  Future<void> clearOfflineContact({required String userId}) async {
    try {
      Box<List> contactBox = await _contactOfflineBox;
      contactBox.put(userId, []);
    } catch (e) {
      print(e);
      throw ServerException('Failed to clear contact offline');
    }
  }
}
