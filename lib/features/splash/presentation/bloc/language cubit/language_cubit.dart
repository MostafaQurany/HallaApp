// language_cubit.dart
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class LanguageCubit extends HydratedCubit<Locale> {
  LanguageCubit() : super(WidgetsBinding.instance.platformDispatcher.locale);

  final String _appLanguage = 'appLanguage';

  String? currentLanguage;
  void updateLanguage(Locale locale) => emit(locale);

  @override
  Locale? fromJson(Map<String, dynamic> json) {
    final languageCode = json[_appLanguage];
    return Locale(languageCode);
  }

  @override
  Map<String, dynamic>? toJson(Locale state) {
    return {_appLanguage: state.languageCode};
  }
}
