import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';

class CustomNfcCloseError extends StatefulWidget {
  final AnimationController slideTransitionController;
  final Animation<Offset> animationOffset;
  const CustomNfcCloseError({
    super.key,
    required this.slideTransitionController,
    required this.animationOffset,
  });

  @override
  State<CustomNfcCloseError> createState() => _CustomNfcCloseErrorState();
}

class _CustomNfcCloseErrorState extends State<CustomNfcCloseError> {
  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: widget.animationOffset,
      child: Center(
        child: Container(
          width: 344.w,
          height: 48.h,
          decoration: BoxDecoration(
            color: AppTheme.isLight(context)
                ? AppColors.errorLight
                : AppColors.errorDark,
            border: Border(
              left: BorderSide(
                color: AppColors.errorborder,
                width: 10.w,
              ),
            ),
            borderRadius: BorderRadius.circular(5.w),
          ),
          padding: EdgeInsetsDirectional.symmetric(horizontal: 6.w),
          margin: EdgeInsets.only(top: 50.h, bottom: 50.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Please open NFC",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.gray,
                      fontSize: 15.sp,
                    ),
              ),
              Row(
                children: [
                  TextButton(
                    onPressed: () {
                      AppSettings.openAppSettingsPanel(
                          AppSettingsPanelType.nfc);
                    },
                    child: Text(
                      "Open",
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: AppColors.gray,
                            fontSize: 15.sp,
                          ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
