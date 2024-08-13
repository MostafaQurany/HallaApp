// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/contacts/domain/entities/contact.dart';

class ContactDetailsAppbar extends StatelessWidget {
  final Contact contact;
  const ContactDetailsAppbar({
    super.key,
    required this.contact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.isLight(context) ? AppColors.white : AppColors.darkFill,
        border: Border.all(
          color: AppTheme.isLight(context)
              ? AppColors.primaryObesty
              : AppColors.primary,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(16.w),
        ),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 40.w,
                backgroundImage: AssetImage(
                  AppImages.profilePlaceholder,
                ),
                backgroundColor: Colors.transparent,
              ),
              SizedBox(
                width: 20.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    contact.fullName,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    children: [
                      Image.asset(
                        AppImages.messageIcon,
                        height: 25.h,
                        width: 25.w,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
