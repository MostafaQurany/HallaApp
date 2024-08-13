import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';

class CustomContactDetailesCard extends StatelessWidget {
  final String title;
  final Widget content;
  const CustomContactDetailesCard(
      {super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 30.w,
        ),
        SizedBox(
          width: 0.35.sw,
          child: Text(
            title,
            textAlign: TextAlign.start,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(color: AppColors.primary, fontSize: 16.sp),
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 3,
          ),
        ),
        content
      ],
    );
  }
}
