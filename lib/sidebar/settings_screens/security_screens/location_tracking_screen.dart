import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../../app_theme_work/widgets_reusing.dart';
import '../../widgets/widget_bottomnavbar.dart';

class LocationTrackingScreen extends StatefulWidget {
  const LocationTrackingScreen({Key? key}) : super(key: key);

  @override
  State<LocationTrackingScreen> createState() => _LocationTrackingScreenState();
}

class _LocationTrackingScreenState extends State<LocationTrackingScreen> {
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
              "Location Tracking",
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            const Text(
              "Please enable location services for ClaimCore in  your device setting. This will allow ClaimCore to view your location for Maps and Routing.",
              style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w500,
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
                  'Open Settings',
                  null,
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                ),
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
