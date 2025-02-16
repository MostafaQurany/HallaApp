import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/connection/network_cubit.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/contacts/presentation/blocs/cubit/contact_cubit.dart';
import 'package:halla/features/contacts/presentation/screens/native%20contacts/native_contacts_screen.dart';
import 'package:halla/features/contacts/presentation/screens/notification/share_multi_contact_screen.dart';
import 'package:halla/features/contacts/presentation/screens/widget/qr_code_scan_test.dart';
import 'package:halla/generated/l10n.dart';

class MenuContactButton extends StatefulWidget {
  List<String> offlineContactList;

  MenuContactButton({this.offlineContactList = const [], super.key});

  @override
  State<MenuContactButton> createState() => _MenuContactButtonState();
}

class _MenuContactButtonState extends State<MenuContactButton> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        PopupMenuButton(
          offset: Offset(0, 40.h),
          borderRadius: BorderRadius.circular(90.w),
          clipBehavior: Clip.antiAlias,
          onSelected: (value) => _onMenuItemSelected(value),
          itemBuilder: (ctx) => [
            _buildPopupMenuItem(
              title: S.of(context).addContact,
              iconData: Icons.add,
            ),
            _buildPopupMenuItem(
              title: S.of(context).syncContact,
              iconData: Icons.sync,
            ),
            _buildPopupMenuItem(
              title: "Local Contacts",
              iconData: Icons.contacts_rounded,
            ),
            if (!widget.offlineContactList.isNotEmpty &&
                (context.read<NetworkCubit>().currentConnection ?? false))
              _buildPopupMenuItem(
                title: S.of(context).shareContact,
                iconData: Icons.share,
              ),
            if (widget.offlineContactList.isNotEmpty &&
                (context.read<NetworkCubit>().currentConnection ?? false))
              _buildPopupMenuSaveOfflineContacts(),
          ],
        ),
        if (widget.offlineContactList.isNotEmpty &&
            (context.watch<NetworkCubit>().currentConnection ?? false))
          _notificationBadge(),
      ],
    );
  }

  PopupMenuItem _buildPopupMenuItem(
      {required String title, required IconData iconData}) {
    return PopupMenuItem(
      value: title,
      child: Column(
        children: [
          Row(
            children: [
              Icon(iconData),
              SizedBox(
                width: 10,
              ),
              Text(title),
            ],
          ),
        ],
      ),
    );
  }

  PopupMenuItem _buildPopupMenuSaveOfflineContacts() {
    return PopupMenuItem(
      value: S.of(context).saveOfflineContacts,
      child: Row(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.people_outline),
          Text(S.of(context).saveOfflineContacts),
          Container(
            width: 7.w,
            height: 10.w,
            decoration: BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
            ),
          )
        ],
      ),
    );
  }

  _onMenuItemSelected(String value) {
    if (value == S.of(context).addContact) {
      _addContact();
    } else if (value == S.of(context).syncContact) {
      _syncContacts();
    } else if (value == S.of(context).shareContact) {
      _shareContact();
    } else if (value == S.of(context).saveOfflineContacts) {
      _saveOfflineContacts();
    } else if (value == "Local Contacts") {
      _nativeContact();
    }
  }

  _notificationBadge() {
    return Positioned(
      right: -4,
      top: -4,
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          widget.offlineContactList.length > 99
              ? '99+'
              : '${widget.offlineContactList.length}',
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
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
        if (contactId != null && contactId.isNotEmpty) {
          if (context.read<NetworkCubit>().currentConnection ?? false) {
            context.read<ContactCubit>().addContact(
                  userId: UserCubit.get(context).user?.id ?? '',
                  contactId: contactId ?? '',
                );
          } else {
            context.read<ContactCubit>().addOfflineContact(
                  userId: UserCubit.get(context).user?.id ?? '',
                  contactId: contactId ?? '',
                );
          }
        }
      },
    );
  }

  _syncContacts() async {
    context
        .read<ContactCubit>()
        .getContactListSync(userId: UserCubit.get(context).user!.id);
  }

  _saveOfflineContacts() async {
    context.read<ContactCubit>().addContactList(
          userId: UserCubit.get(context).user?.id ?? '',
          contactIdList: widget.offlineContactList,
        );
  }

  _shareContact() async {
    AppNavigator.navigatePush(context, ShareMultiContactScreen());
  }

  _nativeContact() async {
    AppNavigator.navigatePush(context, NativeContactsScreen());
  }
}
