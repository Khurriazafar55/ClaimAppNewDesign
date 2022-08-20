import 'dart:ui';

import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/screens/contact_claim.dart';
import 'package:claim_core/claim/screens/details_claim.dart';
import 'package:claim_core/claim/screens/file_claim.dart';
import 'package:claim_core/claim/screens/notes_claim.dart';
import 'package:claim_core/claim/screens/report_claim.dart';
import 'package:claim_core/dashboard/screens/screen_dashboard.dart';
import 'package:claim_core/sidebar/screens/screen_drawer.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class ClaimMainPage extends StatefulWidget {
  @override
  _ClaimMainPageState createState() => _ClaimMainPageState();
}

class _ClaimMainPageState extends State<ClaimMainPage>
    with SingleTickerProviderStateMixin {
  // list of Tabs
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Contacts'),
    const Tab(text: 'Detail'),
    const Tab(text: 'Files'),
    const Tab(text: 'Notes'),
    const Tab(text: 'Report'),
  ];
  TabController? _tabController;

  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(
        length: myTabs.length, vsync: this, initialIndex: _selectedIndex);

    _tabController?.addListener(() {
      setState(() {
        _selectedIndex = _tabController!.index;
      });

      print("Selected Index: ${_tabController!.index}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _drawerKey, drawer: ScreenDrawer(), body: GetBody());
  }

  Widget GetBody() {
    return Container(
        color: ThemeColors.background_color,
        child: Container(
            margin: const EdgeInsets.only(left: 0, right: 0, top: 10),
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                ClaimBar(),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Container(
                      height: MediaQuery.of(context).size.height / 1.3,
                      margin: const EdgeInsets.only(left: 0, right: 0),
                      decoration: BoxDecoration(
                          // color: ThemeColors.background_color,
                          borderRadius: BorderRadius.circular(10)),
                      child: Container(
                        // margin:
                        //     EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: SingleChildScrollView(
                            child: Column(
                          children: [
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 1.32,
                                width: MediaQuery.of(context).size.width,
                                // color: Colors.amber,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(
                                          left: 20, right: 20),
                                      child: TabBar(
                                        controller: _tabController,
                                        isScrollable: true,
                                        tabs: myTabs,
                                        labelColor: Colors.pink,
                                        // indicatorWeight: 2.0,
                                        // indicatorColor: Colors.redAccent,
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        unselectedLabelColor: Colors.grey,
                                      ),
                                    ),
                                    // TabBar(
                                    //   controller: _tabController,
                                    //   isScrollable: true,
                                    //   tabs: myTabs,
                                    //   labelColor: Colors.pink,
                                    //   // indicatorWeight: 2.0,
                                    //   // indicatorColor: Colors.redAccent,
                                    //   indicatorSize: TabBarIndicatorSize.tab,
                                    //   unselectedLabelColor: Colors.grey,
                                    // ),
                                    // SizedBox(
                                    //   height: 10,
                                    // ),
                                    const Divider(
                                      thickness: 1,
                                      color: Colors.white,
                                      endIndent: 20,
                                      indent: 20,
                                    ),
                                    Expanded(
                                      child: TabBarView(
                                        controller: _tabController,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          ContactClaims(
                                            controller: _tabController!,
                                          ),
                                          DetailClaims(
                                            controller: _tabController!,
                                          ),
                                          FilesClaims(
                                            controller: _tabController!,
                                          ),
                                          NotesClaims(
                                            controller: _tabController!,
                                          ),
                                          ReportClims(
                                            controller: _tabController!,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                )),
                          ],
                        )),
                      ),
                    ),
                  ])),
                ),
                Container(
                  // color: Colors.black,
                  margin: const EdgeInsets.only(left: 10, right: 10),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                  child: Container(
                    //  width: double.infinity,
                    // height: 120,

                    margin:
                        const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    decoration: WidgetsReusing.getListBoxDecoration(),

                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        InkWell(
                          onTap: () {
                            _drawerKey.currentState!.openDrawer();
                          },
                          child: Container(
                            padding: const EdgeInsets.all(10),
                            // margin: const EdgeInsets.only(left: 15),
                            child: const Icon(
                              Icons.menu,
                              size: 30,
                              color: Color.fromRGBO(255, 102, 0, 1),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                ConstantFunctions.OpenNewActivity(
                                    DashBoardScreen()),
                              );
                            },
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  shape: BoxShape.circle,
                                  boxShadow: [
                                    BoxShadow(
                                        color: Color.fromRGBO(255, 102, 0, 1),
                                        spreadRadius: 2),
                                    BoxShadow(
                                        color: Color.fromRGBO(255, 102, 0, 1),
                                        // color: Colors.black.withOpacity(.25),
                                        offset: Offset(1, 1),
                                        blurRadius: 5,
                                        spreadRadius: 1)
                                  ]),
                              child: const Icon(
                                Icons.home,
                                size: 30,
                                color: Color.fromRGBO(255, 102, 0, 1),
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () async {
                            // Navigator.push(
                            //   context,
                            //   ConstantFunctions.OpenNewActivity(
                            //       const ScreenMyClaims()),
                            // );
                          },
                          child: const Icon(
                            Icons.list_alt,
                            size: 30,
                            color: Color.fromRGBO(255, 102, 0, 1),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            )));
  }

  Widget ClaimBar() {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              color: ThemeColors.background_color,
            ),
            // color: Color.fromRGBO(255, 102, 0, 1),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 15),
            // decoration: WidgetsReusing.getListBoxDecoration(),
            child: const Icon(
              Icons.format_paint,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'New Claim',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              color: ThemeColors.background_color,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            // decoration: WidgetsReusing.getListBoxDecoration(),
            child: const Icon(
              Icons.format_paint,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  @override
  void controllTabPosition(int position) {
    setState(() {
      _tabController!.index = position;
    });
  }
}
