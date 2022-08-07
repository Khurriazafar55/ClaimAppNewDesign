import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextThemes {
  TextThemes._();

  static String circulat_std_black = "circulat_std_black";
  static String circulat_std_bold = "circulat_std_bold";
  static String circulat_std_book1 = "circulat_std_book1";
  static String circulat_std_book2 = "circulat_std_book2";
  static String circulat_medium = "circulat_medium";

  static var app_bar_title = TextStyle(
      fontSize: 22,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 1);

  static var button_text = TextStyle(
      fontSize: 19,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      letterSpacing: 1);

  static var textformfield_lable = TextStyle(
      fontSize: 20,
      // wordSpacing: 12,
      fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w600,
      letterSpacing: 1);

  static var textformfield_hint = TextStyle(
      fontSize: 20,
      // wordSpacing: 12,
      fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w600,
      letterSpacing: 1);

  // Description
  static var heading_01 = TextStyle(
      fontSize: 25,
      fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.5);

  static var heading_02 = TextStyle(
      fontSize: 22,
      // wordSpacing: 12,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w500,
      letterSpacing: 2);

  static var heading_03 = TextStyle(
      fontSize: 19,
      // wordSpacing: 12,
      fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w600,
      height: 1);

  //Dialog Normal Text
  static var heading_04 = TextStyle(
      fontSize: 18,
      // wordSpacing: 12,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w500,
      letterSpacing: 1);

  // Description
  static var heading_05 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w500,
      letterSpacing: 1);

  ///TextFormField
  static var heading_06 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,

      fontFamily: circulat_medium,
      fontWeight: FontWeight.w500,
      letterSpacing: 1);

  static var heading_07 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w500,
      letterSpacing: 1);
  static var heading_08 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w500,
      letterSpacing: 1);

  static var subtitle_01 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      // fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w700,
      color: Colors.white,
      letterSpacing: 2);

  static var subtitle_02 = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      // fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w700,
      color: ThemeColors.primary_dark_lt,
      letterSpacing: 2);

  static var caption = TextStyle(
      fontSize: 16,
      // wordSpacing: 12,
      // fontFamily: circulat_std_bold,
      fontWeight: FontWeight.w700,
      color: ThemeColors.primary_dark_lt,
      letterSpacing: 2);

  static var bodyText_01 = TextStyle(
      fontSize: 19,
      // wordSpacing: 12,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w400,
      letterSpacing: 1);

  static var bodyText_02 = TextStyle(
      fontSize: 18,
      // wordSpacing: 12,
      fontFamily: circulat_medium,
      fontWeight: FontWeight.w400,
      letterSpacing: 1);

  static var overline = TextStyle(
      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.grey[500]);

  static final textThemeLT = TextTheme(
    headline1: heading_01.copyWith(color: ThemeColors.headline1_color_lt),
    headline2: heading_02.copyWith(color: ThemeColors.headline2_color_lt),
    headline3: heading_03.copyWith(color: ThemeColors.headline3_color_lt),
    headline4: heading_04.copyWith(color: ThemeColors.headline4_color_lt),
    headline5: heading_05.copyWith(color: ThemeColors.headline5_color_lt),
    headline6: heading_06.copyWith(color: ThemeColors.headline7_color_lt),
    subtitle1: subtitle_01.copyWith(color: ThemeColors.subtitle1_color_lt),
    subtitle2: subtitle_02.copyWith(color: ThemeColors.subtitle2_color_lt),
    bodyText1: bodyText_01.copyWith(color: ThemeColors.bodyText1_color_lt),
    bodyText2: bodyText_02.copyWith(color: ThemeColors.bodyText2_color_lt),
    caption: caption.copyWith(color: ThemeColors.caption_color_lt),
    overline: overline.copyWith(color: ThemeColors.overline_color_lt),
  );
}
