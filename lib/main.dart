import "package:firebase_core/firebase_core.dart";
import "package:flutter/material.dart";
import "package:flutter_localizations/flutter_localizations.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/theme/theme.dart";
import "package:halla/features/auth/presentation/screens/auth_screen.dart";
import "package:halla/generated/l10n.dart";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //firebase
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, Widget? child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Halla",
        locale: const Locale("en"),
        localizationsDelegates: const <LocalizationsDelegate>[
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: S.delegate.supportedLocales,
        theme: AppTheme.lightTheme,
        home: const AuthScreen(),
      ),
    );
}
