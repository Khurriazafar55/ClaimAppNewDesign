// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/material.dart';

class MenueReport extends StatefulWidget {
  // final TabController controller;
  const MenueReport({
    Key? key,
    // required this.controller,
  }) : super(key: key);

  @override
  State<MenueReport> createState() => _MenueState();
}

class _MenueState extends State<MenueReport> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.headline6_color_lt,
          borderRadius: BorderRadius.circular(7),
        ),
        child: const Center(
          child: Text('Menu Report View'),
        ),
      ),
    );
  }
}
