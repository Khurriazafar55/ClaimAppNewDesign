import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

import '../../app_theme_work/widgets_reusing.dart';
import '../../claim/screens/screen_my_claims.dart';
import '../../dashboard/screens/screen_dashboard.dart';

class ResusableBottomNavBar extends StatefulWidget {
  ResusableBottomNavBar({Key? key, this.onTap}) : super(key: key);

  void Function()? onTap;

  @override
  State<ResusableBottomNavBar> createState() => _ResusableBottomNavBarState();
}

class _ResusableBottomNavBarState extends State<ResusableBottomNavBar> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
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
                  //  _drawerKey.currentState!.openDrawer();
                  widget.onTap;
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
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      ConstantFunctions.OpenNewActivity(DashBoardScreen()),
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
                  Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(const MyClaimsScreen()),
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
      ),
    );
  }
}
