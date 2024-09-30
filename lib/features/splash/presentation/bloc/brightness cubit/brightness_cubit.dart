// brightness_cubit.dart
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class BrightnessCubit extends HydratedCubit<ThemeMode> {
  BrightnessCubit() : super(ThemeMode.system);
  final String _appTheme = 'appTheme';

  void updateTheme(ThemeMode theme) => emit(theme);

  @override
  ThemeMode? fromJson(Map<String, dynamic> json) {
    final themeModeString = json[_appTheme];
    switch (themeModeString) {
      case 'system':
        return ThemeMode.system;
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return null;
    }
  }

  @override
  Map<String, dynamic>? toJson(ThemeMode state) {
    switch (state) {
      case ThemeMode.system:
        return {_appTheme: 'system'};
      case ThemeMode.light:
        return {_appTheme: 'light'};
      case ThemeMode.dark:
        return {_appTheme: 'dark'};
      default:
        return null;
    }
  }
}
