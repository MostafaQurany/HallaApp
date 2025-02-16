import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/features/contacts/presentation/screens/notification/share_to_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../../../../../core/common/domain/entities/contact.dart';
import '../../../../../core/common/presentation/cubit/user/user_cubit.dart';
import '../../../../../core/common/presentation/widgets/circle_image.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/routting.dart';

class ShareMultiContactScreen extends StatefulWidget {
  const ShareMultiContactScreen({super.key});

  @override
  State<ShareMultiContactScreen> createState() =>
      _ShareMultiContactScreenState();
}

class _ShareMultiContactScreenState extends State<ShareMultiContactScreen> {
  late ValueListenable<Box<List<dynamic>>> contactBoxValueListenable;
  List<Contact>? contactList;
  late Set<String> contactSelectIds;
  late String userId;

  @override
  void initState() {
    super.initState();
    userId = UserCubit.get(context).user!.id;
    contactSelectIds = {};
    contactBoxValueListenable =
        Hive.box<List>(AppConstants.contactBox).listenable();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _header(
              appBarHeader: _appBarHeader(),
              counterHeader: _counterHeader(),
            ),
            ValueListenableBuilder(
              valueListenable: contactBoxValueListenable,
              builder: (context, value, child) {
                contactList = value.get(userId)?.cast<Contact>() ?? [];
                if (contactList!.isNotEmpty) {
                  return Expanded(
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: contactList!.length,
                      itemBuilder: (context, index) {
                        if (contactList![index].id == userId) {
                          return SizedBox.shrink();
                        }
                        return _shareContactCard(contactList![index]);
                      },
                    ),
                  );
                } else {
                  return SizedBox(
                    height: 0.4.sh,
                    child: Image(
                      image: AssetImage(AppImages.contactListEmpty),
                      fit: BoxFit.contain,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  _header({required Widget appBarHeader, required Widget counterHeader}) =>
      SizedBox(
        height: 150.h,
        child: Stack(
          children: [
            Container(
              height: 130.h,
              width: 1.sw,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(30.w),
                  bottomLeft: Radius.circular(30.w),
                ),
                border: Border(
                  bottom: BorderSide(
                    color: AppColors.primary,
                  ),
                ),
                color: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              child: appBarHeader,
            ),
            counterHeader,
          ],
        ),
      );

  _appBarHeader() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.h,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () => AppNavigator.navigatePop(context),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              Text(
                "Share Screen",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox.shrink(),
            ],
          ),
          Text(
            "Select contacts to share with other users",
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                  color: AppColors.grayLight,
                ),
          ),
        ],
      ),
    );
  }

  _counterHeader() {
    return Align(
      alignment: AlignmentDirectional.bottomCenter,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 70.h,
              width: 70.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border(bottom: BorderSide(color: AppColors.primary)),
                color: Theme.of(context).inputDecorationTheme.fillColor,
              ),
              child: Center(child: Text(contactSelectIds.length.toString())),
            ),
            TextButton(
              onPressed: contactSelectIds.isEmpty ||
                      (contactSelectIds.length == (contactList?.length ?? 0))
                  ? null
                  : () => AppNavigator.navigatePushReplace(
                      context,
                      ShareToScreen(
                        contactSelectIds: contactSelectIds,
                      )),
              child: Text("Share To"),
            )
          ],
        ),
      ),
    );
  }

  _shareContactCard(Contact contact) {
    return GestureDetector(
      onTap: () {
        setState(() {
          contactSelectIds.contains(contact.id)
              ? contactSelectIds.remove(contact.id)
              : contactSelectIds.add(contact.id);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          spacing: 20,
          children: [
            contactSelectIds.contains(contact.id)
                ? Icon(
                    Icons.check_box_outlined,
                    color: contactSelectIds.contains(contact.id)
                        ? AppColors.primary
                        : AppColors.transparent,
                  )
                : Icon(Icons.check_box_outline_blank_outlined),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  color: Theme.of(context).inputDecorationTheme.fillColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  spacing: 10,
                  children: [
                    CircleImage(
                      imageUrl: contact.imageUrl,
                      height: 60.w,
                      width: 60.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 10,
                      children: [
                        SizedBox(
                          width: 224.w,
                          child: Text(
                            contact.fullName.isNotEmpty
                                ? contact.fullName
                                : contact.email,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (contact.phones.isNotEmpty)
                          SizedBox(
                            width: 224.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Wrap(
                                  children: [
                                    if (contact.primePhone.isNotEmpty)
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8.0, left: 8.0),
                                        child: Text(
                                          contact.primePhone,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                fontSize: 8.sp,
                                              ),
                                        ),
                                      ),
                                    ...contact.phones.map(
                                      (e) {
                                        return Padding(
                                          padding: const EdgeInsets.only(
                                              bottom: 8.0, left: 8.0),
                                          child: Text(
                                            e,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                  fontSize: 8.sp,
                                                ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
