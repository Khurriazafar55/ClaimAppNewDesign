// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ReportClims extends StatefulWidget {
  static const routeName = "/Report";

  final TabController controller;
  const ReportClims({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ReportClims> createState() => _ReportClimsState();
}

class _ReportClimsState extends State<ReportClims> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      BackGroundColor1(),
      Container(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Center(
                child: Text(
              'No Report has been created',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
              ),
            )),
            SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 45.0,
              width: 190.0,
              child: Padding(
                  padding: const EdgeInsets.only(
                    top: 2.0,
                  ),
                  child: Container(
                      child: InkWell(
                    child: Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        color: ThemeColors.orange_button,
                        border: Border.all(
                          color: Colors.white,
                        ),
                        borderRadius: BorderRadius.circular(24.0),
                      ),
                      child: const Center(
                          child: Text(
                        'Creat Report',
                        style: TextStyle(color: Colors.white),
                      )),
                    ),
                    onTap: () {},
                  ))),
            ),
          ],
        ),
      )
    ]));
  }
}
