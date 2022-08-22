import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/screens/screen_my_claims.dart';
import 'package:claim_core/dashboard/screens/compass_screen.dart';
import 'package:claim_core/dashboard/screens/screen_guide.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

import '../../dashboard/screens/dashboard2.dart';
import 'screen_drawer.dart';

class RoofToolsScreen extends StatefulWidget {
  const RoofToolsScreen({Key? key}) : super(key: key);

  @override
  State<RoofToolsScreen> createState() => _RoofToolsScreenState();
}

class _RoofToolsScreenState extends State<RoofToolsScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  late GestureTapCallback onGuideTap;
  late GestureTapCallback onCompass;
  @override
  Widget build(BuildContext context) {
    onCompass = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(const CompassScreen()));
    };
    onGuideTap = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(const GuideScreen()));
    };
    return Scaffold(
      key: _drawerKey,
      body: GetBody(),
      drawer: ScreenDrawer(),
    );
  }

  Widget GetBody() {
    return SafeArea(
      child: Stack(
        children: [
          BackGroundColor(),
          Container(
            margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: InkWell(
                                onTap: () {
                                  Navigator.of(context).pop;
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 94, 0, 1),
                                  ),
                                  // color: Color.fromRGBO(255, 102, 0, 1),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(left: 7),
                                  // decoration: WidgetsReusing.getListBoxDecoration(),
                                  child: const Icon(
                                    Icons.arrow_back,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            const Expanded(
                              flex: 113,
                              child: Center(
                                child: Text(
                                  'Roof Tools',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          child: Column(
                            children: [
                              getGridContainer(
                                Icons.pinch_outlined,
                                "Pitch Finder",
                                onGuideTap,
                                Icons.explore_outlined,
                                "Compass",
                                onCompass,
                              ),
                            ],
                          ),
                        ),
                        // )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            child: Container(
              //  width: double.infinity,
              // height: 120,

              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                      margin: const EdgeInsets.only(left: 15),
                      child: const Icon(
                        Icons.menu,
                        size: 30,
                        color: Color.fromRGBO(255, 102, 0, 1),
                      ),
                    ),
                  ),
                  Expanded(
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
                  InkWell(
                    onTap: () async {
                      Navigator.push(
                        context,
                        ConstantFunctions.OpenNewActivity(
                            const MyClaimsScreen()),
                      );
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
          )
        ],
      ),
    );
  }

  Widget getGridContainer(
      iconData1, title1, onTapFirst, iconData2, title2, onTapSecond) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(onTap: onTapFirst, child: GridContainer(iconData1, title1)),
        const Spacer(),
        InkWell(
          onTap: onTapSecond,
          child: GridContainer(iconData2, title2),
        )
      ],
    );
  }

  Widget GridContainer(iconData, title) {
    double widthHeight = MediaQuery.of(context).size.width / 2.5;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: widthHeight - 35,
      width: widthHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 50,
            color: const Color.fromRGBO(205, 13, 30, 1),
          ),
          const SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
