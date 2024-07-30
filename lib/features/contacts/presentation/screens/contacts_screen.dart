import 'package:flutter/material.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:halla/features/contacts/presentation/screens/contact_card.dart';
import 'package:halla/features/contacts/presentation/screens/components/header_contact_screen.dart';
import 'package:halla/features/home/presentation/screens/components/end_spacer_sized_box.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const HeaderContactScreen(),
            ValueListenableBuilder(
              valueListenable:
                  Hive.box<ContactModel>('ContactModelBox').listenable(),
              builder: (context, Box<ContactModel> box, _) {
                if (box.values.isEmpty) {
                  return const Text('data is empty');
                } else {
                  return ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: box.values.length,
                    itemBuilder: (context, index) {
                      return ContactCard(contact: box.values.elementAt(index));
                    },
                  );
                }
              },
            ),
            const EndSpacerSizedBox(),
          ],
        ),
      ),
    );
  }
}
