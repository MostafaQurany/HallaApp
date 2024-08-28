import "package:flutter/material.dart";

class AppNavigator {
  static navigatePushReplace(BuildContext context, Widget page) {
    Navigator.of(context).pushReplacement(_animation(page));
  }

  static void navigatePushReplaceRemoveAll(
    BuildContext context,
    Widget page,
  ) {
    Navigator.of(context).pushAndRemoveUntil(
      _animation(page),
      (Route route) => false,
    );
  }

  static void navigatePush(BuildContext context, Widget page) {
    Navigator.of(context).push(_animation(page));
  }

  static void navigatePop(BuildContext context) {
    Navigator.of(context).pop();
  }

  static _animation(Widget page) {
    const int time = 500;
    final Animatable<Offset> tween =
        Tween(begin: const Offset(1, 0), end: Offset.zero).chain(
      CurveTween(curve: Curves.easeInOutCirc),
    );
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
              Animation<double> secondaryAnimation) =>
          page,
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        final Animation<Offset> offsetAnimation = animation.drive(tween);

        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
      transitionDuration: const Duration(milliseconds: time),
    );
  }
}
