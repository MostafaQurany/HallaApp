import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';

import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/features/profile/presentation/screens/widgets/custom_share_contact_icon.dart';

class ProfileAppBar extends StatefulWidget {
  const ProfileAppBar({super.key});

  @override
  State<ProfileAppBar> createState() => _ProfileAppBarState();
}

class _ProfileAppBarState extends State<ProfileAppBar> {
  bool showPinCode = false;
  User? user;
  @override
  void initState() {
    super.initState();
    user = UserCubit.get(context).user;
  }

  @override
  Widget build(BuildContext context) {
    user!.id = '0scUQ8KkcySnE5F5edDia1uP6r82';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CircleAvatar(
          radius: 30.w,
          backgroundImage: AssetImage(
            AppImages.profilePlaceholder,
          ),
          backgroundColor: Colors.transparent,
        ),
        Expanded(
          flex: 5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.fullName ?? 'Guest',
                style: Theme.of(context).textTheme.bodyMedium,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: true,
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
                      child: Text(user?.pinCode ?? '000000'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          flex: 1,
          child: CustomShareContactIcon(
            userId: user?.id ?? '',
            iconColor: AppColors.primary,
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
