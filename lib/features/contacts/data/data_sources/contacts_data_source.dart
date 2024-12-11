import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/common/domain/entities/contact_server.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';

abstract class ContactsDataSource {
  Future<Contact> addContact({
    required String userId,
    required String contactId,
  });

  Future<List<Contact>> addContactList({
    required String userId,
    required List<String> contactIdList,
  });

  Future<List<Contact>> getContactList({
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
  Future<Contact> addContact({
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
        if (contactList.any((contact) => contact['id'] == contactId)) {
          throw ServerException("User already exists.");
        }

        ContactServer contactServer = ContactServer(
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
              contactServer.toMap(),
            ],
          ),
        });
        return Contact.fromMap(snapshotContact.data()!);
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message?.toString() ?? "Something is wrong");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<Contact>> addContactList(
      {required String userId, required List<String> contactIdList}) async {
    try {
      List<Contact> contactListMy = [];
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
  Future<List<Contact>> getContactList({required String userId}) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshotUser = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get();
      if (snapshotUser.data() == null) {
        throw ServerException("Something is wrong");
      } else {
        List<Map<String, dynamic>> contactList =
            List<Map<String, dynamic>>.from(
                snapshotUser.data()?["contacts"] ?? []);
        List<ContactServer> contactServerList =
            contactList.map((e) => ContactServer.fromMap(e)).toList();
        List<Contact> contact = [];
        for (ContactServer contactServer in contactServerList) {
          contact.add(await _getContact(contactServer: contactServer));
        }
        return contact;
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message?.toString() ?? "Something is wrong");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Contact> _getContact({
    required ContactServer contactServer,
  }) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> snapshotUser = await _fireStore
          .collection(AppConstants.userCollection)
          .doc(contactServer.id)
          .get();
      if (snapshotUser.data() == null) {
        throw ServerException("Something is wrong");
      } else {
        Map<String, dynamic> map = snapshotUser.data()!;
        Contact contact = Contact.fromMap(map);
        contact.timestamp = contactServer.timestamp ?? Timestamp.now();
        contact.favoriteCategory = contactServer.favoriteCategories ?? '';
        return contact;
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message?.toString() ?? "Something is wrong");
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
