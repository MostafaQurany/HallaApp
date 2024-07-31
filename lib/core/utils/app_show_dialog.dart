import 'package:flutter/material.dart';
import 'package:halla/core/constants/app_images.dart';
import 'package:lottie/lottie.dart';

class AppShowDialog {
  static scaleAlertDialog(BuildContext context, Widget page) {
    return showGeneralDialog(
      context: context,
      transitionDuration: const Duration(milliseconds: 200),
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
        return AlertDialog(
          content: page,
        );
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
        return Center(child: Lottie.asset(AppImages.loadingLottie));
      },
    );
  }
}
