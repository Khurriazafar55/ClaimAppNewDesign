import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';

class ExpProfileView extends StatefulWidget {
  const ExpProfileView({Key? key}) : super(key: key);

  @override
  State<ExpProfileView> createState() => _ExpProfileViewState();
}

class _ExpProfileViewState extends State<ExpProfileView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: ThemeColors.headline6_color_lt,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Claim Experience',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            ReusableText(Icons.cloudy_snowing, 'Hail Claims', '6 years'),
            ReusableText(Icons.fireplace_outlined, 'Fire Claims', '3 years'),
            ReusableText(Icons.flood_outlined, 'Flood Claims', '8 years'),
            ReusableText(Icons.water_drop_sharp, 'Water Claims', '6 years'),
            ReusableText(Icons.air_sharp, 'Wind Claims', '3 years'),
            const Divider(
              color: Colors.black26,
              thickness: 1.5,
              endIndent: 10,
              indent: 10,
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Other Relevant Experience',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'this is the detail of other relevant exerience, related claims and others.',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget ReusableText(IconData iconData, String txt1, String txt2) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 30,
        color: Colors.black,
      ),
      title: Text(
        txt1,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
      trailing: Text(
        txt2,
        style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
      ),
    );
  }
}
