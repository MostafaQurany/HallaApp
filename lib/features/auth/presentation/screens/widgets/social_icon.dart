import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';

class SocialIcon extends StatelessWidget {
  final String image;
  final bool isSvg;
  final Function() onTap;

  const SocialIcon({
    super.key,
    required this.image,
    required this.onTap,
    this.isSvg = true,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 50.w,
        height: 50.w,
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
          color: AppTheme.isLight(context)
              ? AppColors.primaryObesty
              : AppColors.blackLight,
          borderRadius: BorderRadius.all(Radius.circular(8.w)),
        ),
        child: (isSvg)
            ? SvgPicture.asset(
                image,
              )
            : Image(
                image: AssetImage(image),
              ),
      ),
    );
  }
}
