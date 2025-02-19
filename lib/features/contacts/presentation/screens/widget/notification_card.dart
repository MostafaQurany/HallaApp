import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/notification/entites/my_notification.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/utils/time_formate.dart';

class NotificationCard extends StatelessWidget {
  final MyNotification notification;
  const NotificationCard({
    required this.notification,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 15.h),
      color: Theme.of(context).inputDecorationTheme.fillColor,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          color: AppColors.primary,
        ),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              notification.title,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 5.h),
            Text(
              notification.message,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            SizedBox(height: 5.h),
            Text(
              TimeFormate.timeAgoSinceDate(notification.timestamp),
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
