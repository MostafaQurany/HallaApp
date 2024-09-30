import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';

class FavoriteContainerDecoration extends StatelessWidget {
  final Widget widget;
  const FavoriteContainerDecoration({
    super.key,
    required this.widget,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: AppTheme.isLight(context)
              ? AppColors.white
              : AppColors.blackLight,
          borderRadius: BorderRadius.circular(8),
          boxShadow: AppTheme.isLight(context)
              ? [
                  BoxShadow(
                    color: AppColors.black.withOpacity(0.3),
                    blurRadius: BorderSide.strokeAlignOutside,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, 1),
                    spreadRadius: 1,
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.grayLight.withOpacity(0.6),
                    blurRadius: BorderSide.strokeAlignOutside,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, 1),
                    spreadRadius: 1,
                  ),
                ],
        ),
        height: 50.h,
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        margin: EdgeInsets.symmetric(
          vertical: 10.h,
        ),
        child: widget);
  }
}
