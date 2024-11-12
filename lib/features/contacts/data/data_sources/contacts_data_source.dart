import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:halla/features/contacts/data/models/contact_model_server.dart';

abstract class ContactsDataSource {
  Future<ContactModel> addContact({
    required String userId,
    required String contactId,
  });

  Future<List<ContactModel>> addContactList({
    required String userId,
    required List<String> contactIdList,
  });

  Future<List<ContactModel>> getContactList({
    required String userId,
  });

  Future<void> deleteContact({
    required String userId,
    required String contactId,
  });
}

class ContactsDataSourceNewImpl implements ContactsDataSource {
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Future<ContactModel> addContact({
    required String userId,
    required String contactId,
  }) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshotUser = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get();
      DocumentSnapshot<Map<String, dynamic>> snapshotContact = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(contactId)
          .get();
      if (snapshotUser.data() == null || snapshotContact.data() == null) {
        throw ServerException("Something is wrong");
      } else {
        List<Map<String, dynamic>> contactList =
            List.from(snapshotUser.data()?["contacts"] ?? []);
        // ToDo: remove this comment to add the check if the user is existing
        // if (contactList.any((contact) => contact['id'] == contactId)) {
        //   throw ServerException("User already exists.");
        // }

        ContactModelServer contactModelServer = ContactModelServer(
          id: snapshotContact.data()!['id'],
          timestamp: Timestamp.now(),
          favoriteCategories: '',
        );
        await _fireStore
            .collection(AppConstants.userCollection)
            .doc(userId)
            .update({
          'contacts': FieldValue.arrayUnion(
            [
              contactModelServer.toMap(),
            ],
          ),
        });
        return ContactModel.fromMap(snapshotContact.data()!);
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message?.toString() ?? "Something is wrong");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ContactModel>> addContactList(
      {required String userId, required List<String> contactIdList}) async {
    try {
      List<ContactModel> contactListMy = [];
      for (String contactId in contactIdList) {
        contactListMy
            .add(await addContact(userId: userId, contactId: contactId));
      }
      return contactListMy;
    } on FirebaseException catch (e) {
      throw ServerException(e.message?.toString() ?? "Something is wrong");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteContact({
    required String userId,
    required String contactId,
  }) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshotUser = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get();
      if (snapshotUser.data() == null) {
        throw ServerException("Something is wrong");
      } else {
        List<Map<String, dynamic>> contactList =
            snapshotUser.data()?["contacts"] ?? [];
        int index =
            contactList.indexWhere((contact) => contact['id'] == contactId);
        if (index == -1) {
          throw ServerException("User isn't exists.");
        }
        contactList.removeAt(index);
        await _fireStore
            .collection(AppConstants.userCollection)
            .doc(userId)
            .update({
          'contacts': contactList,
        });
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message?.toString() ?? "Something is wrong");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ContactModel>> getContactList({required String userId}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshotUser = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get();
      if (snapshotUser.data() == null) {
        throw ServerException("Something is wrong");
      } else {
        List<Map<String, dynamic>> contactList =
            snapshotUser.data()?["contacts"] ?? [];
        List<ContactModelServer> contactModelServerList =
            contactList.map((e) => ContactModelServer.fromMap(e)).toList();
        List<ContactModel> contactModel = [];
        for (ContactModelServer contactModelServer in contactModelServerList) {
          if (await _getContactModel(contactModelServer: contactModelServer) ==
              null) {
            continue;
          }
          contactModel.add(
              await _getContactModel(contactModelServer: contactModelServer));
        }
        return contactModel;
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message?.toString() ?? "Something is wrong");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<ContactModel> _getContactModel({
    required ContactModelServer contactModelServer,
  }) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshotUser = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(contactModelServer.id)
          .get();
      if (snapshotUser.data() == null) {
        throw ServerException("Something is wrong");
      } else {
        Map<String, dynamic> map = snapshotUser.data()!;
        ContactModel contactModel = ContactModel.fromMap(map);
        contactModel.addTimeModel =
            contactModelServer.timestamp ?? Timestamp.now();
        contactModel.favoriteCategoryModel =
            contactModelServer.favoriteCategories ?? '';
        return contactModel;
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message?.toString() ?? "Something is wrong");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
