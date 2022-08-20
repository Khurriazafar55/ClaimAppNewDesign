import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../app_theme_work/widgets_reusing.dart';
import '../../../utilities/constant_functions.dart';
import 'qr_note_screen.dart';

class QrCodeConfirmationScreen extends StatefulWidget {
  const QrCodeConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<QrCodeConfirmationScreen> createState() =>
      _QrCodeConfirmationScreenState();
}

class _QrCodeConfirmationScreenState extends State<QrCodeConfirmationScreen> {
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
              "2FA Authentication",
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
              "Enter the confirmation code",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 18),
            const Text(
              "Enter the code provided to the authentication app to connect with your ClaimCore account.",
              style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 30),
            TextFormField(),
            const SizedBox(height: 50),
            Align(
              alignment: Alignment.center,
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      ConstantFunctions.OpenNewActivity(
                          const QrCodeNoteScreen()));
                },
                child: WidgetsReusing.GetTextButton(
                  context,
                  'Confirm Code',
                  null,
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
