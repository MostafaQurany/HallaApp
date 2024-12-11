import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/features/contacts/presentation/blocs/cubit/contact_cubit.dart';
import 'package:halla/features/contacts/presentation/screens/widget/qr_code_scan_test.dart';

class AddContactButton extends StatefulWidget {
  const AddContactButton({super.key});

  @override
  State<AddContactButton> createState() => _AddContactButtonState();
}

class _AddContactButtonState extends State<AddContactButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: PopupMenuButton(
        onSelected: (value) {
          _onMenuItemSelected(value);
        },
        itemBuilder: (ctx) => [
          _buildPopupMenuItem(title: 'add contact', iconData: Icons.add),
          _buildPopupMenuItem(title: 'Sync contact', iconData: Icons.sync),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      {required String title, required IconData iconData}) {
    return PopupMenuItem(
      value: title,
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 10,
          ),
          Text(title),
        ],
      ),
    );
  }

  _onMenuItemSelected(String value) {
    if (value == 'add contact') {
      _addContact();
    } else if (value == 'Sync contact') {
      _syncContacts();
    }
  }

  _addContact() async {
    return await showDialog<String>(
      context: context,
      builder: (context) => const AlertDialog(
        content: BarcodeScannerWithController(),
      ),
    ).then(
      (contactId) {
        print(contactId);
        context.read<ContactCubit>().addContact(
              userId: UserCubit.get(context).user?.id ?? '',
              contactId: contactId ?? '',
            );
      },
    );
  }

  _syncContacts() async {
    context
        .read<ContactCubit>()
        .getContactListSync(userId: UserCubit.get(context).user!.id);
  }
}
