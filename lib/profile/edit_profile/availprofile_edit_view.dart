import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';

class AvailProfileEditView extends StatefulWidget {
  const AvailProfileEditView({Key? key}) : super(key: key);

  @override
  State<AvailProfileEditView> createState() => _AvailProfileEditViewState();
}

class _AvailProfileEditViewState extends State<AvailProfileEditView> {
  final txtController = TextEditingController();
  final txtController2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.headline6_color_lt,
          borderRadius: BorderRadius.circular(7),
        ),
        child: SingleChildScrollView(
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
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text(
                    'Off',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'Start',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    'End',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              ReusableText(
                'Sun',
                true,
                txtController,
                txtController2,
              ),
              ReusableText(
                'Mon',
                true,
                txtController,
                txtController2,
              ),
              ReusableText(
                'Tues',
                true,
                txtController,
                txtController2,
              ),
              ReusableText(
                'Wed',
                true,
                txtController,
                txtController2,
              ),
              ReusableText(
                'Thurs',
                true,
                txtController,
                txtController2,
              ),
              ReusableText(
                'Fri',
                true,
                txtController,
                txtController2,
              ),
              ReusableText(
                'Sat',
                true,
                txtController,
                txtController2,
              ),
              const SizedBox(
                height: 5,
              ),
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
              // const Text(
              //   '2883   3737  48937  53343  53347',
              //   style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              // ),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 40,
                  width: 320,
                  child: TextField(
                    controller: txtController,
                    autofocus: false,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: '2883   3737  48937  53343  53347',
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  height: 40,
                  width: 320,
                  child: TextField(
                    controller: txtController,
                    autofocus: false,
                    style: const TextStyle(color: Colors.black, fontSize: 16),
                    decoration: const InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: '2883   3737  48937  53343  53347',
                    ),
                    maxLines: 1,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ReusableText(
      String txt,
      bool? checked,
      TextEditingController txtController1,
      TextEditingController textController2) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Text(
              txt,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(width: 8),
          Checkbox(
              value: true,
              onChanged: (value) {
                value = checked;
              }),
          const SizedBox(width: 8),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: Center(
              child: TextFormField(
                controller: txtController1,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            height: 35,
            width: MediaQuery.of(context).size.width / 4,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: Center(
              child: TextFormField(
                controller: textController2,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
