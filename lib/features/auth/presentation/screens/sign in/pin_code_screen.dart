import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/auth/presentation/screens/sign%20in/bodys/pin_code_body.dart';

class PinCodeScreen extends StatefulWidget {
  const PinCodeScreen({super.key});

  @override
  State<PinCodeScreen> createState() => _PinCodeScreenState();
}

class _PinCodeScreenState extends State<PinCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'Verification Code',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 1.sh,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.1),
                    blurRadius: 1.sh,
                  ),
                ],
              ),
              child: Image.asset(
                AppTheme.isLight(context)
                    ? AppImages.loginSignBackgroundLight
                    : AppImages.loginSignBackgroundDark,
                fit: BoxFit.fill,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: Image.asset(
                      AppImages.pinCodeVector,
                      height: 100.h,
                    ),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  const PinCodeBody(),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
