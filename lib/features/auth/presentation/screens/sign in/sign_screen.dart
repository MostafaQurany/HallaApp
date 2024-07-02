import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/common/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/bodys/sign_body.dart";
import "package:halla/generated/l10n.dart";

class SignScreen extends StatefulWidget {
  const SignScreen({super.key});

  @override
  State<SignScreen> createState() => _SignScreenState();
}

class _SignScreenState extends State<SignScreen> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          S.of(context).register,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Align(
            alignment: AlignmentDirectional.bottomCenter,
            child: Container(
              width: double.maxFinite,
              height: 0.75.sh,
              decoration: BoxDecoration(
                boxShadow: <BoxShadow>[
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
          const SignBody(),
        ],
      ),
    );
}
