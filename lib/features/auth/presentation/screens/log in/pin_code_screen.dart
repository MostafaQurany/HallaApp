import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/features/auth/presentation/screens/log%20in/bodys/pin_code_body.dart";
import "package:halla/generated/l10n.dart";

class PinCodeScreen extends StatelessWidget {
  const PinCodeScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          title: Text(
            S.of(context).enterPinCodePassword,
            style: Theme.of(context).textTheme.bodyMedium,
            textAlign: TextAlign.center,
          ),
          centerTitle: true,
        ),
        body: Stack(
          children: <Widget>[
            Align(
              alignment: AlignmentDirectional.bottomCenter,
              child: Container(
                width: double.maxFinite,
                height: 0.8.sh,
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
            Center(
              child: PinCodeBody(),
            ),
          ],
        ),
      );
}
