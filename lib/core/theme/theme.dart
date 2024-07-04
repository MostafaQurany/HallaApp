import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:halla/core/theme/app_colors.dart";

class AppTheme {
  static ThemeData lightTheme = ThemeData.light().copyWith(
    colorScheme: ColorScheme.light(
      primary: AppColors.primary,
      onPrimary: AppColors.black,
    ),
    scaffoldBackgroundColor: AppColors.primeScaffold,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      shadowColor: AppColors.transparent,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData(),
    textTheme: TextTheme(
      headlineLarge: _ibmTextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: _ibmTextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      headlineSmall: _ibmTextStyle(fontSize: 24),
      bodyLarge: _ibmTextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      bodyMedium: _ibmTextStyle(fontSize: 16),
      bodySmall: _ibmTextStyle(),
    ),
    primaryTextTheme: TextTheme(
      headlineLarge: _ibmTextStyle(fontSize: 32, fontWeight: FontWeight.bold),
      headlineMedium: _ibmTextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      headlineSmall: _ibmTextStyle(fontSize: 24),
      bodyLarge: _ibmTextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      bodyMedium: _ibmTextStyle(fontSize: 16),
      bodySmall: _ibmTextStyle(),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.primary,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey),
        gapPadding: 2,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.grey),
        gapPadding: 2,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.primary),
        gapPadding: 2,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    ),
  );

  static ThemeData darkTheme = ThemeData.dark().copyWith(
    colorScheme: ColorScheme.dark(
      primary: AppColors.primary,
      onPrimary: AppColors.white,
    ),
    scaffoldBackgroundColor: AppColors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.transparent,
      elevation: 0,
      shadowColor: AppColors.transparent,
    ),
    elevatedButtonTheme: _elevatedButtonThemeData(),
    textTheme: TextTheme(
      headlineLarge: _ibmTextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      headlineMedium: _ibmTextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      headlineSmall: _ibmTextStyle(
        fontSize: 24,
        color: AppColors.white,
      ),
      bodyLarge: _ibmTextStyle(
          fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w600),
      bodyMedium: _ibmTextStyle(fontSize: 16, color: AppColors.white),
      bodySmall: _ibmTextStyle(color: AppColors.white),
    ),
    primaryTextTheme: TextTheme(
      headlineLarge: _ibmTextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      headlineMedium: _ibmTextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: AppColors.white,
      ),
      headlineSmall: _ibmTextStyle(
        fontSize: 24,
        color: AppColors.white,
      ),
      bodyLarge: _ibmTextStyle(
          fontSize: 18, color: AppColors.white, fontWeight: FontWeight.w600),
      bodyMedium: _ibmTextStyle(fontSize: 16, color: AppColors.white),
      bodySmall: _ibmTextStyle(color: AppColors.white),
    ),
    inputDecorationTheme: InputDecorationTheme(
      iconColor: AppColors.primary,
      prefixIconColor: Colors.grey,
      suffixIconColor: Colors.grey,
      fillColor: AppColors.blackLight,
      filled: true,
      hintStyle: const TextStyle(
        color: Colors.grey,
      ),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.transparent),
        gapPadding: 2,
      ),
      enabledBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: Colors.transparent),
        gapPadding: 2,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        borderSide: BorderSide(color: AppColors.primary),
        gapPadding: 2,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 10),
    ),
  );

  static TextStyle _ibmTextStyle({
    double fontSize = 14.0,
    FontWeight fontWeight = FontWeight.normal,
    FontStyle fontStyle = FontStyle.normal,
    Color color = Colors.black,
  }) =>
      TextStyle(
        fontFamily: "IBM",
        fontSize: fontSize,
        fontWeight: fontWeight,
        fontStyle: fontStyle,
        color: color,
      );

  static ElevatedButtonThemeData _elevatedButtonThemeData() =>
      ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 12.0.h,
          ), // Increase vertical padding
        ),
      );
  static bool isLight(BuildContext context) =>
      Theme.of(context).brightness == Brightness.light;
}
