import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/home/presentation/screens/components/end_spacer_sized_box.dart';
import 'package:halla/features/profile/presentation/screens/components/profile_app_bar.dart';
import 'package:halla/features/profile/presentation/screens/widgets/custom_profile_buttom.dart';
import 'package:halla/features/profile/presentation/screens/widgets/custom_profile_log_out_buttom.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18.h),
          child: ListView(
            children: [
              SizedBox(
                height: 45.h,
              ),
              const ProfileAppBar(),
              SizedBox(
                height: 30.h,
              ),
              CustomProfileButtom(
                icon: AppImages.personalIcon,
                name: "Change Profile",
                onTap: () {},
              ),
              CustomProfileButtom(
                icon: AppImages.emptyHeart,
                name: "Favorite Contacts",
                onTap: () {},
              ),
              CustomProfileButtom(
                icon: AppImages.pincodeChangeIcon,
                name: "Change Security Code",
                onTap: () {},
              ),
              CustomProfileButtom(
                icon: AppImages.promotionsIcon,
                name: "Promotions",
                onTap: () {},
              ),
              CustomProfileButtom(
                icon: AppImages.customerServiceIcon,
                name: "Customer Service",
                onTap: () {},
              ),
              CustomProfileButtom(
                icon: AppImages.settingsIcon,
                name: "Settings",
                onTap: () {},
              ),
              SizedBox(
                height: 10.h,
              ),
              const CustomProfileLogOutButtom(),
              const EndSpacerSizedBox(),
            ],
          ),
        ),
      ),
    );
  }
}
