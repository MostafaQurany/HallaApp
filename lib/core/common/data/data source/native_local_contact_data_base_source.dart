import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_contacts/flutter_contacts.dart' as mobilecontact;
import 'package:halla/core/common/data/models/company_model.dart';
import 'package:halla/core/common/data/models/social_media_model.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/error/server_exception.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';

abstract interface class NativeLocalContactDataBaseSource {
  Future<List<ContactModel>> getFirstTimeLocalContacts();
}

class NativeLocalContactDataBaseSourceImpl
    extends NativeLocalContactDataBaseSource {
  final String _userCollection = AppConstants.userCollection;
  final _firestore = FirebaseFirestore.instance;
// local Contacts
  @override
  Future<List<ContactModel>> getFirstTimeLocalContacts() async {
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

  Future<List<ContactModel>> getMuchContacts(
      Map<String, Set<String>> localContat) async {
    try {
      List<ContactModel> contactModelList = [];
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
                ContactModel contactModel = ContactModel(
                  primePhoneModel: data['primePhone'] ?? '',
                  nationalityModel: data['nationality'] ?? '',
                  imageUrlModel: data['imageUrl'] ?? '',
                  emailModel: data['email'] ?? '',
                  phonesModel: List<String>.from(data['phones']),
                  fullNameModel: data['fullName'] ?? '',
                  companyModel: CompanyModel.fromMap(data['company']),
                  dateOfBirthModel: data['dateOfBirth'] ?? '',
                  idModel: data['id'] ?? '',
                  socialMediaModel:
                      SocialMediaModel.fromMap(data['socialMedia']),
                  addTimeModel: Timestamp.now(),
                  favoriteCategoryModel: '',
                );
                contactModelList.add(contactModel);
              }
            }
          }
        }
      }
      return contactModelList;
    } on FirebaseException catch (e) {
      throw ServerException(e.message.toString());
    } catch (e) {
      print(e.toString());
      throw ServerException(e.toString());
    }
  }
}
