import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';

class ProfileTagCard extends StatelessWidget {
  final String jobTitle;
  final void Function()? removeJobTitle;

  const ProfileTagCard(
      {super.key, required this.jobTitle, this.removeJobTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32.w),
        color: Theme.of(context).inputDecorationTheme.fillColor,
      ),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 10.w,
        children: [
          Text(
            jobTitle,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          IconButton(
              onPressed: removeJobTitle,
              icon: Icon(Icons.remove_circle_outline,
                  size: 24, color: AppColors.errorDark)),
        ],
      ),
    );
  }
}
