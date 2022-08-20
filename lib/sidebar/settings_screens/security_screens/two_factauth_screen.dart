import 'package:claim_core/sidebar/settings_screens/security_screens/backup_code_screen.dart';
import 'package:claim_core/sidebar/settings_screens/security_screens/email_auth_screen.dart';
import 'package:claim_core/sidebar/settings_screens/security_screens/text_auth_screen.dart';
import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../utilities/constant_functions.dart';
import '../../widgets/widget_bottomnavbar.dart';
import 'app_auth_screen.dart';

class TwoFactorAuthScreen extends StatefulWidget {
  const TwoFactorAuthScreen({Key? key}) : super(key: key);

  @override
  State<TwoFactorAuthScreen> createState() => _TwoFactorAuthScreenState();
}

class _TwoFactorAuthScreenState extends State<TwoFactorAuthScreen> {
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
          "2FA Settings",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ThemeColors.scaffold_color_lt),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(
              height: 14,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 12),
              child: Text(
                "Two-Factor Methods",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.scaffold_color_lt),
              ),
            ),
            const SizedBox(
              height: 18,
            ),
            InkWell(
              onTap: (() {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(const EmailAuthScreen()));
              }),
              child: GetMenuList(
                  Icons.dangerous,
                  'Email',
                  'Use your email message containing on authentication code to enter when you sign in.',
                  Colors.black),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: (() {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(const TextAuthScreen()));
              }),
              child: GetMenuList(
                  Icons.dangerous,
                  'Text Message',
                  'Use your phone number to receive a text message containing authentication code to enter when you sign in standard messaging rates may apply.',
                  Colors.black),
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: (() {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(const AppAuthScreen()));
              }),
              child: GetMenuList(
                  Icons.dangerous,
                  'Authentication App',
                  'Use an application to get authentication code to use when you sign in.',
                  Colors.black),
            ),
            const SizedBox(
              height: 12,
            ),
            const Divider(
              thickness: 2,
              color: ThemeColors.headline6_color_lt,
              endIndent: 20,
              indent: 20,
            ),
            const SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: (() {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        const BackUpCodeScreen()));
              }),
              child: GetMenuList(
                  Icons.arrow_forward_ios,
                  'Backup Code',
                  'Receive a single use back up code which can be used if you lose access to your authentication methods.',
                  Colors.black),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ResusableBottomNavBar()),
            ),
          ],
        ),
      ),
    );
  }

  Widget GetMenuList(
      IconData iconData, String title, String subtitle, Color color) {
    return ListTile(
      title: Expanded(
        child: Text(title,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: ThemeColors.headline6_color_lt,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                )),
      ),
      subtitle: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 5),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: ThemeColors.headline6_color_lt,
                  fontSize: 13,
                ),
          ),
        ),
      ),
      trailing: Container(
        padding: const EdgeInsets.only(left: 15, right: 10),
        child: Icon(
          iconData,
          size: 24,
          color: ThemeColors.headline6_color_lt,
        ),
      ),
    );
  }
}
