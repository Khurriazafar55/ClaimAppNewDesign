import 'package:flutter/material.dart';

class ScreenMeasureAssist extends StatefulWidget {
  const ScreenMeasureAssist({Key? key}) : super(key: key);

  @override
  _ScreenMeasureAssistState createState() => _ScreenMeasureAssistState();
}

class _ScreenMeasureAssistState extends State<ScreenMeasureAssist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).backgroundColor,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(vertical: 35),
        alignment: Alignment.center,
        child: Text(
          "Measure Assist",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
