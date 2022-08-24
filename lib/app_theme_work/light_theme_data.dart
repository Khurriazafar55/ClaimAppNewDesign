import 'package:claim_core/app_theme_work/text_themes.dart';
import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/material.dart';

class LightThemeData {
  LightThemeData._();

  static const border_radius = const BorderRadius.all(Radius.circular(5));
  static double border_width = 2;

  static final light_theme = ThemeData(
      backgroundColor: ThemeColors.background_color_lt,
      primaryColorDark: ThemeColors.primary_dark_lt,
      scaffoldBackgroundColor: ThemeColors.scaffold_color_lt,
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: ThemeColors.primary_dark_lt,
      ),
      colorScheme: const ColorScheme(
        primary: ThemeColors.primary_light_lt,
        secondary: ThemeColors.primary_dark_lt,
        surface: Colors.grey,
        background: Colors.white,
        error: Colors.white,
        onPrimary: ThemeColors.primary_light_lt,
        onSecondary: ThemeColors.primary_dark_lt,
        onSurface: Colors.white,
        onBackground: Colors.black87,
        onError: ThemeColors.primary_yellow_lt,
        brightness: Brightness.light,
      ),
      textTheme: TextThemes.textThemeLT,
      textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(ThemeColors.primary_dark_lt),
        elevation: MaterialStateProperty.all(2),
        textStyle: MaterialStateProperty.all(
          TextThemes.app_bar_title,
        ),
      )),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: ThemeColors.textformback_color_lt, // background
          border: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: border_width,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: ThemeColors.primary_dark_lt,
              width: border_width,
            ),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.grey,
              width: border_width,
            ),
          )),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            elevation: 0,
            primary: ThemeColors.elevated_button_back_color_lt,
            textStyle:
                const TextStyle(fontSize: 25, fontWeight: FontWeight.w700)),
      ),
      appBarTheme: AppBarTheme(
          backgroundColor: ThemeColors.appbar_color_lt,
          elevation: 1,
          iconTheme: const IconThemeData(
            color: Colors.white,
            size: 28,
          ),
          titleTextStyle: TextThemes.app_bar_title,
          actionsIconTheme: const IconThemeData(
            color: Colors.white,
            size: 28,
          )),
      cardTheme: CardTheme(
        color: Colors.grey[200],
        elevation: 0,
        // shape: BoxShape.rectangle
      ),
      iconTheme: const IconThemeData(color: Colors.black87, size: 25));
}
