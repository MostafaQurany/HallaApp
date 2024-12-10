import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/features/contacts/presentation/screens/widget/custom_contact_detailes_card.dart';
import 'package:halla/features/contacts/presentation/screens/widget/custom_contact_detailes_spacer.dart';

class SocailMediaCard extends StatelessWidget {
  final Contact contact;
  const SocailMediaCard({super.key, required this.contact});

  @override
  Widget build(context) {
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
      padding: EdgeInsets.symmetric(
        vertical: 15.h,
      ),
      child: Column(
        children: [
          CustomContactDetailesCard(
            title: "Facebook",
            content: Expanded(
              child: Text(
                contact.socialMedia.facebook,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
          const CustomContactDetailesSpacer(),
          CustomContactDetailesCard(
            title: "Instagram",
            content: Expanded(
              child: Text(
                contact.socialMedia.instagram,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
          const CustomContactDetailesSpacer(),
          CustomContactDetailesCard(
            title: "Linked In",
            content: Expanded(
              child: Text(
                contact.socialMedia.linkedin,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
          const CustomContactDetailesSpacer(),
          CustomContactDetailesCard(
            title: "Twitter",
            content: Expanded(
              child: Text(
                contact.socialMedia.twitter,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
