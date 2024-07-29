import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/contacts/presentation/screens/search_screen.dart';
import 'package:halla/features/contacts/presentation/screens/widget/add_contact_button.dart';
import 'package:halla/features/contacts/presentation/screens/widget/catogery_list_widget.dart';
import 'package:halla/features/contacts/presentation/screens/widget/download_contact_icon.dart';
import 'package:halla/features/contacts/presentation/screens/widget/search_field.dart';
import 'package:halla/generated/l10n.dart';

class HeaderContactScreen extends StatefulWidget {
  const HeaderContactScreen({super.key});

  @override
  State<HeaderContactScreen> createState() => _HeaderContactScreenState();
}

class _HeaderContactScreenState extends State<HeaderContactScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.isLight(context) ? null : AppColors.blackLight,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 16),
      child: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: 33.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const DownloadContactIcon(),
                const Spacer(),
                Text(
                  S.of(context).contactList,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 24.sp,
                      ),
                ),
                const Spacer(),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8.0.w,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OpenContainer(
                      useRootNavigator: true,
                      transitionDuration: const Duration(milliseconds: 200),
                      transitionType: ContainerTransitionType.fade,
                      closedColor: Colors.transparent,
                      closedElevation: 0,
                      openColor: Colors.transparent,
                      openElevation: 0,
                      closedBuilder: (context, action) => SearchField(
                        searchController: searchController,
                        ignorePointers: true,
                      ),
                      openBuilder: (BuildContext context, VoidCallback _) {
                        return SearchScreen(searchController: searchController);
                      },
                    ),
                  ),
                  SizedBox(
                    width: 9.w,
                  ),
                  const AddContactButton(),
                ],
              ),
            ),
            SizedBox(
              height: 24.h,
            ),
            const CatogeryListWidget(),
          ],
        ),
      ),
    );
  }
}
