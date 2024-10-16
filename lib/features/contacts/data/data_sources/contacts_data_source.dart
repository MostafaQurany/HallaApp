import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/data_sources/contacts_local_data_source.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:halla/features/contacts/data/models/contact_model_server.dart';

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
  final ContactsLocalDataSource _localDataSource =
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
    try {
      await _firestore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .update({
        'contacts': FieldValue.arrayUnion(
          contactIdList
              .map( 
                (id) => ContactModelServer(
                  id: id,
                  timestamp: Timestamp.now(),
                  favoriteCategories: '',
                ).toMap(),
              )
              .toList(),
        ),
      });
      List<ContactModel> contactModelList =
          await getContactList(userId: userId);
      print(contactModelList.length);
      await _localDataSource.addContactList(
        userId: userId,
        contactList: contactModelList,
      );
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
        final contactModel = await _getContactModel(
            ContactModelServer.fromMap(userContact[contactId]));
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
      final List<Map<String, dynamic>> contactList = await _firestore
          .collection(AppConstants.userCollection)
          .doc(userId)
          .get()
          .then((doc) => doc.data()?["contacts"]);

      final List<ContactModelServer> contactListServer = contactList
          .map(
            (e) => ContactModelServer.fromMap(e),
          )
          .toList();

      final List<ContactModel> contactModelList = [];
      for (var contactServer in contactListServer) {
        contactModelList.add(await _getContactModel(contactServer));
      }

      return contactModelList;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<ContactModel> _getContactModel(
      ContactModelServer contactModelServer) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> contactDocumentSnapshot =
          await _firestore
              .collection(AppConstants.userCollection)
              .doc(contactModelServer.id)
              .get();
      if (contactDocumentSnapshot.data() != null) {
        Map<String, dynamic> map = contactDocumentSnapshot.data()!;
        ContactModel contactModel = ContactModel.fromMap(map);
        contactModel.addTimeModel = contactModelServer.timestamp;
        contactModel.favoriteCategoryModel =
            contactModelServer.favoriteCategories;
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
          {
            'id': contactModel.id,
            'time': FieldValue.serverTimestamp(),
          },
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
