import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'brightness_state.dart';

class BrightnessCubit extends HydratedCubit<Brightness> {
  BrightnessCubit()
      : super(WidgetsBinding.instance.platformDispatcher.platformBrightness);
  final String _appTheme = 'appTheme';
  @override
  Brightness? fromJson(Map<String, dynamic> json) =>
      json[_appTheme] as Brightness;

  @override
  Map<String, dynamic>? toJson(Brightness state) => {_appTheme: state};
}
