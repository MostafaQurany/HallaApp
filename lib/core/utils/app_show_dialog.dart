import 'package:flutter/material.dart';

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
}
