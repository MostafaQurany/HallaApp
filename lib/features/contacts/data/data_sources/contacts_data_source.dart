import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/data_sources/contacts_local_data_source.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';

abstract class ContactsDataSource {
  Future<void> addContact({
    required String userId,
    required String contactId,
  });

  Future<void> addContactList({
    required String userId,
    required List<String> contactIdList,
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

class ContactsDataSourceImpl implements ContactsDataSource {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final ContactsLocalDataSourceImpl _localDataSource =
      ContactsLocalDataSourceImpl();

  @override
  Future<void> addContact({
    required String userId,
    required String contactId,
  }) async {
    try {
      Map<String, dynamic> contactMap = await _firestore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get(const GetOptions(
            source: Source.serverAndCache,
          ))
          .then(
        (DocumentSnapshot<Map<String, dynamic>> value) {
          print(value.data());
          return value.data()!['contacts'] ?? {};
        },
      );
      if (contactMap.containsKey(contactId)) {
        throw ServerException("User is Exsit.");
      }
      contactMap[contactId] = Timestamp.now();
      await _firestore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .update({
        'contacts': contactMap,
      });
      ContactModel contactModel = await getContact(
        userId: userId,
        contactId: contactId,
      );

      await _localDataSource.addContact(
        userId: userId,
        contactModel: contactModel,
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> addContactList({
    required String userId,
    required List<String> contactIdList,
  }) async {
    final contactMapList = contactIdList
        .map((id) => {
              'id': id,
              'time': FieldValue.serverTimestamp(),
            })
        .toList();
    try {
      await _firestore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .update({
        'contacts': FieldValue.arrayUnion(contactMapList),
      });

      List<ContactModel> contactModelList =
          await getContactList(userId: userId);

      await _localDataSource.addContactList(
          userId: userId, contactList: contactModelList);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
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
      Map<String, dynamic> userContact = await _firestore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get()
          .then(
            (value) => value.data()!['contacts'] ?? {},
          );

      if (userContact.containsKey(contactId)) {
        final contactModel =
            await _getContactModel(contactId, userContact[contactId]);
        return contactModel;
      } else {
        throw ServerException("No Contact");
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  @override
  Future<List<ContactModel>> getContactList({
    required String userId,
  }) async {
    try {
      final contactList = await _firestore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get()
          .then((doc) => doc.get('contacts'));

      final contactModelList = await contactList
          .map((Map<String, dynamic> contactMap) async =>
              await _getContactModel(contactMap['id'], Timestamp.now()))
          .toList();

      return contactModelList;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<ContactModel> _getContactModel(
    String contactId,
    Timestamp timestamp,
  ) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> contactDocumentSnapshot =
          await _firestore
              .collection(AppConstants.userCollection)
              .doc(contactId)
              .get();
      if (contactDocumentSnapshot.data() != null) {
        Map<String, dynamic> map = contactDocumentSnapshot.data()!;
        map["addTime"] = timestamp;
        ContactModel contactModel = ContactModel.fromMap(map);
        return contactModel;
      } else {
        throw ServerException("No Contact");
      }
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      print(e);
      throw ServerException(e.toString());
    }
  }

  @override
  Future<void> deleteContact({
    required String userId,
    required ContactModel contactModel,
  }) async {
    try {
      await _firestore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .update({
        'contacts': FieldValue.arrayRemove([
          {'id': contactModel.id, 'time': FieldValue.serverTimestamp()},
        ]),
      });

      await _localDataSource.deleteContact(
          userId: userId, contactModel: contactModel);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
