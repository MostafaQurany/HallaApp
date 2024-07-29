import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/data_sources/contacts_local_data_source.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';

abstract class ContactsDataSource {
  Future<void> addContactModel({
    required String userId,
    required ContactModel contactModel,
  });
}

class ContactsDataSourceImpl implements ContactsDataSource {
  ContactsLocalDataSource contactsLocalDataSource =
      ContactsLocalDataSourceImpl();
  final String _userCollection = AppConstants.userCollection;
  final _firestore = FirebaseFirestore.instance;
  
  @override
  Future<void> addContactModel({
    required String userId,
    required ContactModel contactModel,
  }) async {
    try {
      await _firestore.collection(_userCollection).doc(userId).set({
        "contactList": FieldValue.arrayUnion([
          {
            'id': contactModel.id,
            'time': Timestamp.now(),
          }
        ])
      });
      contactsLocalDataSource.addContactModel(
        userId: userId,
        contactModel: contactModel,
      );
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }
}
