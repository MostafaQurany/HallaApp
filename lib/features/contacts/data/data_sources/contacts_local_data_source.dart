import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ContactsLocalDataSource {
  Stream<BoxEvent> getContactModelBoxListenable(String userId);

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
    required String contactId,
  });
}

class ContactsLocalDataSourceNewImpl implements ContactsLocalDataSource {
  final Box<List<ContactModel>> _contactBox =
      Hive.box<List<ContactModel>>(AppConstants.contactBox);

  @override
  Future<void> addContact({
    required String userId,
    required ContactModel contactModel,
  }) async {
    try {
      List<ContactModel> contactList =
          _convertFromDynamicToContactModelList(userId);
      // ToDo: remove this comment that code to check if the contact is in the list
      // if (contactList.indexWhere(
      //         (element) => element.idModel == contactModel.idModel) !=
      //     -1) {
      //   throw ServerException("This contact is already added");
      // }
      contactList.add(contactModel);
      _contactBox.put(userId, contactList);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  List<ContactModel> _convertFromDynamicToContactModelList(String userId) {
    return _contactBox
            .get(userId)
            ?.map(
              (e) => e,
            )
            .toList() ??
        [];
  }

  @override
  Future<void> addContactList({
    required String userId,
    required List<ContactModel> contactList,
  }) async {
    try {
      List<ContactModel> contactsBoxList =
          _convertFromDynamicToContactModelList(userId);
      contactsBoxList = _mergeContacts(contactsBoxList, contactList);
      _contactBox.put(userId, contactsBoxList);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  List<ContactModel> _mergeContacts(
      List<ContactModel> list1, List<ContactModel> list2) {
    final Set<ContactModel> set1 = list1.toSet();
    final Set<ContactModel> set2 = list2.toSet();
    return set1.union(set2).toList();
  }

  @override
  Future<void> deleteContact({
    required String userId,
    required String contactId,
  }) async {
    try {
      List<ContactModel> contactList =
          _convertFromDynamicToContactModelList(userId);
      final int index = contactList.indexWhere(
        (element) => element.idModel == contactId,
      );
      contactList.removeAt(index);
      _contactBox.put(userId, contactList);
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
      List<ContactModel> contactList =
          _convertFromDynamicToContactModelList(userId);
      return contactList.where((element) => element.idModel == contactId).first;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ContactModel>> getContactList({required String userId}) async {
    try {
      List<ContactModel> contactList =
          _contactBox.get(userId) as List<ContactModel> ?? <ContactModel>[];
      return contactList;
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Stream<BoxEvent> getContactModelBoxListenable(String userId) {
    try {
      return _contactBox.watch(key: userId);
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
