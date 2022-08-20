// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class DetailClaims extends StatefulWidget {
  static const routeName = "/detail";

  final TabController controller;
  DetailClaims({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<DetailClaims> createState() => _DetailClaimsState();
}

class _DetailClaimsState extends State<DetailClaims> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: ThemeColors.background_color,
            // borderRadius: BorderRadius.circular(20),
          ),
          // margin: EdgeInsets.only(left: 12, right: 12),
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(
                height: 4,
              ),
              Container(
                margin: EdgeInsets.only(left: 15, right: 15),
                decoration: BoxDecoration(
                  color: ThemeColors.primary_light_color1,
                  borderRadius: BorderRadius.circular(20),
                ),
                // height: 520,
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
              )
            ],
          )),
    );
  }
}
