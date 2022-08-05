import 'package:flutter/material.dart';

class ScreenSettingSecurity extends StatefulWidget {
  const ScreenSettingSecurity({Key? key}) : super(key: key);

  @override
  State<ScreenSettingSecurity> createState() => _ScreenSettingSecurityState();
}

class _ScreenSettingSecurityState extends State<ScreenSettingSecurity> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Setting",
              style: TextStyle(fontSize: 21, color: Colors.black87),
            ),
            Divider(
              endIndent: 20,
              indent: 30,
              thickness: 1,
            ),
            Text(
              "Security",
              style: TextStyle(fontSize: 19, color: Colors.black87),
            ),
          ],
        ),
        actions: [SizedBox(width: 40)],
      ),
      body: Container(),
    );
  }
}
