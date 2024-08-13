import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';

class CustomContactDetailesSpacer extends StatelessWidget {
  const CustomContactDetailesSpacer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.isLight(context)
            ? AppColors.primaryObesty
            : AppColors.primary,
      ),
      height: 1.h,
      margin: EdgeInsets.symmetric(vertical: 15.h),
    );
  }
}
