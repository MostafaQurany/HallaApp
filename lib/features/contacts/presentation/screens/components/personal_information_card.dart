import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/core/common/domain/entities/contact.dart';
import 'package:halla/features/contacts/presentation/screens/widget/custom_contact_detailes_card.dart';
import 'package:halla/features/contacts/presentation/screens/widget/custom_contact_detailes_spacer.dart';

class PersonalInformationCard extends StatelessWidget {
  final Contact contact;
  const PersonalInformationCard({super.key, required this.contact});

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
            title: "Email",
            content: Expanded(
              child: Text(
                contact.email,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
          const CustomContactDetailesSpacer(),
          CustomContactDetailesCard(
            title: "Prime Number",
            content: Expanded(
              child: Text(
                contact.primePhone,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
          const CustomContactDetailesSpacer(),
          CustomContactDetailesCard(
            title: "Phone",
            content: Column(
              children: contact.phones
                  .map(
                    (e) => SizedBox(
                      width: 0.4.sw,
                      child: Text(
                        e,
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        maxLines: 3,
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          const CustomContactDetailesSpacer(),
          CustomContactDetailesCard(
            title: "Birthday",
            content: Expanded(
              child: Text(
                contact.dateOfBirth,
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                maxLines: 3,
              ),
            ),
          ),
          const CustomContactDetailesSpacer(),
          CustomContactDetailesCard(
            title: "Nationality",
            content: Text(
              contact.nationality,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ],
      ),
    );
  }
}
