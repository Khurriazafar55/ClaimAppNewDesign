import 'package:claim_core/app_theme_work/textformfield_theme.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:flutter/material.dart';

class ScreenTheme extends StatelessWidget {
  const ScreenTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(Icons.arrow_back),
        ),
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Text Styes"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormFieldTheme.GetTextFormField01(
                  context, null, "Label Name"),
            ),
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: TextFormFieldTheme.GetTextFormField02(
                  context, null, "Label Name"),
            ),
            SizedBox(height: 30),
            WidgetsReusing.GetTextButton(context, "Save Record", null,
                EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
            SizedBox(height: 20),
            Text("headline1", style: Theme.of(context).textTheme.headline1),
            Divider(thickness: 1, color: Colors.grey),
            Text("headline2", style: Theme.of(context).textTheme.headline2),
            Divider(thickness: 1, color: Colors.grey),
            Text("headline3", style: Theme.of(context).textTheme.headline3),
            Divider(thickness: 1, color: Colors.grey),
            Text("headline4", style: Theme.of(context).textTheme.headline4),
            Divider(thickness: 1, color: Colors.grey),
            Text("headline5", style: Theme.of(context).textTheme.headline5),
            Divider(thickness: 1, color: Colors.grey),
            Text("headline6", style: Theme.of(context).textTheme.headline6),
            Divider(thickness: 1, color: Colors.grey),
            Text("subtitle1", style: Theme.of(context).textTheme.subtitle1),
            Divider(thickness: 1, color: Colors.grey),
            Text("subtitle2", style: Theme.of(context).textTheme.subtitle2),
            Divider(thickness: 1, color: Colors.grey),
            Text("bodyText1", style: Theme.of(context).textTheme.bodyText1),
            Divider(thickness: 1, color: Colors.grey),
            Text("bodyText2", style: Theme.of(context).textTheme.bodyText2),
            Divider(thickness: 1, color: Colors.grey),
            Text("caption", style: Theme.of(context).textTheme.caption),
          ],
        ),
      ),
    );
  }
}
