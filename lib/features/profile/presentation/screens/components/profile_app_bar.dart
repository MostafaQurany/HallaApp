import 'package:flutter/material.dart';
import 'dart:ui';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  bool showPinCode = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 33.w,
          backgroundImage: AssetImage(
            AppImages.profilePlaceholder,
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 200.w,
              child: Text(
                "qmostafa200@gmail.com",
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: 100.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  (showPinCode)
                      ? GestureDetector(
                          onTap: _changeShowPinCode,
                          child: Image.asset(
                            AppImages.hidePinCode,
                            height: 16.h,
                          ),
                        )
                      : GestureDetector(
                          onTap: _changeShowPinCode,
                          child: Image.asset(
                            AppImages.showPinCode,
                            height: 16.h,
                          ),
                        ),
                  ImageFiltered(
                      imageFilter: ImageFilter.blur(
                        sigmaX: (showPinCode) ? 0 : 6,
                        sigmaY: (showPinCode) ? 0 : 4,
                      ),
                      child: const Text("000000")),
                ],
              ),
            )
          ],
        ),
        IconButton(
          onPressed: () {
            //TODO :- show qr code
          },
          icon: ImageIcon(
            AssetImage(
              AppImages.shareContact,
            ),
            color: AppColors.primary,
            size: 18.sp,
          ),
        ),
      ],
    );
  }

  _changeShowPinCode() {
    setState(() {
      showPinCode = !showPinCode;
    });
  }
}
