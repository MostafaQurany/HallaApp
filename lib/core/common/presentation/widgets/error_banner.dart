import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/constants.dart';
import 'package:halla/core/theme/app_colors.dart';

class OfflineBanner extends StatelessWidget {
  final bool isOffline;

  const OfflineBanner({super.key, required this.isOffline});

  @override
  Widget build(BuildContext context) {
    return AnimatedSlide(
      duration: AppConstants.contactScreenErrorDuration,
      offset: isOffline ? const Offset(-1, 0) : Offset.zero, // Slide in/out
      child: !isOffline
          ? Material(
              elevation: 4,
              color: AppColors.errorDarkBackground,
              child: Container(
                width: double.infinity,
                height: 50.h,
                padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 8.w),
                child: Row(
                  children: [
                    const Icon(Icons.wifi_off, color: Colors.white),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        "You are offline. Check your connection.",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
            )
          : SizedBox(),
    );
  }
}
