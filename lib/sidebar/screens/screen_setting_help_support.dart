import 'package:flutter/material.dart';

class ScreenSettingHelpSupport extends StatefulWidget {
  const ScreenSettingHelpSupport({Key? key}) : super(key: key);

  @override
  State<ScreenSettingHelpSupport> createState() =>
      _ScreenSettingHelpSupportState();
}

class _ScreenSettingHelpSupportState extends State<ScreenSettingHelpSupport> {
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
              "Help & Support",
              style: TextStyle(fontSize: 19, color: Colors.black87),
            ),
          ],
        ),
        actions: [SizedBox(width: 40)],
      ),
      body: Container(
        alignment: Alignment.center,
        child: Text(
          "For any help just contact us at \n support@claimcore.com",
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}

// Help & Support - This can just have ‘support@claimcore.com’ shown on this page. We have future plans for it, but this is not necessary for our ability to
