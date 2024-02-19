import 'package:flutter/material.dart';
import 'package:package/package.dart';

import 'theme_data.dart';

class ThemeState {
  final bool isDarkTheme;
  final ThemeMode themeMode;

  ThemeState({required this.themeMode, this.isDarkTheme = false});

  factory ThemeState.init() => ThemeState(
        themeMode: ThemeMode.system,
        isDarkTheme: false,
      );

  ThemeData get light => lightTheme;
  ThemeData get dark => darkTheme;

  ThemeState copyWith({
    ThemeMode? themeMode,
    bool? isDarkTheme,
  }) =>
      ThemeState(
        themeMode: themeMode ?? this.themeMode,
        isDarkTheme: isDarkTheme ?? this.isDarkTheme,
      );

  Map<String, dynamic> toMap() => {
        'themeMode': themeMode.toString(),
        'isDarkTheme': isDarkTheme.toString(),
      };

  factory ThemeState.fromMap(Map<String, dynamic> map) {

    return ThemeState(
      themeMode: map['themeMode'].toString().theme,
      isDarkTheme: map['isDarkTheme'].toString().toBull,
    );
  }
}
