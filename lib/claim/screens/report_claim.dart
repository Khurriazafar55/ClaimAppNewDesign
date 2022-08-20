// ignore_for_file: public_member_api_docs, sort_constructors_first
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
    return Scaffold();
  }
}
