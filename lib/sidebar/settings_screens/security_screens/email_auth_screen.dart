import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../app_theme_work/widgets_reusing.dart';
import '../../../utilities/constant_functions.dart';
import '../../widgets/widget_bottomnavbar.dart';
import 'email_confirmation_screen.dart';

class EmailAuthScreen extends StatefulWidget {
  const EmailAuthScreen({Key? key}) : super(key: key);

  @override
  State<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends State<EmailAuthScreen> {
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
              "Email Authentication",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            Divider(
              thickness: 1.5,
              color: ThemeColors.headline6_color_lt,
              endIndent: 30,
              indent: 30,
            ),
          ],
        ),
        actions: const [
          SizedBox(width: 30),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Confirm your email address",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 18),
            const Text(
              "You'll receive a text message with confirmation code on your email address: jwin@jamesclaims.com. Use this code to confirm this email address is yours.",
              style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 30),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      ConstantFunctions.OpenNewActivity(
                          const EmailConfirmationScreen()));
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
