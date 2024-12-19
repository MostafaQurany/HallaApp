import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/common/presentation/cubit/connection/network_cubit.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/common/presentation/widgets/error_banner.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/contacts/presentation/blocs/cubit/contact_cubit.dart';
import 'package:halla/features/contacts/presentation/screens/components/header_contact_screen.dart';
import 'package:halla/features/contacts/presentation/screens/contact_card.dart';
import 'package:halla/features/contacts/presentation/screens/widget/contact_card_shimer_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ContactsScreen extends StatefulWidget {
  const ContactsScreen({super.key});

  @override
  State<ContactsScreen> createState() => _ContactsScreenState();
}

class _ContactsScreenState extends State<ContactsScreen> {
  late String userId;
  List<Contact>? contactList;

  final TextEditingController searchController = TextEditingController();
  late ValueListenable<Box<List<dynamic>>> contactBoxValueListenable;

  @override
  void initState() {
    super.initState();
    userId = UserCubit.get(context).user!.id;
    contactBoxValueListenable =
        Hive.box<List>(AppConstants.contactBox).listenable();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 200),
                  height:
                      context.watch<NetworkCubit>().currentConnection ?? false
                          ? 0
                          : 30.h,
                ),
                const HeaderContactScreen(),
                BlocListener<ContactCubit, ContactState>(
                  listener: (context, state) {
                    state.whenOrNull(
                      contactFailure: (error) {
                        AppShowDialog.error(context, error);
                      },
                      addContactLoading: () {
                        AppShowDialog.loading(context);
                      },
                      addContactSuccess: () {
                        AppNavigator.navigatePop(context);
                      },
                      getContactListSyncLoading: () {
                        AppShowDialog.loading(context);
                      },
                      getContactListSyncSuccess: (contactList) {
                        AppNavigator.navigatePop(context);
                      },
                    );
                  },
                  child: ValueListenableBuilder(
                    valueListenable: contactBoxValueListenable,
                    builder: (context, value, child) {
                      contactList = value.get(userId)?.cast<Contact>() ?? [];
                      if (contactList!.isNotEmpty) {
                        return Expanded(
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: contactList!.length,
                            //contactList.length,
                            itemBuilder: (context, index) {
                              return ContactCard(
                                contact: contactList![index],
                              );
                            },
                          ),
                        );
                      } else {
                        return SizedBox(
                          height: 0.4.sh,
                          child: InkWell(
                            onTap: () {
                              ContactCubit.get(context)
                                  .getContactList(userId: userId);
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
                ),
              ],
            ),
            OfflineBanner(
                isOffline:
                    context.watch<NetworkCubit>().currentConnection ?? false),
          ],
        ),
      ),
    );
  }

  Widget getCardShimmer() => Expanded(
        child: ListView.builder(
          itemCount: 6,
          itemBuilder: (context, index) => ContactCardShimmer(),
        ),
      );
}
