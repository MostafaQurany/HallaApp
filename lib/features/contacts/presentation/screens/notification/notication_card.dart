import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/notification/entites/my_notification.dart';
import 'package:halla/core/notification/entites/notification_type_enum.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/utils/routting.dart';
import 'package:halla/core/utils/time_formate.dart';
import 'package:halla/features/contacts/presentation/screens/notification/notification_contact_details.dart';

class NotificationCard extends StatelessWidget {
  final MyNotification notification;

  const NotificationCard({required this.notification, super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (notification.data.type == MyNotificationType.contact) {
          AppNavigator.navigatePush(
              context,
              NotificationContactDetails(
                notification: notification,
              ));
        }
      },
      title: Text(notification.title),
      subtitle: Text(notification.message),
      trailing: Column(
        spacing: 10,
        children: [
          Container(
            height: 10.w,
            width: 10.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color:
                  notification.isOpen ? AppColors.darkFill : AppColors.primary,
              border: Border.all(color: AppColors.grayLight, width: 0.5),
            ),
          ),
          Text(
            TimeFormate.timeAgoSinceDate(notification.timestamp),
          ),
        ],
      ),
    );
  }
}
