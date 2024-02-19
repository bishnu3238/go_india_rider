import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
 import 'theme_state.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(ThemeState.init()) {
    // ThemeX.setThemeX = state.themeMode == ThemeMode.light ? false : true;
  }

  void setTheme(ThemeMode themeMode) {
    // ThemeX.setThemeX = themeMode == ThemeMode.dark;
    emit(state.copyWith(
      themeMode: themeMode,
      isDarkTheme: themeMode == ThemeMode.dark,
    ));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) => ThemeState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(ThemeState state) => state.toMap();
}
