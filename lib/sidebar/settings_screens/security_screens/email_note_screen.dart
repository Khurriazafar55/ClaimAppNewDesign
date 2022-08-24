import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

import '../../widgets/widget_bottomnavbar.dart';
import 'qr_backup_screen.dart';

class EmailNoteScreen extends StatelessWidget {
  const EmailNoteScreen({Key? key}) : super(key: key);

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
        child: ListView(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            const Text(
              "You're all set!",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 18),
            const Text(
              "From now on when you log in, you will receive an email with an authentication code.",
              style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const Text(
              "Set up a backup code in case when you lose access to your 2FA methods.",
              style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 400),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  // Navigator.push(
                  //     context,
                  //     ConstantFunctions.OpenNewActivity(
                  //         const QrCodeNoteScreen()));
                },
                child: WidgetsReusing.GetTextButton(
                  context,
                  'Done',
                  null,
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        const QrAppBackupScreen()));
              },
              child: const Text(
                "Get a Backup Code",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.scaffold_color_lt),
              ),
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
}
