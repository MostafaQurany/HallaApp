import 'package:flutter/material.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:halla/core/theme/app_colors.dart';
import 'package:halla/core/theme/theme.dart';
import 'package:halla/features/auth/presentation/screens/log%20in/bodys/forget_password_body.dart';
import 'package:halla/features/auth/presentation/screens/widgets/delete_guest_dialog_body.dart';
import 'package:lottie/lottie.dart';

class AppShowDialog {
  bool isLoading = false;

  static const Duration _transitionDuration = Duration(milliseconds: 200);
  static final Color _barrierColor = Colors.black.withOpacity(0.5);
  static scaleAlertDialog(BuildContext context, Widget page) {
    return showGeneralDialog(
      context: context,
      transitionDuration: _transitionDuration,
      barrierColor: _barrierColor,
      transitionBuilder: (context, animation, secondaryAnimation, child) {
        return Transform.scale(
          scale: animation.value,
          child: Opacity(
            opacity: animation.value,
            child: child,
          ),
        );
      },
      pageBuilder: (BuildContext context, Animation animation,
          Animation secondaryAnimation) {
        return page;
      },
    );
  }

  static loading(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return PopScope(
          canPop: false,
          child: Center(
              child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: AppTheme.isLight(context)
                        ? AppColors.white
                        : AppColors.blackLight,
                  ),
                  padding: const EdgeInsets.all(16),
                  child: Lottie.asset(AppImages.loadingLottie))),
        );
      },
    );
  }

  static forgetPassword(
    BuildContext context,
  ) {
    return showDialog(
      context: context,
      builder: (context) {
        return const Dialog(
          child: ForgetPasswordBody(),
        );
      },
    );
  }

  static showHelpSnckPar(
    BuildContext context,
    String message,
  ) {
    final snackBar = SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.grayDark,
      content: Text(message),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showErrorMessage(BuildContext context, String message) {
    final snackBar = SnackBar(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(16),
          right: Radius.circular(16),
        ),
      ),
      behavior: SnackBarBehavior.floating,
      backgroundColor: AppColors.errorDark,
      content: Text(message),
    );

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(snackBar);
  }

  static showConfirmToDeleteGuest(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: widget,
            ),
          );
        },
        pageBuilder: (context, animation1, animation2) {
          return const DeleteGuestDialogBody();
        });
  }

  static showConnectivityFDTC(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: const DeleteGuestDialogBody(),
            ),
          );
        },
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }

  static showConnectivityFCTD(BuildContext context) {
    showGeneralDialog(
        barrierColor: Colors.black.withOpacity(0.5),
        transitionDuration: const Duration(milliseconds: 200),
        barrierDismissible: true,
        barrierLabel: '',
        context: context,
        transitionBuilder: (context, a1, a2, widget) {
          return Transform.scale(
            scale: a1.value,
            child: Opacity(
              opacity: a1.value,
              child: const DeleteGuestDialogBody(),
            ),
          );
        },
        pageBuilder: (context, animation1, animation2) {
          return Container();
        });
  }
}
