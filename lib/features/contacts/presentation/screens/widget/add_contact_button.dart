import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';

class AddContactButton extends StatelessWidget {
  const AddContactButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff989898),
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(8.w),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Icon(
        Icons.add,
        color: AppColors.primary,
        size: 24.sp,
      ),
    );
  }
}
