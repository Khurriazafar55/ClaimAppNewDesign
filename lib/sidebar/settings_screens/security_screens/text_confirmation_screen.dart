import 'package:claim_core/sidebar/settings_screens/security_screens/text_note_screen.dart';
import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../app_theme_work/widgets_reusing.dart';
import '../../../utilities/constant_functions.dart';

class TextConfirmationScreen extends StatefulWidget {
  const TextConfirmationScreen({Key? key}) : super(key: key);

  @override
  State<TextConfirmationScreen> createState() => _TextConfirmationScreenState();
}

class _TextConfirmationScreenState extends State<TextConfirmationScreen> {
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
              "Text Authentication",
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
              "We sent you a code",
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 18),
            const Text(
              "An authentication code has been sent to your phone number. Enter it below to confirm this is your number.",
              style: TextStyle(
                  fontSize: 14,
                  // fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 30),
            TextFormField(),
            const SizedBox(height: 8),
            const Text(
              "Resend code",
              style:
                  TextStyle(fontSize: 14, color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(const TextNoteScreen()));
              },
              child: Align(
                alignment: Alignment.center,
                child: WidgetsReusing.GetTextButton(
                  context,
                  'Confirm',
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
