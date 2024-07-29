import 'package:flutter/material.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/features/contacts/data/models/contact_adapter.dart';
import 'package:halla/features/contacts/presentation/screens/widget/header_contact_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactsScreen extends StatelessWidget {
  const ContactsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          const HeaderContactScreen(),
          FutureBuilder(
            future: Hive.openBox<ContactAdapterA>(AppConstants.boxName),
            builder: (context, snapshot) {
              return ValueListenableBuilder(
                valueListenable: Hive.box<ContactAdapterA>(AppConstants.boxName)
                    .listenable(),
                builder: (context, Box<ContactAdapterA> box, _) {
                  if (box.values.isEmpty) {
                    return const Text('data is empty');
                  } else {
                    return ListView.builder(
                      itemCount: box.values.length,
                      itemBuilder: (context, index) {
                        return const ListTile(
                          title: Text("ss"),
                        );
                      },
                    );
                  }
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
