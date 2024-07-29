import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/log%20in/pin_code_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/show_guest_pin_code.dart";
import "package:halla/generated/l10n.dart";

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is LogInGuestSucces) {
          AppNavigator.navigatePush(context, const PinCodeScreen());
        }
        if (state is CreatNewGuestSucces) {
          AppShowDialog.scaleAlertDialog(context, const ShowGuestPinCode());
        }
      },
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(right: 8.0.w, left: 8.0.w, top: 8.h),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.transparent,
              foregroundColor: AppTheme.isLight(context)
                  ? AppColors.primary
                  : AppColors.white,
              shadowColor: AppColors.transparent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(1.sw)),
              side: BorderSide(
                color: AppTheme.isLight(context)
                    ? AppColors.primary
                    : AppColors.white,
              ),
            ),
            onPressed: () {
              context.read<AuthBloc>().add(AuthLogInGuestEvent());
            },
            child: Text(S.of(context).guest),
          ),
        );
      },
    );
  }
}
