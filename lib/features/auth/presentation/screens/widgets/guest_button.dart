import "package:flutter/material.dart";
import "package:flutter_bloc/flutter_bloc.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/constants/app_images.dart";
import "package:halla/core/theme/app_colors.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/core/utils/app_show_dialog.dart";
import "package:halla/core/utils/routting.dart";
import "package:halla/features/auth/presentation/blocs/auth%20bloc/auth_bloc.dart";
import "package:halla/features/auth/presentation/screens/log%20in/pin_code_screen.dart";
import "package:halla/features/auth/presentation/screens/widgets/show_guest_pin_code.dart";
import "package:halla/generated/l10n.dart";
import "package:lottie/lottie.dart";

class GuestButton extends StatelessWidget {
  const GuestButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthLoading) {
          AppShowDialog.loading(context);
        }
        if (state is AuthFailure) {
          Navigator.pop(context);
          AppShowDialog.showErrorMessage(context, state.message);
        }
        if (state is LogInGuestSucces) {
          Navigator.pop(context);
          AppNavigator.navigatePush(context, const PinCodeScreen());
        }
        if (state is CreatNewGuestSucces) {
          Navigator.pop(context);
          AppShowDialog.scaleAlertDialog(
            context,
            const AlertDialog(
              content: ShowGuestPinCode(),
            ),
          );
        }
        if (state is GuestDeletedSucces) {
          AppShowDialog.scaleAlertDialog(
            context,
            AlertDialog(
              title: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(AppImages.successsLottie,
                      repeat: false, height: 150.h, width: 150.w),
                  Text(S.of(context).success),
                ],
              ),
              content: Text(S.of(context).nowYouCanCreateNewGuestAccount),
              actions: [
                TextButton(
                  child: Text(S.of(context).ok),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        }
      },
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            context.read<AuthBloc>().add(AuthLogInGuestEvent());
          },
          child: Container(
            decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(1.sw),
                border: Border.all(
                  color: AppTheme.isLight(context)
                      ? AppColors.primary
                      : AppColors.white,
                )),
            margin: EdgeInsets.only(right: 0.1.sw, left: 0.03.sw, top: 0.03.sw),
            padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 8.w),
            child: Text(
              S.of(context).guest,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: AppTheme.isLight(context)
                        ? AppColors.primary
                        : AppColors.white,
                  ),
            ),
          ),
        );
      },
    );
  }
}
