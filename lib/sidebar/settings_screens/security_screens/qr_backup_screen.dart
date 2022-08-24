import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../app_theme_work/widgets_reusing.dart';
import '../../widgets/widget_bottomnavbar.dart';

class QrAppBackupScreen extends StatelessWidget {
  const QrAppBackupScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background_color,
      appBar: AppBar(
        centerTitle: true,
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
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "If you can't scan the QR code with your camera, copy the following code into the authentication app to link with your account",
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w300,
                  color: ThemeColors.headline6_color_lt),
            ),
            const SizedBox(height: 20),
            const Align(
              alignment: Alignment.center,
              child: Card(
                elevation: 4,
                color: Colors.white70,
                child: Padding(
                  padding:
                      EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 10),
                  child: Text(
                    "A1B2C3D4E5F6G7H8",
                    style: TextStyle(
                        fontSize: 19,
                        fontWeight: FontWeight.w400,
                        color: Colors.black),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Align(
              alignment: Alignment.center,
              child: WidgetsReusing.GetTextButton(
                context,
                'Copy',
                null,
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ),
            const SizedBox(height: 200),
            Align(
              alignment: Alignment.center,
              child: WidgetsReusing.GetTextButton(
                context,
                'Enter code',
                null,
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              ),
            ),
            const SizedBox(height: 120),
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
