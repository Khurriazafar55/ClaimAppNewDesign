import 'package:claim_core/utilities/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../app_theme_work/theme_colors.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({Key? key}) : super(key: key);

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background_color1,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            // color: Colors.black,
          ),
        ),
        // backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          // margin: EdgeInsets,
          color: Colors.transparent,
          padding: EdgeInsets.only(left: 30, right: 30, bottom: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.center,
                child: Image.asset(AppAssets.sign_in_logo, scale: 5),
              ),
              Align(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                    Text(
                      "Claim",
                      style: TextStyle(
                        color: Color.fromRGBO(205, 13, 30, 1),
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                        fontFamily: 'circulat_std_bold.ttf',
                      ),
                    ),
                    // SizedBox(
                    //   width: 1,
                    // ),
                    Text(
                      "Core",
                      style: TextStyle(
                        color: ThemeColors.primary_dark_lt,
                        fontFamily: 'circulat_std_bold.ttf',
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ])),
              SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Password Reset",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 32,
                  ),
                ),
              ),
              SizedBox(height: 5),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  "if the email address is linked to a\nClaim core account,it will receive\ninstruction for reseting your password\nif it not your inbox,check ypur spam\nfolder pleese allow to 10 minutes.",
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              SizedBox(height: 35),
              SizedBox(
                width: double.infinity,
                child: MaterialButton(
                  // color: Colors.blue,
                  color: ThemeColors.orange_button,
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Return",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.w400),
                  ),
                  onPressed: () {
                    // onSingInTap;
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _textheading(text) {
    TextStyle style1 = TextStyle(
        color: Color.fromRGBO(205, 13, 30, 1),
        fontSize: 20,
        fontWeight: FontWeight.bold);
    return Container(
      child: Text(text, style: style1),
    );
  }
}
