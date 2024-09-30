// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/splash/presentation/bloc/language%20cubit/language_cubit.dart';
import 'package:halla/generated/l10n.dart';

class CustomProfileLogOutButtom extends StatefulWidget {
  final Function()? onTap;
  const CustomProfileLogOutButtom({
    super.key,
    this.onTap,
  });

  @override
  State<CustomProfileLogOutButtom> createState() =>
      _CustomProfileLogOutButtomState();
}

class _CustomProfileLogOutButtomState extends State<CustomProfileLogOutButtom> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppTheme.isLight(context)
              ? AppColors.errorLightBackground
              : AppColors.errorIconDark,
          boxShadow: AppTheme.isLight(context)
              ? [
                  BoxShadow(
                    color: AppColors.errorIconLight.withOpacity(0.3),
                    blurRadius: BorderSide.strokeAlignOutside,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, 1),
                    spreadRadius: 1,
                  ),
                ]
              : [
                  BoxShadow(
                    color: AppColors.errorDarkBackground.withOpacity(0.6),
                    blurRadius: BorderSide.strokeAlignOutside,
                    blurStyle: BlurStyle.inner,
                    offset: const Offset(0, 1),
                    spreadRadius: 1,
                  ),
                ],
        ),
        padding: EdgeInsets.symmetric(horizontal: 18.w),
        margin: EdgeInsets.symmetric(vertical: 10.h, horizontal: 5.w),
        child: Row(
          children: [
            Transform.rotate(
              angle: context
                      .read<LanguageCubit>()
                      .state
                      .languageCode
                      .contains('ar')
                  ? -pi
                  : 0,
              child: ImageIcon(
                AssetImage(AppImages.logOutIcon),
                color: AppTheme.isLight(context)
                    ? AppColors.errorIconLight
                    : AppColors.errorDarkBackground,
              ),
            ),
            SizedBox(
              width: 10.w,
            ),
            Text(
              S.of(context).logOut,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppTheme.isLight(context)
                        ? AppColors.errorIconLight
                        : AppColors.errorDarkBackground,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
