import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/dashboard/models/model_profile.dart';
import 'package:claim_core/dashboard/screens/screen_contacts.dart';
import 'package:claim_core/dashboard/services/dashboard_service.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class ScreenProfile extends StatefulWidget {
  const ScreenProfile({Key? key}) : super(key: key);

  @override
  State<ScreenProfile> createState() => _ScreenProfileState();
}

class _ScreenProfileState extends State<ScreenProfile> {
  late GestureTapCallback onContacts;

  GestureTapCallback? onProfile;
  GestureTapCallback? onLoadPress;

  Future<ModelProfile>? _future;

  @override
  void initState() {
    super.initState();

    ConstantFunctions.getSharePrefModeString("login_token").then(
      (login_token) {
        setState(() {
          // _future = DashboardService.GetProfile(login_token);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    onContacts = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(ScreenContacts()));
    };
    onLoadPress = () {
      ConstantFunctions.getSharePrefModeString("login_token").then(
        (login_token) {
          setState(() {
            // _future = DashboardService.GetProfile(login_token);
          });
        },
      );
    };

    final heading_text_style =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: AppBar().preferredSize.height),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: onContacts,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 7),
                    decoration: WidgetsReusing.getListBoxDecoration(),
                    child: Icon(
                      Icons.person,
                      size: 30,
                    ),
                  ),
                ),
                Expanded(
                  child: Text(
                    "My Profile",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 7),
                    child: Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                future: _future,
                builder: (context, AsyncSnapshot<ModelProfile> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data != null) {
                      return SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 30),
                            CircleAvatar(
                                radius: 50,
                                backgroundColor: Colors.grey,
                                child: Icon(Icons.person,
                                    size: 70, color: Colors.white)),
                            SizedBox(height: 15),
                            Text("${snapshot.data!.data!.name}",
                                style: heading_text_style),
                            SizedBox(height: 15),
                            Text("Inspector ID"),
                            Text(
                              "${snapshot.data!.data!.inspectorId}",
                            ),
                            SizedBox(height: 15),
                            PopupMenuButton(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(width: 15),
                                    Text(
                                      "Availablity",
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Icon(Icons.arrow_drop_down)
                                  ],
                                ),
                                itemBuilder: (context) => [
                                      PopupMenuItem(
                                          child: Text('Sunday ___ off'),
                                          value: 1),
                                      PopupMenuItem(
                                          child: Text('Monday ___ 10-7'),
                                          value: 1),
                                      PopupMenuItem(
                                          child: Text('Tuesday ___ 9-5'),
                                          value: 1),
                                      PopupMenuItem(
                                          child: Text('Wednesday ___ 7-3'),
                                          value: 1),
                                      PopupMenuItem(
                                          child: Text('Thursday ___ off'),
                                          value: 1),
                                      PopupMenuItem(
                                          child: Text('Friday ___ 8-4'),
                                          value: 1),
                                      PopupMenuItem(
                                          child: Text('Saturday ___ off'),
                                          value: 1),
                                    ]),
                            SizedBox(height: 30),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Phone Number",
                                      style: heading_text_style),
                                  Text("${snapshot.data!.data!.phoneNo}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Email", style: heading_text_style),
                                  Text("${snapshot.data!.data!.companYEmail}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Company", style: heading_text_style),
                                  Text("${snapshot.data!.data!.company}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Position", style: heading_text_style),
                                  Text("${snapshot.data!.data!.position}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
                                ],
                              ),
                            ),
                            Text("Prefrences", style: heading_text_style),
                            Container(
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Stories",
                                              style: heading_text_style),
                                          Text(
                                              "${snapshot.data!.data!.stories}",
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .underline)),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 10),
                                      width: double.infinity,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text("Pitch",
                                              style: heading_text_style),
                                          Text("${snapshot.data!.data!.pitch}",
                                              style: TextStyle(
                                                  decoration: TextDecoration
                                                      .underline)),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("HAAG Certified",
                                      style: heading_text_style),
                                  Text("${snapshot.data!.data!.haaGCertified}",
                                      style: TextStyle(
                                          decoration:
                                              TextDecoration.underline)),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    } else {
                      return WidgetsReusing.getReLoadWidget(context,
                          message: "Sorry no data found",
                          onPresseddd: onLoadPress);
                    }
                  } else if (snapshot.hasError) {
                    return WidgetsReusing.getReLoadWidget(context,
                        message: "${snapshot.error}", onPresseddd: onLoadPress);
                  } else {
                    return ConstantFunctions.ShowProgressLoadingView(context);
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
