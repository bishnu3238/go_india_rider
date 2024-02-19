import 'package:flutter/material.dart';
import 'package:package/package.dart';

final darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: kDarkDeep,
    brightness: Brightness.dark,
  ),
  brightness: Brightness.dark,
);
final lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  colorScheme: ColorScheme.fromSeed(
    seedColor: kBlue,
    brightness: Brightness.light,
  ),
  brightness: Brightness.light,
);
