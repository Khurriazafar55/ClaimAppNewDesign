import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';
import '../../widgets/widget_bottomnavbar.dart';

class ActiveSessionScreen extends StatelessWidget {
  const ActiveSessionScreen({Key? key}) : super(key: key);

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
              "Active Sessions",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            Divider(
              thickness: 1.5,
              color: ThemeColors.headline6_color_lt,
              endIndent: 20,
              indent: 20,
            ),
          ],
        ),
        actions: const [
          SizedBox(width: 30),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              color: ThemeColors.headline6_color_lt,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'This Session',
                      style: TextStyle(
                          color: Colors.blue, fontWeight: FontWeight.w600),
                    ),
                    const Text('378.23.78'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          'Json iPhone',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                        Text('online')
                      ],
                    ),
                    const Text('Last active : current'),
                    const Text('This Session'),
                    const Divider(
                      thickness: 1.5,
                      color: Colors.black87,
                    ),
                  ],
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
