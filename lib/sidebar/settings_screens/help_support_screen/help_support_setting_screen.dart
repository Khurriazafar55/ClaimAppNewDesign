import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../widgets/widget_bottomnavbar.dart';

class ScreenSettingHelpSupport extends StatefulWidget {
  const ScreenSettingHelpSupport({Key? key}) : super(key: key);

  @override
  State<ScreenSettingHelpSupport> createState() =>
      _ScreenSettingHelpSupportState();
}

class _ScreenSettingHelpSupportState extends State<ScreenSettingHelpSupport> {
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
            "Help & Support",
            style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: ThemeColors.scaffold_color_lt),
          ),
        ),
        body: Column(
          children: [
            const Divider(
                thickness: 1.5,
                color: ThemeColors.headline6_color_lt,
                endIndent: 30,
                indent: 30),
            const SizedBox(height: 8),
            const Text(
              "Contact Us",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 15, right: 10, top: 7, bottom: 7),
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.call,
                      size: 30,
                      color: ThemeColors.headline6_color_lt,
                    ),
                  ),
                ),
                const Text(
                  "877.270.7707",
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: ThemeColors.scaffold_color_lt),
                ),
                const SizedBox(width: 20)
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "Monday-Friday",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 12),
            const Text(
              "9AM - 5PM US Central Time",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w300,
                  color: ThemeColors.scaffold_color_lt),
            ),
            const SizedBox(height: 14),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.only(
                      left: 15, right: 10, top: 7, bottom: 7),
                  child: const CircleAvatar(
                    radius: 16,
                    backgroundColor: Colors.transparent,
                    child: Icon(
                      Icons.email,
                      size: 30,
                      color: ThemeColors.headline6_color_lt,
                    ),
                  ),
                ),
                const Text(
                  "support@claimcore.com",
                  style: TextStyle(
                      fontSize: 22, color: ThemeColors.scaffold_color_lt),
                ),
                const SizedBox(width: 20)
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              "Please allow 2-3 business days for a response",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: ThemeColors.scaffold_color_lt),
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ResusableBottomNavBar()),
            ),
          ],
        ));
  }
}

// Help & Support - This can just have ‘support@claimcore.com’ shown on this page. We have future plans for it, but this is not necessary for our ability to
