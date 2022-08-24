import 'package:claim_core/sidebar/settings_screens/security_screens/qr_code_confirmation.dart';
import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../app_theme_work/widgets_reusing.dart';
import '../../../utilities/constant_functions.dart';
import '../../widgets/widget_bottomnavbar.dart';

class AppAuthScreen extends StatefulWidget {
  const AppAuthScreen({Key? key}) : super(key: key);

  @override
  State<AppAuthScreen> createState() => _AppAuthScreenState();
}

class _AppAuthScreenState extends State<AppAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background_color,
      appBar: AppBar(
        backgroundColor: ThemeColors.background_color,
        elevation: 0,
        title: Column(
          children: const [
            Text(
              "Authentication App",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            Divider(
              thickness: 1.5,
              color: ThemeColors.headline6_color_lt,
              endIndent: 25,
              indent: 25,
            ),
          ],
        ),
        actions: const [
          SizedBox(width: 30),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Scan the QR code below using your preferred app , such as Authy or Google Authenticator",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 400),
            const Text(
              "Can't scan the QR code?",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.scaffold_color_lt),
            ),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      ConstantFunctions.OpenNewActivity(
                          const QrCodeConfirmationScreen()));
                },
                child: WidgetsReusing.GetTextButton(
                  context,
                  'Send Code',
                  null,
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ResusableBottomNavBar(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
