import 'dart:async';

import 'package:claim_core/claim/reports/data/database_images.dart';
import 'package:claim_core/dashboard/dashboard_services.dart';
import 'package:claim_core/login/screens/screen_login.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

import 'dashboard/screens/screen_dashboard.dart';
import 'data/model_user.dart';

class ScreenSplash extends StatefulWidget {
  @override
  _ScreenSplashState createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash> {
  DatabaseUser databaseUser = DatabaseUser();
  ModalUser? modalUser;

  @override
  void initState() {
    Timer(Duration(seconds: 1), callback);
    super.initState();
  }

  void callback() {
    ConstantFunctions.getSharePrefModeString("login_token").then((login_token) {
      print("object : login_token : $login_token");

      if (login_token.length > 20) {
        // ConstantFunctions.OpenNewScreenClean(context, ScreenDashboard());
        ConstantFunctions.OpenNewScreenClean(context, ScreenLogin());
      } else {
        ConstantFunctions.OpenNewScreenClean(context, ScreenLogin());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Load a Lottie file from your assets
            /*  Container(
              width: 200,
              height: 200,
              // color: Colors.grey[100],
              child: Lottie.asset('assets/jsons/fundraising_splash.json'),
            ),*/
            SizedBox(
              height: 10,
            ),
            Text(
              "Claim Application",
              style: Theme.of(context).textTheme.headline1,
            )
          ],
        ),
      ),
    );
  }
}
