import 'package:claim_core/sidebar/widgets/widget_bottomnavbar.dart';
import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';

class AppearanceScreen extends StatefulWidget {
  const AppearanceScreen({Key? key}) : super(key: key);

  @override
  State<AppearanceScreen> createState() => _AppearanceScreenState();
}

class _AppearanceScreenState extends State<AppearanceScreen> {
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
          "Appearance",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ThemeColors.scaffold_color_lt),
        ),
      ),
      body: Column(
        children: [
          InkWell(
            onTap: () {},
            child: GetMenuList("Classic Orange", Colors.deepOrangeAccent),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {},
            child: GetMenuList("Cool Blue", Colors.blue),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {},
            child: GetMenuList("Natural Green", Colors.green),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {},
            child: GetMenuList("Gold Standad", Colors.yellowAccent),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {},
            child: GetMenuList("Bold Red", Colors.red),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          InkWell(
            onTap: () {},
            child: GetMenuList("Vibrant Purple", Colors.purple),
          ),
          const Divider(
            thickness: 2,
            color: ThemeColors.headline6_color_lt,
            endIndent: 10,
            indent: 10,
          ),
          Expanded(
            child: Align(
                alignment: Alignment.bottomCenter,
                child: ResusableBottomNavBar()),
          ),
        ],
      ),
    );
  }

  Widget GetMenuList(String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          child: Container(
            height: 30,
            width: 30,
            color: color,
            padding:
                const EdgeInsets.only(left: 15, right: 10, top: 7, bottom: 7),
            // child: CircleAvatar(
            //   radius: 16,
            //   backgroundColor: Colors.transparent,
            //   child: Icon(
            //     iconData,
            //     size: 30,
            //     color: ThemeColors.headline6_color_lt,
            //   ),
            // ),
          ),
        ),
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                    color: ThemeColors.headline6_color_lt,
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  )),
        ),
      ],
    );
  }
}
