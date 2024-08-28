// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';

class CircleImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  const CircleImage({
    super.key,
    required this.imageUrl,
    this.height = 70,
    this.width = 70,
  });

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: height,
        width: width,
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
              child: Lottie.asset(AppImages.loadingLottie))),
      errorWidget: (context, url, error) => Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(AppImages.profilePlaceholder),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
