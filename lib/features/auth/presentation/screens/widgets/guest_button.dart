import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w, left: 8.0.w, top: 8.h),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.transparent,
          foregroundColor:
              AppTheme.isLight(context) ? AppColors.primary : AppColors.white,
          shadowColor: AppColors.transparent,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(1.sw)),
          side: BorderSide(
              color: AppTheme.isLight(context)
                  ? AppColors.primary
                  : AppColors.white),
        ),
        onPressed: () {},
        child: const Text("Guest"),
      ),
    );
  }
}
