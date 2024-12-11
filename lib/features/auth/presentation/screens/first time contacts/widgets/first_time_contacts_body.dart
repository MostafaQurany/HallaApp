import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/utils/app_show_dialog.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/features/auth/presentation/blocs/sign%20cubit/sign_in_cubit.dart';
import 'package:halla/features/auth/presentation/screens/first%20time%20contacts/widgets/fites_time_contact.dart';
import 'package:halla/features/home/presentation/screens/home_layout.dart';

class FirstTimeContactsBody extends StatefulWidget {
  final String searchText;

  const FirstTimeContactsBody({required this.searchText, super.key});

  @override
  State<FirstTimeContactsBody> createState() => _FirstTimeContactsBodyState();
}

class _FirstTimeContactsBodyState extends State<FirstTimeContactsBody> {
  bool isAllSelected = false;
  List<Contact> contactsList = [];
  List<String> contactSelectedIds = [];

  void _handleStateChange(BuildContext context, SignInState state) {
    state.whenOrNull(
      firstTimeContactLoading: () => AppShowDialog.loading(context),
      firstTimeContactError: (message) => AppShowDialog.error(context, message),
      addFirstTimeContactsSuccess: () {
        AppNavigator.navigatePushReplaceRemoveAll(context, const HomeLayout());
      },
      getFirstTimeContactSuccess: (contacts) {
        setState(() {
          contactsList = List<Contact>.from(contacts.toSet());
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: Alignment.center,
        children: [
          _buildBackground(context),
          BlocConsumer<SignInCubit, SignInState>(
            listener: (context, state) => _handleStateChange(context, state),
            builder: (context, state) {
              if (contactsList.isEmpty) {
                return _buildEmptyBody();
              } else {
                final filteredContacts = _filterContacts(widget.searchText);
                return _buildContactsBody(filteredContacts);
              }
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBackground(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Container(
        width: double.infinity,
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
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildEmptyBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(AppImages.contactListEmpty),
          const SizedBox(height: 16),
          const Text(
            "You don't have shared contact",
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildContactsBody(List<Contact> filteredContacts) {
    return Padding(
      padding: AppConstants.paddingScreen,
      child: Column(
        children: [
          _buildHeader(filteredContacts),
          SizedBox(height: 20.h),
          Expanded(
            child: _buildContactsList(filteredContacts),
          ),
          SizedBox(height: 16.h),
          _buildAddContactsButton(),
        ],
      ),
    );
  }

  Widget _buildHeader(List<Contact> filteredContacts) {
    return Row(
      children: [
        Text(
          "${contactSelectedIds.length} Selected",
          style: AppTheme.getThemeText(context)
              .bodyMedium!
              .copyWith(fontSize: 20.sp),
        ),
        const Spacer(),
        TextButton(
          onPressed: () {
            setState(() {
              isAllSelected = !isAllSelected;
              contactSelectedIds = isAllSelected
                  ? filteredContacts.map((contact) => contact.id).toList()
                  : [];
            });
          },
          child: Row(
            children: [
              Container(
                height: 15.h,
                width: 15.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: AppColors.primary),
                  color: isAllSelected ? AppColors.primary : null,
                ),
                child: isAllSelected
                    ? Icon(Icons.check, color: AppColors.white, size: 10.h)
                    : null,
              ),
              SizedBox(width: 8.w),
              Text(isAllSelected ? "Deselect" : "Select All"),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildContactsList(List<Contact> filteredContacts) {
    return ListView.builder(
      itemCount: filteredContacts.length,
      itemBuilder: (context, index) {
        final contact = filteredContacts[index];
        return FitesTimeContactCard(
          name: contact.fullName,
          image: contact.imageUrl,
          isSelected: contactSelectedIds.contains(contact.id),
          onTap: () {
            setState(() {
              if (contactSelectedIds.contains(contact.id)) {
                contactSelectedIds.remove(contact.id);
              } else {
                contactSelectedIds.add(contact.id);
              }
            });
          },
        );
      },
    );
  }

  Widget _buildAddContactsButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: contactSelectedIds.isEmpty ? null : _addContacts,
        child: const Text("Add Contacts"),
      ),
    );
  }

  void _addContacts() {
    context.read<SignInCubit>().addFirstTimeContactList(
          userId: UserCubit.get(context).user!.id,
          contactIdsList: contactSelectedIds,
        );
  }

  List<Contact> _filterContacts(String searchText) {
    return searchText.isEmpty
        ? contactsList
        : contactsList.where((contact) {
            return contact.fullName
                .toLowerCase()
                .contains(searchText.toLowerCase());
          }).toList();
  }
}
