import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/connection/network_cubit.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/contacts/presentation/screens/search_screen.dart';
import 'package:halla/features/contacts/presentation/screens/widget/catogery_list_widget.dart';
import 'package:halla/features/contacts/presentation/screens/widget/download_contact_icon.dart';
import 'package:halla/features/contacts/presentation/screens/widget/menu_contact_button.dart';
import 'package:halla/features/contacts/presentation/screens/widget/search_field.dart';
import 'package:halla/generated/l10n.dart';

class HeaderContactScreen extends StatefulWidget {
  List<String> offlineContactListIds;

  HeaderContactScreen({this.offlineContactListIds = const [], super.key});

  @override
  State<HeaderContactScreen> createState() => _HeaderContactScreenState();
}

class _HeaderContactScreenState extends State<HeaderContactScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(16),
          bottomRight: Radius.circular(16),
        ),
        color:
            AppTheme.isLight(context) ? AppColors.white : AppColors.blackLight,
      ),
      padding: EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8.h),
      child: Column(
        spacing: 15.h,
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  S.of(context).contactList,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontSize: 24.sp,
                      ),
                  textAlign: TextAlign.center,
                ),
              ),
              AnimatedOpacity(
                duration: Duration(milliseconds: 350),
                curve: Curves.easeInOut,
                opacity:
                    !(context.watch<NetworkCubit>().currentConnection ?? false)
                        ? 1
                        : 0,
                child: DownloadContactIcon(
                  listLength: widget.offlineContactListIds.length,
                ),
              ),
            ],
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
                MenuContactButton(
                  offlineContactList: widget.offlineContactListIds,
                ),
              ],
            ),
          ),
          const CatogeryListWidget(),
        ],
      ),
    );
  }
}
