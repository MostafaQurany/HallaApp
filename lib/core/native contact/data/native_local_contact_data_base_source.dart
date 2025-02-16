import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as mobile_contact;
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';

abstract interface class NativeLocalContactDataBaseSource {
  Future<List<Contact>> getFirstTimeLocalContacts();

  Future<void> addToLocalContacts(Contact contact);

  Future<List<Contact>> getLocalContacts();

  Future<void> addLocalContactToServer(Contact contact);
}

class NativeLocalContactDataBaseSourceImpl
    extends NativeLocalContactDataBaseSource {
  final _fireStore = FirebaseFirestore.instance;

  // get local contact that mach with the firestore
  @override
  Future<List<Contact>> getFirstTimeLocalContacts() async {
    try {
      // get the number
      Map<String, Set<String>> localContat = await _getLocalContacts();
      if (localContat.isEmpty) {
        return [];
      }
      // search for the use that has his numbers
      return await _getMuchContacts(localContat);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // get the local contact
  Future<Map<String, Set<String>>> _getLocalContacts() async {
    try {
      if (await mobile_contact.FlutterContacts.requestPermission()) {
        List<mobile_contact.Contact> contacts =
            await mobile_contact.FlutterContacts.getContacts(
                withProperties: true, withPhoto: true);

        Map<String, Set<String>> mapSet = {};

        contacts
            .map(
              (e) => e.displayName.replaceAll(' ', ''),
            )
            .toSet();

        for (var i = 0; i < contacts.length; i++) {
          if (contacts[i].phones.isNotEmpty) {
            if (mapSet[contacts[i].displayName] == null) {
              mapSet[contacts[i].displayName] = {};
              String newContact =
                  contacts[i].phones[0].number.replaceFirst('+2', '');
              newContact = newContact.replaceAll(' ', '');
              mapSet[contacts[i].displayName]!.add(newContact);
            } else {
              String newContact =
                  contacts[i].phones[0].number.replaceFirst('+2', '');
              newContact = newContact.replaceAll(' ', '');
              mapSet[contacts[i].displayName]!.add(newContact);
            }
          }
        }
        return mapSet;
      }
      return {};
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  // get much contact information
  Future<List<Contact>> _getMuchContacts(
      Map<String, Set<String>> localContat) async {
    try {
      List<Contact> contactList = [];
      QuerySnapshot<Map<String, dynamic>> allSnapShots =
          await _fireStore.collection(AppConstants.userCollection).get();
      List<DocumentSnapshot> documents = allSnapShots.docs;
      for (var document in documents) {
        final Map<String, dynamic> data =
            document.data() as Map<String, dynamic>;

        final List<String> phonesField =
            List<String>.from(data['phones'] ?? []);
        if (phonesField.isNotEmpty) {
          for (var key in localContat.keys) {
            for (var phone in localContat[key]!) {
              if (phonesField.contains(phone)) {
                Contact contact = Contact.fromMap(data);
                contactList.add(contact);
              }
            }
          }
        }
      }
      return contactList;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      print(e.toString());
      throw ServerException(e.toString());
    }
  }

  // add contact to the local device
  @override
  Future<void> addToLocalContacts(Contact contact) async {
    try {
      if (contact.phones.isEmpty || contact.primePhone.isEmpty) {
        throw "Contact hasn't phone number.";
      }

      String res = await _checkContactSaved(contact);
      if (res.isNotEmpty) {
        throw "Contact is already saved as $res.";
      }
      await mobile_contact.FlutterContacts.insertContact(
        mobile_contact.Contact(
          displayName:
              contact.fullName.isEmpty ? contact.email : contact.fullName,
          phones: [
            if (contact.primePhone.isNotEmpty)
              mobile_contact.Phone(contact.primePhone),
            if (contact.phones.isNotEmpty)
              ...contact.phones.map(
                (e) => mobile_contact.Phone(e),
              ),
          ],
        ),
      );
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String> _checkContactSaved(Contact contact) async {
    try {
      if (await mobile_contact.FlutterContacts.requestPermission()) {
        List<mobile_contact.Contact> contacts =
            await mobile_contact.FlutterContacts.getContacts(
                withProperties: true, withPhoto: true);
        String isFind = '';
        for (var i = 0; i < contacts.length; i++) {
          for (var j = 0; j < contacts[i].phones.length; j++) {
            if (contacts[i].phones[j].number == contact.primePhone) {
              isFind = contacts[i].displayName;
              break;
            }
            for (var x = 0; x < contact.phones.length; x++) {
              if (contacts[i].phones[j].number == contact.phones[x]) {
                isFind = contacts[i].displayName;
                break;
              }
            }
          }
        }
        return isFind;
      }
      return '';
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<Contact>> getLocalContacts() async {
    try {
      if (await mobile_contact.FlutterContacts.requestPermission()) {
        List<mobile_contact.Contact> localContacts =
            await mobile_contact.FlutterContacts.getContacts(
          withProperties: true,
          withPhoto: true,
          withAccounts: true,
        );

        return localContacts.map((e) => Contact.fromMobileContact(e)).toList();
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> addLocalContactToServer(Contact contact) async {
    try {
      await _fireStore
          .collection(AppConstants.unActiveUserCollection)
          .doc(contact.id)
          .set(contact.toMap());
    } catch (e) {
      throw e.toString();
    }
  }
}
