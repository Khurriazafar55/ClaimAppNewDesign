import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/material.dart';

class AvailableProfileView extends StatefulWidget {
  const AvailableProfileView({Key? key}) : super(key: key);

  @override
  State<AvailableProfileView> createState() => _AvailableProfileViewState();
}

class _AvailableProfileViewState extends State<AvailableProfileView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 12),
      child: Container(
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
                  'Hours',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            ReusableText('Sunday', 'OFF'),
            ReusableText('Monday', '10:00AM - 07:00PM'),
            ReusableText('Tuesday', 'OFF'),
            ReusableText('Wednesday', 'OFF'),
            ReusableText('Thursday', 'OFF'),
            ReusableText('Friday', 'OFF'),
            ReusableText('Saturday', 'OFF'),
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
                  'Zip Codes',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              '2883   3737   48937   53343',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 16),
            const Text(
              '2883   3737   48937   53343',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Widget ReusableText(String txt1, String txt2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Text(
            txt1,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12),
          child: Text(
            txt2,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        )
      ],
    );
  }
}
