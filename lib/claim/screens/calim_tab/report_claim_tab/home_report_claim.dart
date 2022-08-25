// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../app_theme_work/theme_colors.dart';

class HomeReport extends StatefulWidget {
  // final TabController controller;
  const HomeReport({
    Key? key,
    // required this.controller,
  }) : super(key: key);

  @override
  State<HomeReport> createState() => _HomeReportState();
}

class _HomeReportState extends State<HomeReport> {
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
          child: Text('Home Report View'),
        ),
      ),
    );
  }
}
