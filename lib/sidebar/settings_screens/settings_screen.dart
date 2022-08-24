import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/login/screens/screen_login.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

import 'appearance_screens/appearance_settings_screen.dart';
import 'autofill_screens/autofill_setting_screen.dart';
import 'help_support_screen/help_support_setting_screen.dart';
import 'notification_screens/notification_setting_screen.dart';
import 'security_screens/security_setting_screen.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 87, 34, 1),
      // bottomNavigationBar: ResusableBottomNavBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: ListView(
          children: [
            const Text(
              'Settings',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 14,
            ),
            // InkWell(
            //   onTap: () {
            //     Navigator.push(
            //         context,
            //         ConstantFunctions.OpenNewActivity(
            //             const ScreenProfileSetting()));
            //   },
            //   child: GetMenuList(Icons.person, "Profile", Colors.black87),
            // ),
            // const Divider(
            //     thickness: 1.5,
            //     color: Colors.grey,
            //     endIndent: 20,
            //     indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        const ScreenAutoSetting()));
              },
              child: GetMenuList(
                  Icons.format_list_bulleted, "Autofill", Colors.black87),
            ),
            const Divider(
                thickness: 2,
                color: ThemeColors.headline6_color_lt,
                endIndent: 20,
                indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        const ScreenSettingNotification()));
              },
              child: GetMenuList(Icons.notifications_none_rounded,
                  "Notification", Colors.black87),
            ),
            const Divider(
                thickness: 2,
                color: ThemeColors.headline6_color_lt,
                endIndent: 20,
                indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        const AppearanceScreen()));
              },
              child:
                  GetMenuList(Icons.color_lens, "Appearance", Colors.black87),
            ),
            const Divider(
                thickness: 2,
                color: ThemeColors.headline6_color_lt,
                endIndent: 20,
                indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        const ScreenSettingSecurity()));
              },
              child: GetMenuList(Icons.security, "Security", Colors.black87),
            ),
            const Divider(
                thickness: 2,
                color: ThemeColors.headline6_color_lt,
                endIndent: 20,
                indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        const ScreenSettingHelpSupport()));
              },
              child: GetMenuList(
                  Icons.help_outline, "Help & Support", Colors.black87),
            ),
            const Divider(
                thickness: 2,
                color: ThemeColors.headline6_color_lt,
                endIndent: 20,
                indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(const LoginScreen()));
              },
              child:
                  GetMenuList(Icons.logout_outlined, "Log Out", Colors.black87),
            ),
            // Expanded(
            //   child: Align(
            //       alignment: Alignment.bottomCenter,
            //       child: ResusableBottomNavBar()),
            // ),
            // InkWell(
            //   onTap: () {
            //     ConstantFunctions.getSharePrefModeString("login_token").then(
            //       (login_token) {
            //         RestApiUtils.ShowLoadingDialog(context);
            //         ServiceClaim.GetAllDropDown(context, login_token)
            //             .then((modelAllDropdown) {
            //           Navigator.pop(context);
            //
            //           if (modelAllDropdown.data != null &&
            //               modelAllDropdown.data!.length > 0) {
            //             Navigator.push(
            //                 context,
            //                 ConstantFunctions.OpenNewActivity(ScreenReports(
            //                     modelAllDropdown: modelAllDropdown)));
            //           } else {
            //             ConstantFunctions.getSnakeBar(
            //                 context, "Drop down values getting failed");
            //           }
            //         });
            //       },
            //     );
            //   },
            //   child: GetMenuList(Icons.headset, "Reports", Colors.black87),
            // ),
            // Divider(
            //   thickness: 1.5,
            //   color: Colors.grey,
            //   endIndent: 20,
            //   indent: 20,
            // ),

            // const Divider(
            //   thickness: 1.5,
            //   color: Colors.grey,
            //   endIndent: 20,
            //   indent: 20,
            // ),
            // const SizedBox(height: 20),
            // InkWell(
            //   onTap: () {},
            //   child: Text("Sign Out",
            //       style: Theme.of(context).textTheme.headline2!.copyWith(
            //           color: Colors.black87,
            //           fontSize: 22,
            //           fontWeight: FontWeight.w600)),
            // ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            //   decoration: _decoration,
            //   child: DropdownButton(
            //     icon: Icon(Icons.keyboard_arrow_down),
            //     iconSize: 30,
            //     underline: Container(), //rem
            //     items: cause_loss_dropdown
            //         .map((value) => DropdownMenuItem(
            //               child: Text(value),
            //               value: value,
            //             ))
            //         .toList(),
            //     onChanged: (String? value) {
            //       setState(() {
            //         cause_loss_select = value ?? "";
            //         cause_loss.forEach((full_object) {
            //           if (cause_loss_select == full_object.value) {
            //             cause_loss_fullobject = full_object;
            //           }
            //         });
            //       });
            //     },
            //     // isExpanded: false,
            //     value: cause_loss_select,
            //     isExpanded: true,
            //   ),
            // )

            //----------------------------bottomnavcode--------
            // Align(
            //   alignment: Alignment.bottomLeft,
            //   child: Container(
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            //     child: Container(
            //       //  width: double.infinity,
            //       // height: 120,

            //       margin:
            //           const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            //       padding:
            //           const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //       decoration: WidgetsReusing.getListBoxDecoration(),

            //       child: Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //         children: [
            //           InkWell(
            //             onTap: () {
            //               // _drawerKey.currentState!.openDrawer();
            //             },
            //             child: Container(
            //               padding: const EdgeInsets.all(10),
            //               margin: const EdgeInsets.only(left: 15),
            //               child: const Icon(
            //                 Icons.menu,
            //                 size: 30,
            //                 color: Color.fromRGBO(255, 102, 0, 1),
            //               ),
            //             ),
            //           ),
            //           Expanded(
            //             child: InkWell(
            //               onTap: () {
            //                 Navigator.push(
            //                   context,
            //                   ConstantFunctions.OpenNewActivity(
            //                       ScreenDashboard()),
            //                 );
            //               },
            //               child: Container(
            //                 padding: const EdgeInsets.all(10),
            //                 decoration: const BoxDecoration(
            //                     color: Colors.white,
            //                     shape: BoxShape.circle,
            //                     boxShadow: [
            //                       BoxShadow(
            //                           color: Color.fromRGBO(255, 102, 0, 1),
            //                           spreadRadius: 2),
            //                       BoxShadow(
            //                           color: Color.fromRGBO(255, 102, 0, 1),
            //                           // color: Colors.black.withOpacity(.25),
            //                           offset: Offset(1, 1),
            //                           blurRadius: 5,
            //                           spreadRadius: 1)
            //                     ]),
            //                 child: const Icon(
            //                   Icons.home,
            //                   size: 30,
            //                   color: Color.fromRGBO(255, 102, 0, 1),
            //                 ),
            //               ),
            //             ),
            //           ),
            //           InkWell(
            //             onTap: () async {
            //               Navigator.push(
            //                 context,
            //                 ConstantFunctions.OpenNewActivity(
            //                     const ScreenMyClaims()),
            //               );
            //             },
            //             child: const Icon(
            //               Icons.list_alt,
            //               size: 30,
            //               color: Color.fromRGBO(255, 102, 0, 1),
            //             ),
            //           )
            //         ],
            //       ),
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  // final list = ["Apple", "Orange", "Kiwi", "Banana", "Grape"];
  // List<DropdownMenuItem<String>> _createList() {
  //   return list
  //       .map<DropdownMenuItem<String>>(
  //         (text) => DropdownMenuItem(
  //           value: text,
  //           child: Text(text),
  //         ),
  //       )
  //       .toList();
  // }

  // final _decoration = const ShapeDecoration(
  //   shape: RoundedRectangleBorder(
  //     side: BorderSide(width: 1.0, style: BorderStyle.solid),
  //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
  //   ),
  // );

  Widget GetMenuList(IconData iconData, String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 10, top: 7, bottom: 7),
          child: CircleAvatar(
            radius: 16,
            backgroundColor: Colors.transparent,
            child: Icon(
              iconData,
              size: 30,
              color: ThemeColors.headline6_color_lt,
            ),
          ),
        ),
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: ThemeColors.headline6_color_lt,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  )),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: ThemeColors.headline6_color_lt,
          ),
        )
      ],
    );
  }
}
