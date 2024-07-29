import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:lottie/lottie.dart';

class DownloadContactIcon extends StatefulWidget {
  const DownloadContactIcon({super.key});

  @override
  State<DownloadContactIcon> createState() => _DownloadContactIconState();
}

class _DownloadContactIconState extends State<DownloadContactIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Lottie.asset(
          AppImages.downloadContactIcons,
          controller: _controller,
          onLoaded: (composition) {
            _controller.duration = composition.duration;
          },
          height: 60.h,
        ),
        Text(
          '111',
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                color: AppColors.primary,
                fontSize: 9.sp,
              ),
          maxLines: 1,
        ),
      ],
    );
  }
}
