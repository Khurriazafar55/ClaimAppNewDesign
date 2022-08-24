import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';
import '../../dashboard/screens/dashboard2.dart';
import '../../sidebar/widgets/widget_bottomnavbar.dart';

class AttachProfileView extends StatefulWidget {
  const AttachProfileView({Key? key}) : super(key: key);

  @override
  State<AttachProfileView> createState() => AattachProfileViewState();
}

class AattachProfileViewState extends State<AttachProfileView> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BackGroundColor(),
        Container(
          decoration: BoxDecoration(
            // color: ThemeColors.headline6_color_lt,
            borderRadius: BorderRadius.circular(7),
          ),
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Attached files (2)',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: ThemeColors.headline7_color_lt),
                ),
              ),
              // ListView.builder(
              //     itemCount: 1,
              //     itemBuilder: (BuildContext context, index) {
              //       return ReusableText('1', 'certification.png');
              //     }),

              ReusableText('filepath', 'certification.png'),
              ReusableText('filePath', 'resume.pdf'),
              ReusableText('filePath', 'resume.pdf'),
              ReusableText('filePath', 'resume.pdf'),
              ReusableText('filePath', 'resume.pdf'),
              Expanded(
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: ResusableBottomNavBar()),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget ReusableText(String filePath, String txt2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          child: Container(
            height: 80,
            width: 60,
            color: Colors.blueGrey,
            child: Center(
              child: Text(
                filePath,
                style:
                    const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
              ),
            ),
          ),
        ),
        Text(txt2),
        Padding(
          padding: const EdgeInsets.all(12),
          child: TextButton(
            onPressed: () {},
            child: const Text('view', style: TextStyle(color: Colors.black)),
          ),
        )
      ],
    );
  }
}
