import "package:flutter/material.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/screens/sign%20in/sign_screen.dart";
import "package:halla/generated/l10n.dart";

class RegisterButton extends StatelessWidget {
  const RegisterButton({super.key});

  @override
  Widget build(BuildContext context) => ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.transparent,
        foregroundColor: AppColors.primary,
        shadowColor: AppColors.transparent,
        side: BorderSide(color: AppColors.primary),
      ),
      onPressed: () {
        navigatePush(context, const SignScreen());
      },
      child: Text(S.of(context).registerNow),
    );
}
