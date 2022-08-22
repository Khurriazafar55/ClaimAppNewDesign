import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';

class ExpProfileEditView extends StatefulWidget {
  const ExpProfileEditView({Key? key}) : super(key: key);

  @override
  State<ExpProfileEditView> createState() => _ExpProfileEditViewState();
}

class _ExpProfileEditViewState extends State<ExpProfileEditView> {
  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final txtController2 = TextEditingController();
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 12),
      child: Container(
        padding: const EdgeInsets.all(12),
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
                    'Claim Experience',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              ReusableText(
                  Icons.cloudy_snowing, 'Hail Claims', textController, 'years'),
              const SizedBox(height: 8),
              ReusableText(Icons.fireplace_outlined, 'Fire Claims',
                  textController, 'years'),
              const SizedBox(height: 8),
              ReusableText(Icons.flood_outlined, 'Flood Claims', textController,
                  'years'),
              const SizedBox(height: 8),
              ReusableText(Icons.water_drop_sharp, 'Water Claims',
                  textController, 'years'),
              const SizedBox(height: 8),
              ReusableText(
                  Icons.air_sharp, 'Wind Claims', textController, 'years'),
              const SizedBox(height: 8),
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
              TextFormField(
                controller: txtController2,
                decoration: const InputDecoration(
                    hintMaxLines: 8,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    hintText:
                        'this is the detail of other relevant exerience, related claims and others.'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ReusableText(
    IconData iconData,
    String txt1,
    TextEditingController txtController,
    String txt2,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Icon(
          iconData,
          size: 30,
          color: Colors.black,
        ),
        const SizedBox(width: 4),
        Expanded(
          child: Text(
            txt1,
            style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
          ),
        ),
        Container(
          height: 40,
          width: 50,
          decoration: BoxDecoration(border: Border.all(color: Colors.black)),
          child: Center(
            child: TextFormField(
              controller: txtController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Text(
          txt2,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}
