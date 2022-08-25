import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/models/model_get_claim_id.dart';
import 'package:claim_core/claim/screens/calim_tab/contact_claim.dart';
import 'package:claim_core/claim/screens/calim_tab/details_claim.dart';
import 'package:claim_core/claim/screens/calim_tab/file_claim.dart';
import 'package:claim_core/claim/screens/calim_tab/notes_claim.dart';
import 'package:claim_core/claim/screens/calim_tab/photo_claim.dart';
import 'package:claim_core/claim/screens/calim_tab/report_claim.dart';
import 'package:claim_core/claim/screens/my_claims.dart';

import 'package:claim_core/dashboard/screens/screen_dashboard.dart';
import 'package:claim_core/sidebar/screens/screen_drawer.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class ClaimMainPage extends StatefulWidget {
  final DataSingleClaim? claim;
  final String claimId;
  const ClaimMainPage({
    Key? key,
    this.claim,
    required this.claimId,
  }) : super(key: key);
  @override
  _ClaimMainPageState createState() => _ClaimMainPageState();
}

class _ClaimMainPageState extends State<ClaimMainPage>
    with SingleTickerProviderStateMixin {
  Future<ModelGetClaimId>? future_get_claimId;
  // list of Tabs
  final List<Tab> myTabs = <Tab>[
    const Tab(text: 'Contacts'),
    const Tab(text: 'Detail'),
    const Tab(text: 'Files'),
    const Tab(text: 'Notes'),
    const Tab(text: 'Report'),
    const Tab(text: 'Photo'),
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
                ClaimBar('Claim #${widget.claim!.claimId}'),
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
                          color: ThemeColors.background_color,
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
                                        // tabs: myTabs,
                                        tabs: [
                                          ReusableContainer1('Contacts'),
                                          ReusableContainer1('Detail'),
                                          ReusableContainer1('Files'),
                                          ReusableContainer1('Notes'),
                                          ReusableContainer1('Report'),
                                          ReusableContainer1('Photo'),
                                        ],
                                        labelColor: Colors.white,
                                        // indicatorWeight: 2.0,
                                        indicatorColor: Colors.redAccent,
                                        indicatorSize: TabBarIndicatorSize.tab,
                                        unselectedLabelColor: Colors.grey,
                                      ),
                                    ),
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
                                            claim: widget.claim,
                                            claimId: widget.claim!.claimId!,
                                          ),
                                          DetailClaims(
                                            controller: _tabController!,
                                            claim: widget.claim,
                                            claimId: widget.claim!.claimId!,
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
                                          PhotoClaims(
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

                // Container(
                //     height: 400,
                //     child: Column(
                //       children: [Text('${widget.claim!.adjusterEmail}')],
                //     )),
                Container(
                  color: const Color(0xFff9C699),
                  child: Container(
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
                    child: Container(
                      //  width: double.infinity,
                      // height: 120,

                      margin: const EdgeInsets.symmetric(
                          horizontal: 0, vertical: 10),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 5),
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
                )
              ],
            )));
  }

  Widget ClaimBar(text) {
    return Container(
      color: ThemeColors.background_color,
      child: Row(
        children: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => const MyClaims(),
                ),
              );
            },
            child: Container(
              decoration: const BoxDecoration(
                color: ThemeColors.background_color,
              ),
              // color: Color.fromRGBO(255, 102, 0, 1),
              padding: const EdgeInsets.all(10),
              margin: const EdgeInsets.only(left: 15),
              // decoration: WidgetsReusing.getListBoxDecoration(),
              child: const Icon(
                Icons.arrow_back,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                text,
                style: const TextStyle(
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
                Icons.note_alt_outlined,
                size: 30,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void controllTabPosition(int position) {
    setState(() {
      _tabController!.index = position;
    });
  }

  Widget ReusableContainer1(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        height: 35,
        width: MediaQuery.of(context).size.width / 5,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
