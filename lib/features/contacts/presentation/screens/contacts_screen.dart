import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/features/contacts/presentation/blocs/cubit/contact_cubit.dart';
import 'package:halla/features/contacts/presentation/screens/components/header_contact_screen.dart';
import 'package:halla/features/contacts/presentation/screens/contact_card.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late String userId;
  List<Contact> contactList = [];
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    userId = UserCubit.get(context).user!.id;
    ContactCubit.get(context).getContactList(userId: userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const HeaderContactScreen(),
          BlocConsumer<ContactCubit, ContactState>(
            listener: (context, state) {
              state.whenOrNull(
                contactFailure: (error) {
                  AppShowDialog.error(context, error);
                },
                getContactListSuccess: (contactList) {
                  print(contactList);
                  this.contactList = contactList;
                },
                addContactLoading: () {
                  AppShowDialog.loading(context);
                },
                addContactSuccess: () {
                  AppNavigator.navigatePop(context);
                },
              );
            },
            builder: (context, state) {
              if (contactList.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: contactList.length, //contactList.length,
                    itemBuilder: (context, index) {
                      print(contactList[index]);
                      return ContactCard(
                        contact: contactList[index],
                      );
                    },
                  ),
                );
              } else {
                return SizedBox(
                  height: 0.4.sh,
                  child: InkWell(
                    onTap: () {
                      ContactCubit.get(context).getContactList(userId: userId);
                    },
                    child: Image(
                      image: AssetImage(AppImages.contactListEmpty),
                      fit: BoxFit.contain,
                    ),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
