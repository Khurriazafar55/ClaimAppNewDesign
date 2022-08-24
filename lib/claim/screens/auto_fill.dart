import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/screens/calim_tab/file_claim.dart';

import 'package:claim_core/sidebar/screens/CustomDialogBox.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class AotoFile123 extends StatefulWidget {
  const AotoFile123({Key? key}) : super(key: key);

  @override
  State<AotoFile123> createState() => _AotoFile123State();

  void callback(bool bool) {}
}

class _AotoFile123State extends State<AotoFile123> {
  onTapSubmit() {}

  bool Checkboxvalue = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      color: ThemeColors.background_color,
      // margin: EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 200,
          ),
          Container(
              margin: EdgeInsets.all(20),
              child: Column(
                children: [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 40,
                  ),
                  GetAutoFill(
                    AotoFile123(),
                    "Hail Damage+ Roof",
                  ),
                  const Divider(
                    thickness: 2,
                    color: ThemeColors.headline6_color_lt,
                    endIndent: 20,
                    // indent: 20
                  ),
                  GetAutoFill(
                    AotoFile123(),
                    "Hail Damage+ Roof",
                  ),
                  const Divider(
                    thickness: 2,
                    color: ThemeColors.headline6_color_lt,
                    endIndent: 20,
                    // indent: 20
                  ),
                  GetAutoFill(
                    AotoFile123(),
                    "Hail Damage+ Roof",
                  ),
                  const Divider(
                    thickness: 2,
                    color: ThemeColors.headline6_color_lt,
                    endIndent: 20,
                    // indent: 20
                  ),
                  Button(
                    color: Colors.amber,
                    text: 'Warning',
                    onPressed: () {
                      showAlertDialog(
                        context,
                      );
                    },
                  )
                ],
              )),
        ],
      ),
    ));
  }

  Widget GetAutoFill(
    function,
    title,
  ) {
    return GestureDetector(
      onTap: () {
        if (function != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => function,
            ),
          );
        }
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Text(title,
                style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.black,
                      fontSize: 19,
                      fontWeight: FontWeight.w600,
                    )),
          ),
          Container(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: const Icon(
              Icons.arrow_forward_ios,
              size: 24,
              color: Colors.black,
            ),
          )
        ],
      ),
    );
  }

  void showAlertDialog(
    BuildContext context,
  ) {
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 200.0,
        width: double.infinity,
        // color: Colors.amber,
        child: Column(
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 30,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'WARNING!',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),

            const Align(
              alignment: Alignment.center,
              child: Text(
                  'You are about to clear all the text on this claim Submission Are you sure you went to do this',
                  style: TextStyle(color: Colors.black, fontSize: 10)),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 10),
              child: WidgetsReusing.getMaterialButton1(
                  context, "Continue", onTapSubmit),
            ),

            Container(
              child: Row(
                children: <Widget>[
                  new Checkbox(
                    activeColor: Colors.blue,
                    value: this.Checkboxvalue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                    onChanged: (value) {
                      setState(() {
                        Checkboxvalue = !Checkboxvalue;
                      });
                    },
                  ),
                  Text(
                    'Dont show me this again',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ],
              ),
            ),

            // Center(

            //   child: Text(
            //     'You are about to clear all the text on this claim\nSubmission Are you sure you went to do this',
            //     style: TextStyle(color: Colors.black, fontSize: 10),
            //   ),
            // ),
          ],
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
