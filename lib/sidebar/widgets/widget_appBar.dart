import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

AppBar buildAppBar(BuildContext context, String title) {
  // final isDarkMode = Theme.of(context).brightness == Brightness.dark;
  // final icon = CupertinoIcons.moon_stars;

  return AppBar(
    title: Text(
      title,
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    leading: BackButton(
      color: Colors.black,
      onPressed: () => Navigator.pop(context),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0,
    // actions: [
    //   ThemeSwitcher(
    //     builder: (context) => IconButton(
    //       icon: Icon(icon),
    //       onPressed: () {
    //         final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;
    //
    //         final switcher = ThemeSwitcher.of(context)!;
    //         switcher.changeTheme(theme: theme);
    //       },
    //     ),
    //   ),
    // ],
  );
}
