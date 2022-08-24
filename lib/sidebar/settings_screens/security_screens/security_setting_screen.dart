import 'package:claim_core/sidebar/settings_screens/security_screens/active_sessions_screen.dart';
import 'package:claim_core/sidebar/settings_screens/security_screens/location_tracking_screen.dart';
import 'package:claim_core/sidebar/settings_screens/security_screens/two_factauth_screen.dart';
import 'package:claim_core/sidebar/settings_screens/security_screens/update_password_screen.dart';
import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../utilities/constant_functions.dart';
import '../../widgets/widget_bottomnavbar.dart';

class ScreenSettingSecurity extends StatefulWidget {
  const ScreenSettingSecurity({Key? key}) : super(key: key);

  @override
  State<ScreenSettingSecurity> createState() => _ScreenSettingSecurityState();
}

class _ScreenSettingSecurityState extends State<ScreenSettingSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background_color,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: ThemeColors.headline6_color_lt,
          ),
        ),
        backgroundColor: ThemeColors.background_color,
        elevation: 0,
        title: const Text(
          "Security",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ThemeColors.scaffold_color_lt),
        ),
      ),
      body: ListView(
        children: [
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  ConstantFunctions.OpenNewActivity(
                      const UpdatePasswordScreen()));
            },
            child: GetMenuList(Icons.key_sharp, "Change your password",
                "Change your password at any time", Colors.deepOrangeAccent),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  ConstantFunctions.OpenNewActivity(
                      const TwoFactorAuthScreen()));
            },
            child: GetMenuList(
                Icons.security_rounded,
                "Two-factor authentication (2FA)",
                "Set up a second authentication method which will be required to log in to your account.",
                Colors.blue),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  ConstantFunctions.OpenNewActivity(
                      const ActiveSessionScreen()));
            },
            child: GetMenuList(
                Icons.laptop,
                "Active Sessions ",
                "View devices that you are currently signed into.",
                Colors.green),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {
              Navigator.push(
                  context,
                  ConstantFunctions.OpenNewActivity(
                      const LocationTrackingScreen()));
            },
            child: GetMenuList(
                Icons.location_on,
                "Location Tracking",
                "Manage location information and tracking.",
                Colors.yellowAccent),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ResusableBottomNavBar()),
          ),
        ],
      ),
    );
  }

  // Widget GetMenuList(
  //     IconData iconData, String title, String subtitle, Color color) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.start,
  //     children: [
  //       Container(
  //         padding:
  //             const EdgeInsets.only(left: 15, right: 10, top: 7, bottom: 7),
  //         child: CircleAvatar(
  //           radius: 16,
  //           backgroundColor: Colors.transparent,
  //           child: Icon(
  //             iconData,
  //             size: 30,
  //             color: ThemeColors.headline6_color_lt,
  //           ),
  //         ),
  //       ),
  //       Column(
  //         children: [
  //           Expanded(
  //             child: Text(title,
  //                 style: Theme.of(context).textTheme.headline2!.copyWith(
  //                       color: ThemeColors.headline6_color_lt,
  //                       fontSize: 17,
  //                       fontWeight: FontWeight.w500,
  //                     )),
  //           ),
  //           Expanded(
  //             child: Text(subtitle,
  //                 style: Theme.of(context).textTheme.headline2!.copyWith(
  //                       color: ThemeColors.headline6_color_lt,
  //                       fontSize: 14,
  //                       fontWeight: FontWeight.w300,
  //                     )),
  //           ),
  //         ],
  //       ),
  //       Container(
  //         padding: const EdgeInsets.only(left: 15, right: 10),
  //         child: const Icon(
  //           Icons.arrow_forward_ios,
  //           size: 24,
  //           color: ThemeColors.headline6_color_lt,
  //         ),
  //       )
  //     ],
  //   );
  // }

  Widget GetMenuList(
      IconData iconData, String title, String subtitle, Color color) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.only(left: 15, right: 10, top: 7, bottom: 7),
        child: CircleAvatar(
          radius: 8,
          backgroundColor: Colors.transparent,
          child: Icon(
            iconData,
            size: 27,
            color: ThemeColors.headline6_color_lt,
          ),
        ),
      ),
      title: Expanded(
        child: Text(title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: ThemeColors.headline6_color_lt,
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
                )),
      ),
      subtitle: Expanded(
        child: Text(subtitle,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: ThemeColors.headline6_color_lt,
                  fontSize: 14,
                )),
      ),
      trailing: Container(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: const Icon(
          Icons.arrow_forward_ios,
          size: 24,
          color: ThemeColors.headline6_color_lt,
        ),
      ),
    );
  }
}
