import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:halla/core/common/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/auth/presentation/screens/widgets/login_body.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          'Login',
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
          const LoginBody(),
        ],
      ),
    );
  }
}
