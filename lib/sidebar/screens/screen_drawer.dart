import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/screens/my_claims.dart';
import 'package:claim_core/dashboard/screens/calander_screen.dart';
import 'package:claim_core/dashboard/screens/compass_screen.dart';
import 'package:claim_core/dashboard/screens/contacts_screen.dart';
import 'package:claim_core/dashboard/screens/screen_dashboard.dart';
import 'package:claim_core/dashboard/screens/screen_guide.dart';
import 'package:claim_core/dashboard/screens/screen_measure_assist.dart';
import 'package:claim_core/data/database_user.dart';
import 'package:claim_core/data/model_user.dart';
import 'package:claim_core/login/screens/screen_login.dart';
import 'package:claim_core/screen_map.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/icon_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../settings_screens/settings_screen.dart';
import 'rooftools_screen.dart';

class ScreenDrawer extends StatefulWidget {
  @override
  _ScreenDrawerState createState() => _ScreenDrawerState();
}

class _ScreenDrawerState extends State<ScreenDrawer> {
  ModalUser? modalUser;

  String user_name = "Claim App";
  String user_avatar = "";
  String user_phone = "";

  DatabaseUser databaseUser = DatabaseUser();

  @override
  void initState() {
    super.initState();

    UpdateDataFunction();
  }

  void UpdateDataFunction() {
    databaseUser.initializeDatabase().then((value) {
      databaseUser.GetSingleRecord().then((value) {
        setState(() {
          modalUser = value;

          user_name = value.name == "" ? "Claim App" : value.name;
          user_avatar = value.avatar;
          user_phone = value.phone_number;
        });
      });
    });
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
      margin: const EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: widthHeight - 35,
      width: widthHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 50),
          const SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 0),
      width: MediaQuery.of(context).size.width - 60,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
          color: ThemeColors.background_color,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: ListView(
        children: [
          // const SizedBox(height: 12),
          Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close_outlined, size: 28),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(top: 20, left: 0, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 30),
                const CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 70, color: Colors.white)),
                const SizedBox(height: 15),
                const Text("Jason Bourne",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                const Text("Team Lead",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                ConstantFunctions.GetDivider(
                    Colors.transparent, Colors.grey, 18, 35),
              ],
            ),
          ),

          // naviagation drawer item
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // margin: EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  DashBoardScreen()),
                            );
                          },
                          child: GetMenuList(Icons.person_outline_outlined,
                              "Home", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  const MyClaims()),
                            );
                          },
                          child: GetMenuList(
                              Icons.list_alt, "My Claims", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(CalanderScreen(
                                claim_list: [],
                              )),
                            );
                          },
                          child: GetMenuList(
                              Icons.calendar_today, "Calendar", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(MapScreen()),
                            );
                          },
                          child: GetMenuList(Icons.map, "Map", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  const CompassScreen()),
                            );
                          },
                          child: GetMenuList(
                              Icons.explore, "Routing", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  const ContactsScreen1()),
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 15, right: 10, top: 7, bottom: 7),
                                child: CircleAvatar(
                                  radius: 14,
                                  backgroundColor: Colors.transparent,
                                  child: SvgPicture.asset(
                                    IconAsset.contacts,
                                    color: Colors.black87,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text('Contacts',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline2!
                                        .copyWith(
                                            color: Colors.black87,
                                            fontSize: 19,
                                            fontWeight: FontWeight.w500)),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  const MeasureAssistScreen()),
                            );
                          },
                          child: GetMenuList(Icons.calendar_today,
                              "Measure Assist", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  const RoofToolsScreen()),
                            );
                          },
                          child: GetMenuList(
                              Icons.construction, "Roof Tools", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  const GuideScreen()),
                            );
                          },
                          child: GetMenuList(
                              Icons.calendar_today, "Guides", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  const LoginScreen()),
                            );
                            // SidebarService.LogoutFunction(
                            //         context, modalUser!.bearer)
                            //     .then(
                            //   (value) {
                            //     if (value.status == 200) {
                            //       databaseUser.DeleteAllRecord();
                            //       ConstantFunctions.OpenNewScreenClean(
                            //           context, const LoginScreen());
                            //       ConstantFunctions.getSnakeBar(
                            //           context, value.message);
                            //     } else {
                            //       ConstantFunctions.getSnakeBar(
                            //           context, value.message);
                            //     }
                            //     Navigator.pop(context);
                            //   },
                            // );
                          },
                          child: GetMenuList(
                              Icons.logout, "Logout", Colors.black87),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          InkWell(
            onTap: () {
              Navigator.push(context,
                  ConstantFunctions.OpenNewActivity(const SettingScreen()));
            },
            child: GetMenuList(Icons.settings, "Setting", Colors.black87),
          ),
          const SizedBox(height: 30)
        ],
      ),
    );
  }

  // Future<void> ShowDialogLogout() {
  //   return showDialog(
  //     context: context,
  //     builder: (context) {
  //       return DialogLogout();
  //     },
  //   );
  // }

  Widget GetMenuListKardaanPay(String imagePath, String title, walletAmount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.transparent,
            child: Image.asset(imagePath),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: const TextStyle(fontSize: 17),
          ),
        ),
        const Text(
          "Rs. 0",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget GetMenuList(IconData iconData, String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 10, top: 7, bottom: 7),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.transparent,
            child: Icon(
              iconData,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: Colors.black87,
                fontSize: 19,
                fontWeight: FontWeight.w500),
          ),
        ),
        /* Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        )*/
      ],
    );
  }
}
