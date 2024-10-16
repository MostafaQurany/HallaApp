import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart';
import 'package:halla/features/auth/presentation/screens/first%20time%20contacts/widgets/fites_time_contact.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';

class FirstTimeContactsBody extends StatefulWidget {
  const FirstTimeContactsBody({super.key});

  @override
  State<FirstTimeContactsBody> createState() => _FirstTimeContactsBodyState();
}

class _FirstTimeContactsBodyState extends State<FirstTimeContactsBody> {
  bool isSelecting = false;
  bool isALLSelectted = false;
  List<int> selectedItemsId = [];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // background
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 1.sh,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
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
          // body
          BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) {
              if (state is AuthLoading) {
                AppShowDialog.loading(context);
              }
              if (state is AuthFailure) {
                AppNavigator.navigatePop(context);
                AppShowDialog.showErrorMessage(context, state.message);
              }
              if (state is GetNativeContactSucces) {
                AppNavigator.navigatePop(context);
                AppNavigator.navigatePop(context);
              }
              if (state is AddFirstTimeContactSucces) {
                AppNavigator.navigatePushReplaceRemoveAll(
                  context,
                  const HomeLayout(),
                );
              }
            },
            builder: (context, state) {
              if (state is GetNativeContactSucces) {
                if (state.contacts.isEmpty) {
                  return Center(
                      child: Column(
                    children: [
                      Image.asset(AppImages.contactListEmpty),
                      const Text("You don't have shared contact")
                    ],
                  ));
                }
                return Padding(
                  padding: AppConstants.paddingScreen,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "${selectedItemsId.length} Selection",
                            style: AppTheme.getThemeText(context)
                                .bodyMedium!
                                .copyWith(
                                  fontSize: 20.sp,
                                ),
                          ),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              isALLSelectted = !isALLSelectted;
                              if (isALLSelectted) {
                                List<int> numbers = List.generate(
                                    state.contacts.length, (index) => index);
                                selectedItemsId = [];
                                selectedItemsId.addAll(numbers);
                              } else {
                                selectedItemsId = [];
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
                                    color: isALLSelectted
                                        ? AppColors.primary
                                        : null,
                                  ),
                                  child: isALLSelectted
                                      ? Icon(
                                          Icons.check,
                                          color: AppColors.white,
                                          size: 10.h,
                                        )
                                      : null,
                                ),
                                SizedBox(
                                  width: 18.w,
                                ),
                                !isALLSelectted
                                    ? const Text("Select All")
                                    : const Text("Deselect"),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.contacts.length,
                          itemBuilder: (context, index) {
                            return FitesTimeContact(
                              name: state.contacts[index].fullName,
                              image: state.contacts[index].imageUrl,
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
                      SizedBox(
                        height: 3.h,
                      ),
                      SizedBox(
                        width: 1.sw,
                        child: ElevatedButton(
                          onPressed: () => _addContacts(state.contacts),
                          child: const Text("Add Contacts"),
                        ),
                      ),
                    ],
                  ),
                );
              }
              if (state is AuthFailure) {
                Text(state.message);
              }
              return const SizedBox.shrink();
            },
          )
        ],
      ),
    );
  }

  _addContacts(List<Contact> contacts) async {
    // prepare the list
    List<String> contactsSlectedId = selectedItemsId
        .map(
          (e) => contacts[e].id,
        )
        .toList();
    // get user ID
    String userId = UserCubit.get(context).user!.id;
    // get the add function
    context.read<AuthBloc>().add(
          AuthAddFirstTimeContactList(
            userId: userId,
            contact: contactsSlectedId,
          ),
        );
  }
}
