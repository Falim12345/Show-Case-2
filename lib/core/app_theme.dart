import 'package:flutter/material.dart';
import 'package:flutter_showcase_2/core/app_colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    background: AppColors.lightThemePrimaryColor,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    background: AppColors.darkThemePrimaryColor,
  ),
);
