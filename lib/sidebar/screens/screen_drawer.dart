import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/screens/screen_my_claims.dart';
import 'package:claim_core/data/database_user.dart';
import 'package:claim_core/data/model_user.dart';
import 'package:claim_core/login/screens/screen_login.dart';
import 'package:claim_core/sidebar/screens/screen_setting.dart';
import 'package:claim_core/sidebar/services/sidebar_service.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
      icon_data1, title1, onTapFirst, icon_data2, title2, onTapSecond) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(onTap: onTapFirst, child: GridContainer(icon_data1, title1)),
        Spacer(),
        InkWell(
          onTap: onTapSecond,
          child: GridContainer(icon_data2, title2),
        )
      ],
    );
  }

  Widget GridContainer(icon_data, title) {
    double width_height = MediaQuery.of(context).size.width / 2.5;
    return Container(
      margin: EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: width_height - 35,
      width: width_height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon_data, size: 50),
          SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0),
      width: MediaQuery.of(context).size.width - 60,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          color: ThemeColors.background_color_lt,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(25),
            bottomRight: Radius.circular(25),
          )),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 60, left: 0, bottom: 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, size: 70, color: Colors.white)),
                SizedBox(height: 15),
                Text("Jason Bourne",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500)),
                Text("Team Lead",
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
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () async {},
                          child: GetMenuList(Icons.person_outline_outlined,
                              "Home", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              ConstantFunctions.OpenNewActivity(
                                  ScreenMyClaims()),
                            );
                          },
                          child: GetMenuList(
                              Icons.list_alt, "My Claims", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {},
                          child: GetMenuList(
                              Icons.calendar_today, "Calendar", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {},
                          child: GetMenuList(Icons.map, "Map", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {},
                          child: GetMenuList(
                              Icons.explore, "Routing", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {},
                          child: GetMenuList(
                              Icons.calendar_today, "Contacts", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {},
                          child: GetMenuList(Icons.calendar_today,
                              "Measure Assist", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {},
                          child: GetMenuList(Icons.calendar_today, "Roof Tools",
                              Colors.black87),
                        ),
                        InkWell(
                          onTap: () {},
                          child: GetMenuList(
                              Icons.calendar_today, "Guides", Colors.black87),
                        ),
                        InkWell(
                          onTap: () {
                            SidebarService.LogoutFunction(
                                    context, modalUser!.bearer)
                                .then(
                              (value) {
                                if (value.status == 200) {
                                  databaseUser.DeleteAllRecord();
                                  ConstantFunctions.OpenNewScreenClean(
                                      context, ScreenLogin());
                                  ConstantFunctions.getSnakeBar(
                                      context, "${value.message}");
                                } else {
                                  ConstantFunctions.getSnakeBar(
                                      context, "${value.message}");
                                }
                                Navigator.pop(context);
                              },
                            );
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
              Navigator.push(
                  context, ConstantFunctions.OpenNewActivity(ScreenSetting()));
            },
            child: GetMenuList(Icons.settings, "Setting", Colors.black87),
          ),
          SizedBox(height: 30)
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

  Widget GetMenuListKardaanPay(String image_path, String title, wallet_amount) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.transparent,
            child: Image.asset(image_path),
          ),
        ),
        Expanded(
          child: Text(
            title,
            style: TextStyle(fontSize: 17),
          ),
        ),
        Text(
          "Rs. 0",
          style: TextStyle(
              fontSize: 17, fontWeight: FontWeight.w600, color: Colors.black),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        )
      ],
    );
  }

  Widget GetMenuList(IconData iconData, String title, Color _color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 10, top: 7, bottom: 7),
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
          child: Text(title,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.black87,
                  fontSize: 19,
                  fontWeight: FontWeight.w500)),
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
