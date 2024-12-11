import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/domain/entities/user.dart';
import 'package:halla/core/common/presentation/cubit/user/user_cubit.dart';
import 'package:halla/core/common/presentation/widgets/circle_image.dart';
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
  late User user;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserCubit, UserState>(
      builder: (context, state) {
        user = UserCubit.get(context).user!;
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircleImage(
              imageUrl: user.imageUrl,
            ),
            SizedBox(
              width: 10.w,
            ),
            Expanded(
              flex: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.fullName.isEmpty
                        ? user.email.toString()
                        : user.fullName.toString(),
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
                          child: Text(user.pinCode),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (!user.isGuest)
              Expanded(
                flex: 1,
                child: CustomShareContactIcon(
                  userId: user.id,
                  iconColor: AppColors.primary,
                ),
              ),
          ],
        );
      },
    );
  }

  _changeShowPinCode() {
    setState(() {
      showPinCode = !showPinCode;
    });
  }
}
