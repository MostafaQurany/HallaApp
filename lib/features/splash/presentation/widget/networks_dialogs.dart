import 'package:flutter/material.dart';
import 'package:halla/features/splash/presentation/screens/splash_screen.dart';

// Show dialog for online to offline while login.
Future<Widget?> showDialogConnected(BuildContext context) async {
  return await showDialog<Widget>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Online Mode"),
      content: Text("You are online.Reload... "),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, SplashScreen());
          },
          child: Text("Reload"),
        ),
      ],
    ),
  );
}

Future<Widget?> showDialogDesConnected(BuildContext context) async {
  return await showDialog<Widget>(
    context: context,
    builder: (context) => AlertDialog(
      title: Text("Offline Mode"),
      content: Text("You are offline.Do you want to retry ? "),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context, SplashScreen());
          },
          child: Text("Retry"),
        ),
      ],
    ),
  );
}
