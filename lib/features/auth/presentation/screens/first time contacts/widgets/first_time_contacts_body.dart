import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/company.dart';
import 'package:halla/core/common/domain/entities/social_media.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/sign%20cubit/sign_in_cubit.dart';
import 'package:halla/features/auth/presentation/screens/first%20time%20contacts/widgets/fites_time_contact.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';

class FirstTimeContactsBody extends StatefulWidget {
  final String searchText;

  const FirstTimeContactsBody({required this.searchText, super.key});

  @override
  State<FirstTimeContactsBody> createState() => _FirstTimeContactsBodyState();
}

class _FirstTimeContactsBodyState extends State<FirstTimeContactsBody> {
  bool isSelecting = false;
  bool isAllSelected = false;
  List<int> selectedItemsId = [];
  List<Contact>? contactsList;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Background
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 1.sh,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 1.sh,
                  ),
                ],
              ),
              child: Image.asset(
                AppTheme.isLight(context)
                    ? AppImages.personalInformationBackground
                    : AppImages.personalInformationBackgroundDark,
                fit: BoxFit.fill,
              ),
            ),
          ),
          // Contacts List
          BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) {
              state.whenOrNull(
                firstTimeContactLoading: () {
                  AppShowDialog.loading(context);
                },
                firstTimeContactError: (message) {
                  AppShowDialog.error(context, message);
                },
                addFirstTimeContactsSuccess: () {
                  AppNavigator.navigatePushReplaceRemoveAll(
                    context,
                    const HomeLayout(),
                  );
                },
                getFirstTimeContactSuccess: (contacts) {
                  contactsList = contacts;
                },
              );
            },
            builder: (context, state) {
              if (contactsList == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (contactsList!.isEmpty) {
                return _emptyBody();
              } else {
                // Filtered contacts
                final filteredContacts = widget.searchText.isEmpty
                    ? contactsList!
                    : contactsList!
                        .where((contact) => contact.fullName
                            .toLowerCase()
                            .contains(widget.searchText.toLowerCase()))
                        .toList();

                return _body(filteredContacts);
              }
            },
          )
        ],
      ),
    );
  }

  Widget _emptyBody() {
    return Center(
      child: Column(
        children: [
          Image.asset(AppImages.contactListEmpty),
          const Text("You don't have shared contact")
        ],
      ),
    );
  }

  Widget _body(List<Contact> filteredContacts) {
    return Padding(
      padding: AppConstants.paddingScreen,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                "${selectedItemsId.length} Selected",
                style: AppTheme.getThemeText(context)
                    .bodyMedium!
                    .copyWith(fontSize: 20.sp),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  isAllSelected = !isAllSelected;
                  if (isAllSelected) {
                    selectedItemsId =
                        List.generate(contactsList!.length, (index) => index);
                  } else {
                    selectedItemsId.clear();
                  }
                  setState(() {});
                },
                child: Row(
                  children: [
                    Container(
                      height: 15.h,
                      width: 15.h,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(
                          color: AppColors.primary,
                          width: 1,
                        ),
                        color: isAllSelected ? AppColors.primary : null,
                      ),
                      child: isAllSelected
                          ? Icon(
                              Icons.check,
                              color: AppColors.white,
                              size: 10.h,
                            )
                          : null,
                    ),
                    SizedBox(width: 18.w),
                    Text(isAllSelected ? "Deselect" : "Select All"),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: ListView.builder(
              itemCount: filteredContacts.length,
              itemBuilder: (context, index) {
                final contact = filteredContacts[index];
                return FitesTimeContactCard(
                  name: contact.fullName,
                  image: contact.imageUrl,
                  isSelected: selectedItemsId.contains(index),
                  onTap: () {
                    if (selectedItemsId.contains(index)) {
                      setState(() {
                        selectedItemsId.remove(index);
                      });
                    } else {
                      setState(() {
                        selectedItemsId.add(index);
                      });
                    }
                  },
                );
              },
            ),
          ),
          SizedBox(height: 3.h),
          SizedBox(
            width: 1.sw,
            child: ElevatedButton(
              onPressed: () => _addContacts(contactsList ?? []),
              child: const Text("Add Contacts"),
            ),
          ),
        ],
      ),
    );
  }

  void _addContacts(List<Contact> contacts) {
    final selectedContact = List.generate(
      3,
      (index) {
        contacts[index].id = 'QLio37VJZ7UhGXfUw3JxGhkEUfw1';
        return contacts[index];
      },
    ).toList();
    final selectedContactIds =
        selectedContact.map((contact) => contact.id).toList();

    context.read<SignInCubit>().addFirstTimeContactList(
          userId: UserCubit.get(context).user!.id,
          contact: selectedContactIds,
        );
  }
}
