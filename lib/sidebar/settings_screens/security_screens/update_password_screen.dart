import 'package:claim_core/app_theme_work/textformfield_theme.dart';
import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../app_theme_work/widgets_reusing.dart';
import '../../widgets/widget_bottomnavbar.dart';

class UpdatePasswordScreen extends StatefulWidget {
  const UpdatePasswordScreen({Key? key}) : super(key: key);

  @override
  State<UpdatePasswordScreen> createState() => _UpdatePasswordScreenState();
}

class _UpdatePasswordScreenState extends State<UpdatePasswordScreen> {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
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
          "Update Password",
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
              height: 10,
            ),
            const Text(
              "Current Password:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldTheme.GetTextFormField01(
              context,
              currentPasswordController,
              'current password',
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "forgot password?",
              style:
                  TextStyle(fontSize: 13, color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "New Password:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldTheme.GetTextFormField01(
              context,
              newPasswordController,
              'new password',
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "New password must contain the following:",
              style:
                  TextStyle(fontSize: 13, color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "• At least 8 characters",
              style:
                  TextStyle(fontSize: 13, color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "• One capital letter",
              style:
                  TextStyle(fontSize: 13, color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "• One lowercase letter",
              style:
                  TextStyle(fontSize: 13, color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "• One special character",
              style:
                  TextStyle(fontSize: 13, color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 5,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Confirm Password:",
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormFieldTheme.GetTextFormField01(
              context,
              confirmPasswordController,
              'confirm password',
            ),
            const SizedBox(height: 18),
            Align(
              alignment: Alignment.center,
              child: WidgetsReusing.GetTextButton(
                context,
                'Change Password',
                null,
                const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
