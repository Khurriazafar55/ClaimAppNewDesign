import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';
import '../../dashboard/screens/dashboard2.dart';
import '../../sidebar/widgets/widget_bottomnavbar.dart';

class AttachProfileEditView extends StatefulWidget {
  const AttachProfileEditView({Key? key}) : super(key: key);

  @override
  State<AttachProfileEditView> createState() => _AttachProfileEditViewState();
}

class _AttachProfileEditViewState extends State<AttachProfileEditView> {
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Attached files (2)',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: ThemeColors.headline7_color_lt),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.attach_file,
                        color: ThemeColors.headline7_color_lt,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              // ListView.builder(
              //     itemCount: 1,
              //     itemBuilder: ((context, index) {
              //       return ReusableText('filepath', 'certification.png');
              //     })),
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
        // Padding(padding: const EdgeInsets.all(12), child: Text(txt2)
        //  TextButton(
        //   onPressed: () {},
        //   child: const Text('Rename',
        //       style: TextStyle(
        //           color: ThemeColors.headline7_color_lt, fontSize: 12)),
        // ),
        // ),
        Column(
          children: [
            Align(alignment: Alignment.centerLeft, child: Text(txt2)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text('Rename',
                        style: TextStyle(
                            color: ThemeColors.headline7_color_lt,
                            fontSize: 12)),
                  ),
                  const SizedBox(width: 50),
                  TextButton(
                    onPressed: () {},
                    child: const Text('Remove',
                        style: TextStyle(
                            color: ThemeColors.headline7_color_lt,
                            fontSize: 12)),
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
