import 'package:claim_core/claim/screens/calim_tab/report_claim_tab/home_report_claim.dart';
import 'package:claim_core/claim/screens/calim_tab/report_claim_tab/info_claim_report.dart';
import 'package:claim_core/claim/screens/calim_tab/report_claim_tab/menue_claim_report.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:flutter/material.dart';

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
  bool isSelected = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BackGroundColor1(),
          DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                  tabs: [
                    ReusableContainer1(Icons.info_outline_rounded),
                    ReusableContainer1(Icons.home),
                    ReusableContainer1(Icons.list),
                  ],
                  indicator: BoxDecoration(
                      color: const Color.fromARGB(255, 214, 30, 16),
                      borderRadius: BorderRadius.circular(10.0)),
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor:
                      isSelected ? Colors.yellow : Colors.blue,
                ),
                const Expanded(
                  child: TabBarView(
                    children: [
                      InformationReport(),
                      HomeReport(),
                      MenueReport(),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget ReusableContainer1(icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        height: 40,
        width: 40,
        child: Center(
          child: Icon(
            icon,
            color: Colors.black,
            size: 27,
          ),
        ),
      ),
    );
  }
}
