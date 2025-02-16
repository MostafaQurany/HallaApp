import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/notification/entites/my_notification.dart';
import 'package:halla/features/contacts/presentation/blocs/cubit/contact_cubit.dart';

import '../../../../../core/theme/app_colors.dart';

class NotificationContactDetails extends StatelessWidget {
  final MyNotification notification;

  const NotificationContactDetails({required this.notification, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contact Details'),
          actions: [
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  notification.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                Text(
                  notification.message,
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                SizedBox(height: 16),
                SizedBox(
                  height: 160.h,
                  child: ListView.separated(
                    itemCount: notification.data.contactsId.length,
                    separatorBuilder: (context, index) => Center(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10.w),
                          border: Border.all(
                              color: AppColors.grayLight, width: 0.5),
                        ),
                      ),
                    ),
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          notification.data.contactsId[index],
                        ),
                        onTap: () {
                          context.read<ContactCubit>().addContact(
                                userId: context.read<UserCubit>().user!.id,
                                contactId: notification.data.contactsId[index],
                              );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
