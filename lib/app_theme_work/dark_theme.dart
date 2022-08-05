import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DarkThemeData {
  DarkThemeData._();

  static final dark_theme = ThemeData(
    iconTheme: IconThemeData(),
    scaffoldBackgroundColor: ThemeColors.scaffold_colordt,
    appBarTheme: AppBarTheme(
      backgroundColor: ThemeColors.appbar_colordt,
      elevation: 1,
    ),
  );
}
