import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/features/contacts/data/models/contact_model.dart';
import 'package:halla/features/contacts/presentation/blocs/bloc/contacts_bloc.dart';
import 'package:halla/features/contacts/presentation/screens/components/header_contact_screen.dart';
import 'package:halla/features/contacts/presentation/screens/contact_card.dart';
import 'package:halla/features/home/presentation/screens/components/end_spacer_sized_box.dart';
import 'package:lottie/lottie.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late String userId;
  late ValueListenable<Box<Map<String, ContactModel>>> valueListenable;
  @override
  void initState() {
    super.initState();
    userId = UserCubit.get(context).isUser
        ? UserCubit.get(context).user!.id
        : UserCubit.get(context).guest!.id;
  }

  @override
  Widget build(BuildContext context) {
    context.read<ContactsBloc>().add(GetContactsListEvent(userId: userId));
    return Scaffold(
      body: BlocListener<ContactsBloc, ContactsState>(
        listener: (context, state) {
          if (state is AddContactsLoadingState) {
            AppShowDialog.loading(context);
          }
          if (state is AddContactSuccessfully) {
            Future.delayed(const Duration(milliseconds: 200)).then(
              (value) {
                Navigator.pop(context);
                context
                    .read<ContactsBloc>()
                    .add(GetContactsListEvent(userId: userId));
              },
            );
          }
          if (state is AddContactsErorrState) {
            Future.delayed(const Duration(milliseconds: 200)).then(
              (value) => Navigator.pop(context),
            );
          }
          if (state is GetContactsErorrState) {}
          if (state is GetContactsSuccessfully) {
            print(state.contacts);
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const HeaderContactScreen(),
              // ValueListenableBuilder(
              //   valueListenable:
              //       Hive.box<Map<String, String>>(AppConstants.contactBox)
              //           .listenable(),
              //   builder: (context, value, child) {
              //     if (value.isNotEmpty &&
              //         value.get(userId) != null &&
              //         value.get(userId)!.isNotEmpty) {
              //       List<Contact> contactList = [];
              //       for (var k in value.get(userId)!.keys) {
              //         contactList.add(
              //             ContactModel.fromJsonHive(value.get(userId)![k]!));
              //       }
              //       return ListView.builder(
              //         shrinkWrap: true,
              //         itemCount: value.get(userId)!.keys.length,
              //         itemBuilder: (context, index) => Text(
              //           index.toString(),
              //         ),
              //       );
              //     }
              //     return SizedBox(
              //       height: 0.4.sh,
              //       child: Image(
              //         image: AssetImage(AppImages.contactListEmpty),
              //         fit: BoxFit.contain,
              //       ),
              //     );
              //   },
              // ),
              BlocBuilder<ContactsBloc, ContactsState>(
                builder: (context, state) {
                  if (state is GetContactsLoadingState) {
                    return Center(child: Lottie.asset(AppImages.loadingLottie));
                  }
                  if (state is GetContactsSuccessfully) {
                    if (state.contacts.isEmpty) {
                      return SizedBox(
                        height: 0.4.sh,
                        child: Image(
                          image: AssetImage(AppImages.contactListEmpty),
                          fit: BoxFit.contain,
                        ),
                      );
                    } else {
                      return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: state.contacts.length,
                        itemBuilder: (context, index) {
                          return ContactCard(
                            contact: state.contacts[index],
                          );
                        },
                      );
                    }
                  }
                  return SizedBox(
                    height: 0.4.sh,
                    child: Image(
                      image: AssetImage(AppImages.contactListEmpty),
                      fit: BoxFit.contain,
                    ),
                  );
                },
              ),
              const EndSpacerSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
