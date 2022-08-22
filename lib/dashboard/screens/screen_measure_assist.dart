import 'package:flutter/material.dart';

class MeasureAssistScreen extends StatefulWidget {
  const MeasureAssistScreen({Key? key}) : super(key: key);

  @override
  _MeasureAssistScreenState createState() => _MeasureAssistScreenState();
}

class _MeasureAssistScreenState extends State<MeasureAssistScreen> {
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
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 35),
        alignment: Alignment.center,
        child: Text(
          "Measure Assist",
          style: Theme.of(context).textTheme.headline2,
        ),
      ),
    );
  }
}
