import 'package:flutter_contacts/flutter_contacts.dart';

abstract class ContactsNativeDataSource {
  getNativeContact();
}

class ContactsNativeDataSourceImpl implements ContactsNativeDataSource {
  @override
  getNativeContact() async {

    if (await FlutterContacts.requestPermission()) {
      List<Contact> contacts =  await FlutterContacts.getContacts(
          withProperties: true, withPhoto: true);
    }


  }
}
