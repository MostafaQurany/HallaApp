import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:lottie/lottie.dart';

class FitesTimeContact extends StatefulWidget {
  final String name;
  final String image;
  final bool isSelected;
  final VoidCallback onTap;

  const FitesTimeContact({
    super.key,
    required this.name,
    required this.image,
    required this.onTap,
    required this.isSelected,
  });

  @override
  State<FitesTimeContact> createState() => _FitesTimeContactState();
}

class _FitesTimeContactState extends State<FitesTimeContact> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Row(
        children: [
          Container(
            height: 15.h,
            width: 15.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(
                color: AppColors.primary,
                width: 1,
              ),
              color: widget.isSelected ? AppColors.primary : null,
            ),
            child: widget.isSelected
                ? Icon(
                    Icons.check,
                    color: AppColors.white,
                    size: 10.h,
                  )
                : null,
          ),
          SizedBox(
            width: 18.w,
          ),
          Container(
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
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            margin: EdgeInsets.only(bottom: 10.h),
            child: SizedBox(
              width: 295.w,
              child: Row(
                children: [
                  Container(
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      width: 42,
                      height: 42,
                      child: widget.image.isEmpty
                          ? Image.asset(
                              AppImages.profilePlaceholder,
                              fit: BoxFit.cover,
                            )
                          : CachedNetworkImage(
                              imageUrl: widget.image,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              placeholder: (context, url) => Center(
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(16),
                                        color: AppTheme.isLight(context)
                                            ? AppColors.white
                                            : AppColors.blackLight,
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Lottie.asset(
                                          AppImages.loadingLottie))),
                              errorWidget: (context, url, error) => Container(
                                height: 42,
                                width: 42,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        AppImages.profilePlaceholder),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )),
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                      child: Text(
                    widget.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  )),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
