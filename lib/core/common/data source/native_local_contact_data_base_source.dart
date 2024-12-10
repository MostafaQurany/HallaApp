import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as mobilecontact;
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';

abstract interface class NativeLocalContactDataBaseSource {
  Future<List<Contact>> getFirstTimeLocalContacts();
}

class NativeLocalContactDataBaseSourceImpl
    extends NativeLocalContactDataBaseSource {
  final String _userCollection = AppConstants.userCollection;
  final _firestore = FirebaseFirestore.instance;
// local Contacts
  @override
  Future<List<Contact>> getFirstTimeLocalContacts() async {
    try {
      // get the number
      Map<String, Set<String>> localContat = await getLocalContacts();
      if (localContat.isEmpty) {
        return [];
      }
      // search for the use that has his numbers
      return await getMuchContacts(localContat);
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      throw ServerException(e.toString());
    }
  }

  Future<Map<String, Set<String>>> getLocalContacts() async {
    try {
      if (await mobilecontact.FlutterContacts.requestPermission()) {
        List<mobilecontact.Contact> contacts =
            await mobilecontact.FlutterContacts.getContacts(
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

  Future<List<Contact>> getMuchContacts(
      Map<String, Set<String>> localContat) async {
    try {
      List<Contact> contactList = [];
      QuerySnapshot<Map<String, dynamic>> allSnapShots =
          await _firestore.collection(_userCollection).get();
      List<DocumentSnapshot> documents = allSnapShots.docs;
      for (var document in documents) {
        final Map<String, dynamic> data =
            document.data() as Map<String, dynamic>;
        final List<dynamic> phonesField = data['phones'] ?? [];
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
}
