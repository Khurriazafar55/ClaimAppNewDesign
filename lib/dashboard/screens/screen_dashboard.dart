import 'dart:convert';
import 'dart:io';

import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/screens/screen_my_claims.dart';
import 'package:claim_core/claim/screens/screen_new_claim.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/dashboard/models/model_weather.dart';
import 'package:claim_core/dashboard/screens/screen_calendar.dart';
import 'package:claim_core/dashboard/screens/screen_contacts.dart';
import 'package:claim_core/dashboard/screens/screen_guide.dart';
import 'package:claim_core/dashboard/screens/screen_measure_assist.dart';
import 'package:claim_core/dashboard/screens/screen_on_demand.dart';
import 'package:claim_core/dashboard/screens/screen_profile.dart';
import 'package:claim_core/screen_map.dart';
import 'package:claim_core/sidebar/screens/screen_drawer.dart';
import 'package:claim_core/sidebar/screens/screen_setting.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class ScreenDashboard extends StatefulWidget {
  @override
  _ScreenDashboardState createState() => _ScreenDashboardState();
}

class _ScreenDashboardState extends State<ScreenDashboard> {
  GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  void initState() {
    super.initState();

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      // DeviceOrientation.portraitDown,
    ]);
  }

  late GestureTapCallback onMapTap;
  late GestureTapCallback onRoutingTap;
  late GestureTapCallback onMeasureAssistTap;
  late GestureTapCallback onNewClaimTap;

  late GestureTapCallback onOnDemandTap;
  late GestureTapCallback onProfile;
  late GestureTapCallback onCalendarTap;
  late GestureTapCallback onSetting;
  late GestureTapCallback onContactsTap;
  late GestureTapCallback onGuideTap;

  @override
  Widget build(BuildContext context) {
    onMapTap = () {
      Navigator.push(context, ConstantFunctions.OpenNewActivity(ScreenMap()));
    };

    onRoutingTap = () {
      // List<int> nums = [13, 5, 13, 3, 2, 2, 2, 7, 2, 3, 7, 7, 7];

      // nums.sort((a, b) => a.to > b.bitLength);
      // print("onMapTap333 ${nums}");
    };

    onSetting = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(ScreenSetting()));
    };
    onGuideTap = () {
      Navigator.push(context, ConstantFunctions.OpenNewActivity(ScreenGuide()));
    };
    onContactsTap = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(ScreenContacts()));
    };
    onCalendarTap = () {
      ConstantFunctions.getSharePrefModeString("login_token").then(
        (login_token) {
          print("object : login_token : $login_token");

          RestApiUtils.ShowLoadingDialog(context);
          ServiceClaim.GetClaimFunction(context, login_token).then((value) {
            Navigator.pop(context);

            List<DataSingleClaim> data = value.data!;

            if (data == null) {
              ConstantFunctions.getSnakeBar(context, "data is null");
            } else if (data.length > 0) {
              Navigator.push(
                  context,
                  ConstantFunctions.OpenNewActivity(
                      ScreenCalendar(claim_list: data)));
            } else {
              ConstantFunctions.getSnakeBar(context, "Sorry no claim found");
            }
          });
        },
      );
    };
    onProfile = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(ScreenProfile()));
    };
    onNewClaimTap = () {
      ConstantFunctions.getSharePrefModeString("login_token").then(
        (login_token) {
          RestApiUtils.ShowLoadingDialog(context);
          ServiceClaim.GetAllDropDown(context, login_token)
              .then((modelAllDropdown) {
            ServiceClaim.GetServiceTypeDropDown(context, login_token)
                .then((modelservices) {
              if (modelAllDropdown.data != null &&
                  modelAllDropdown.data!.length > 0) {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(ScreenNewClaims(
                        modelAllDropdown: modelAllDropdown,
                        modelservices: modelservices)));
              } else {
                ConstantFunctions.getSnakeBar(
                    context, "Drop down values getting failed");
              }
            });

            //==============================================================

            //==============================================================
          });
        },
      );
    };
    onOnDemandTap = () {
      Navigator.push(
        context,
        ConstantFunctions.OpenNewActivity(ScreenOnDemand()),
      );
    };
    onMeasureAssistTap = () {
      Navigator.push(
        context,
        ConstantFunctions.OpenNewActivity(ScreenMeasureAssist()),
      );
    };
    return Scaffold(
      key: _drawerKey,
      drawer: ScreenDrawer(),
      body: GetBody(),
    );
  }

  Widget GetBody() {
    return Container(
        color: Color.fromRGBO(249, 198, 153, 1),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: new BoxDecoration(
                          color: Color.fromRGBO(255, 94, 0, 1),
                          //   borderRadius: BorderRadius.only(
                          //       bottomLeft: Radius.circular(130),
                          //       bottomRight: Radius.circular(190)),
                          // ),
                          borderRadius: BorderRadius.vertical(
                            bottom: Radius.elliptical(
                                MediaQuery.of(context).size.height, 190.0),
                          )),
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Column(
                        children: [
                          SizedBox(height: 30),
                          Row(
                            children: [
                              InkWell(
                                onTap: onProfile,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 94, 0, 1),
                                  ),
                                  // color: Color.fromRGBO(255, 102, 0, 1),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(left: 7),
                                  // decoration: WidgetsReusing.getListBoxDecoration(),
                                  child: Icon(
                                    Icons.person_pin,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text(
                                    'Dashboard',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: onSetting,
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(255, 94, 0, 1),
                                  ),
                                  padding: EdgeInsets.all(10),
                                  margin: EdgeInsets.only(right: 7),
                                  // decoration: WidgetsReusing.getListBoxDecoration(),
                                  child: Icon(
                                    Icons.settings,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  // center: Alignment.center,
                                  begin: Alignment.topCenter,

                                  end: Alignment.bottomCenter,
                                  stops: [
                                    0.15,
                                    0.4,
                                    // 0.6,
                                    // 0.9,
                                  ],
                                  colors: [
                                    Color.fromRGBO(55, 121, 253, 1),
                                    const Color.fromRGBO(86, 201, 250, 1)
                                  ],
                                  // tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              width: double.infinity,
                              // height: 120,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 7, vertical: 20),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              // decoration: WidgetsReusing.getListBoxDecoration(),

                              child: getWeather(
                                Icons.ac_unit,
                                "sdf",
                                "sfdf",
                              )
                              // child: getWeatherFunctional("", "", "")
                              // child: getWeatherFunctional(Icons.sunny, "hhh", "ggg"),
                              /*     child: FutureBuilder(
                // future: ,
                builder: (context, AsyncSnapshot<> snapshot) {
                  if(snapshot.hasError) {

                  }
                  else if(snapshot.hasData) {

                  }
                  else {

                  }
                },
              ),*/
                              ),
                          Container(
                            width: double.infinity,
                            // height: 120,

                            margin: EdgeInsets.symmetric(
                                horizontal: 7, vertical: 20),
                            padding: EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: WidgetsReusing.getListBoxDecoration(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    getIconText(Icons.list_alt, "Archive"),
                                    Spacer(),
                                    getIconText(
                                        Icons.notifications_none_outlined,
                                        "Alerts"),
                                    Spacer(),
                                    getIconText(
                                        Icons.construction, "Roof Tools"),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          getGridContainer(
                            Icons.calendar_today,
                            "Calendar",
                            onCalendarTap,
                            Icons.playlist_add_outlined,
                            "New Claim",
                            onNewClaimTap,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                      child: Column(
                        children: [
                          getGridContainer(
                            Icons.menu_book_rounded,
                            "Guide",
                            onGuideTap,
                            Icons.contact_mail_outlined,
                            "Contacts",
                            onContactsTap,
                          ),
                          getGridContainer(
                            Icons.explore,
                            "Routing",
                            onRoutingTap,
                            Icons.map,
                            "Map",
                            onMapTap,
                          ),
                          getGridContainer(
                            Icons.receipt_long,
                            "On Demand",
                            onOnDemandTap,
                            Icons.light_mode,
                            "Measure Assist",
                            onMeasureAssistTap,
                          ),
                        ],
                      ),
                    ),
                    // )),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Container(
                //  width: double.infinity,
                // height: 120,

                margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: WidgetsReusing.getListBoxDecoration(),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _drawerKey.currentState!.openDrawer();
                      },
                      child: Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 15),
                        child: Icon(
                          Icons.menu,
                          size: 30,
                          color: Color.fromRGBO(255, 102, 0, 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(255, 102, 0, 1),
                                  spreadRadius: 2),
                              BoxShadow(
                                  color: Color.fromRGBO(255, 102, 0, 1),
                                  // color: Colors.black.withOpacity(.25),
                                  offset: Offset(1, 1),
                                  blurRadius: 5,
                                  spreadRadius: 1)
                            ]),
                        child: Icon(
                          Icons.home,
                          size: 30,
                          color: Color.fromRGBO(255, 102, 0, 1),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          ConstantFunctions.OpenNewActivity(ScreenMyClaims()),
                        );
                      },
                      child: Icon(
                        Icons.list_alt,
                        size: 30,
                        color: Color.fromRGBO(255, 102, 0, 1),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget getWeather(
    time,
    icon_data,
    temp,
  ) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          // center: Alignment.center,
          begin: Alignment.topCenter,

          end: Alignment.bottomCenter,
          stops: [
            0.15,
            0.4,
            // 0.6,
            // 0.9,
          ],
          colors: [
            Color.fromRGBO(55, 121, 253, 1),
            const Color.fromRGBO(86, 201, 250, 1)
          ],
          // tileMode: TileMode.clamp,
        ),
        borderRadius: BorderRadius.circular(5),
      ),

      // color: Color.fromARGB(255, 138, 213, 248),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getWeatherhead2("FrankFort, IL", "92 F"),
              getWeatherhead3(Icons.sunny, "Sunny", "H:94", "L:60"),
            ],
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              getWeatherUpdate(
                "9 AM",
                Icons.sunny,
                "92",
              ),
              getWeatherUpdate(
                "9 AM",
                Icons.sunny,
                "92",
              ),
              getWeatherUpdate(
                "9 AM",
                Icons.sunny,
                "92",
              ),
              getWeatherUpdate(
                "9 AM",
                Icons.sunny,
                "92",
              ),
              getWeatherUpdate1(
                "9 AM",
                Icons.cloud_outlined,
                // Icon(
                //   Icons.outbond_outlined,
                //   size: 30,
                //   color: Colors.white,
                // ),
                "92",
              ),
              getWeatherUpdate1(
                "9 AM",
                Icons.cloud_outlined,
                "92",
              ),

              // getWeatherUpdate(
              //     Icons.cloud_outlined, "Thursday", "30%", "H:76 o L 66"),
              // getWeatherUpdate(
              //     Icons.cloud_outlined, "Friday", "30%", "H:76 o L 66"),
            ],
          ),
        ],
      ),
    );
  }

  Widget getWeatherUpdate(
    time,
    icon_data,
    temp,
  ) {
    return Column(
      children: [
        Text(time,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 13.5)),
        Icon(
          icon_data,
          size: 30,
          color: Colors.yellow,
        ),
        Text(temp,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 13.5)),
        // Text(humidity,
        //     style: Theme.of(context)
        //         .textTheme
        //         .headline4!
        //         .copyWith(fontSize: 13.5)),
      ],
    );
  }

  Widget getWeatherUpdate1(
    time,
    icon_data,
    temp,
  ) {
    return Column(
      children: [
        Text(time,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 13.5)),
        Icon(
          icon_data,
          size: 30,
          color: Colors.white,
        ),
        Text(temp,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 13.5)),
        // Text(humidity,
        //     style: Theme.of(context)
        //         .textTheme
        //         .headline4!
        //         .copyWith(fontSize: 13.5)),
      ],
    );
  }

  Widget getIconText(icon_data, title) {
    return Column(
      children: [
        Icon(
          icon_data,
          size: 30,
          color: Color.fromRGBO(205, 13, 30, 1),
        ),
        Text(title, style: Theme.of(context).textTheme.headline4),
      ],
    );
  }

  Widget getGridContainer(
      icon_data1, title1, onTapFirst, icon_data2, title2, onTapSecond) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(onTap: onTapFirst, child: GridContainer(icon_data1, title1)),
        Spacer(),
        InkWell(
          onTap: onTapSecond,
          child: GridContainer(icon_data2, title2),
        )
      ],
    );
  }

  Widget GridContainer(icon_data, title) {
    double width_height = MediaQuery.of(context).size.width / 2.5;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: width_height - 35,
      width: width_height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon_data,
            size: 50,
            color: Color.fromRGBO(205, 13, 30, 1),
          ),
          SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }

  Widget getWeatherhead2(
    text,
    text1,
  ) {
    return Column(
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 14.5)),
        Text(text1,
            style: Theme.of(context)
                .textTheme
                .headline6!
                .copyWith(fontSize: 14.5)),
      ],
    );
  }

  Widget getWeatherhead3(
    icon_data,
    text,
    hummadity,
    latitude,
  ) {
    return Row(
      children: [
        Icon(
          icon_data,
          size: 30,
          color: Colors.yellow,
        ),
        Column(
          children: [
            Text(text,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 14.5)),
            Row(
              children: [
                Text(hummadity,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14.5)),
                const SizedBox(
                  width: 2,
                ),
                Text(latitude,
                    style: Theme.of(context)
                        .textTheme
                        .headline6!
                        .copyWith(fontSize: 14.5)),
              ],
            )
          ],
        ),
      ],
    );
  }
}
