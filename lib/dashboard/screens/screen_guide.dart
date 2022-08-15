import 'package:flutter/material.dart';

class ScreenGuide extends StatefulWidget {
  const ScreenGuide({Key? key}) : super(key: key);

  @override
  State<ScreenGuide> createState() => _ScreenGuideState();
}

class _ScreenGuideState extends State<ScreenGuide> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
      ),
    );
  }
}
