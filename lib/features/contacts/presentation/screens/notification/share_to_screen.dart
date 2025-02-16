import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/notification/cubit/cubit/notification_cubit.dart';
import 'package:halla/core/notification/entites/my_notification.dart';
import 'package:halla/core/notification/entites/notification_type_enum.dart';
import 'package:halla/features/contacts/presentation/screens/notification/share_multi_contact_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/common/domain/entities/contact.dart';
import '../../../../../core/common/presentation/cubit/user/user_cubit.dart';
import '../../../../../core/common/presentation/widgets/circle_image.dart';
import '../../../../../core/constants/app_images.dart';
import '../../../../../core/constants/constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/utils/routting.dart';

class ShareToScreen extends StatefulWidget {
  Set<String> contactSelectIds;

  ShareToScreen({this.contactSelectIds = const {}, super.key});

  @override
  State<ShareToScreen> createState() => _ShareToScreenState();
}

class _ShareToScreenState extends State<ShareToScreen> {
  late ValueListenable<Box<List<dynamic>>> contactBoxValueListenable;
  List<Contact>? contactList;
  Set<String> contactsShareTo = {};
  late String userId;

  @override
  void initState() {
    super.initState();
    userId = UserCubit.get(context).user!.id;
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
                        if (contactList![index].id == userId ||
                            widget.contactSelectIds
                                .contains(contactList![index].id)) {
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

  _header({
    required Widget appBarHeader,
    required Widget counterHeader,
  }) =>
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
                onPressed: () => AppNavigator.navigatePushReplace(
                  context,
                  ShareMultiContactScreen(),
                ),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
              Text(
                "Share Contact ",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              SizedBox.shrink(),
            ],
          ),
          Text(
            "Select contact to share to",
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
              child: Center(child: Text(contactsShareTo.length.toString())),
            ),
            TextButton(
              onPressed: contactsShareTo.isEmpty
                  ? null
                  : () {
                      for (var receiverId in contactsShareTo) {
                        context.read<NotificationCubit>().sendNotification(
                              MyNotification(
                                title: "Halla",
                                message:
                                    "You have new contact, Do you want to add them ?",
                                data: NotificationData(
                                  notificationId: Uuid().v4(),
                                  receiverId: receiverId,
                                  senderId: UserCubit.get(context).user!.id,
                                  type: MyNotificationType.contact,
                                  contactsId: widget.contactSelectIds.toList(),
                                ),
                                timestamp: DateTime.now(),
                              ),
                            );
                      }
                      AppNavigator.navigatePop(context);
                    },
              child: Text("Share"),
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
          contactsShareTo.contains(contact.id)
              ? contactsShareTo.remove(contact.id)
              : contactsShareTo.add(contact.id);
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Row(
          spacing: 20,
          children: [
            contactsShareTo.contains(contact.id)
                ? Icon(
                    Icons.check_box_outlined,
                    color: contactsShareTo.contains(contact.id)
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
                            child: Wrap(
                              children: [
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
