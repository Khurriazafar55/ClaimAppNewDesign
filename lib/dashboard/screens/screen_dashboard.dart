import 'dart:convert';
import 'dart:io';

import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/screens/new_claim.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/dashboard/models/model_weather1.dart';
import 'package:claim_core/dashboard/screens/compass_screen.dart';
import 'package:claim_core/dashboard/screens/screen_calendar.dart';
import 'package:claim_core/dashboard/screens/screen_contacts.dart';
import 'package:claim_core/dashboard/screens/screen_guide.dart';
import 'package:claim_core/dashboard/screens/screen_measure_assist.dart';
import 'package:claim_core/dashboard/screens/screen_on_demand.dart';
import 'package:claim_core/dashboard/screens/screen_profile.dart';
import 'package:claim_core/screen_map.dart';
import 'package:claim_core/sidebar/screens/alerts_screen.dart';
import 'package:claim_core/sidebar/screens/screen_drawer.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

import '../../claim/screens/screen_my_claims.dart';
import '../../sidebar/settings_screens/settings_screen.dart';

class DashBoardScreen extends StatefulWidget {
  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

//  DateFormat("yyyy-MM-ddTHH:mm:ss").parse(dateTime)

  String getTime2(String time) {
    String spilt = time.split(',').last;
    spilt = spilt.split(',').first;
    print(spilt);
    DateTime tempDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(spilt);
    String dateTo = DateFormat("hh:mm a").format(tempDate);
    print(dateTo);
    return dateTo;
  }
  //yyyy-MM-dd

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
  late GestureTapCallback onDrawerTap;

  @override
  Widget build(BuildContext context) {
    onMapTap = () {
      Navigator.push(context, ConstantFunctions.OpenNewActivity(ScreenMap()));
    };

    onRoutingTap = () {
      // List<int> nums = [13, 5, 13, 3, 2, 2, 2, 7, 2, 3, 7, 7, 7];

      // nums.sort((a, b) => a.to > b.bitLength);
      // print("onMapTap333 ${nums}");

      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(const CompassScreen()));
    };

    onDrawerTap = () {
      _drawerKey.currentState!.openDrawer();
    };

    onSetting = () {
      Navigator.of(context, rootNavigator: true)
          .push(ConstantFunctions.OpenNewActivity(const ScreenSetting()));
    };
    onGuideTap = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(const ScreenGuide()));
    };
    onContactsTap = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(const ScreenContacts()));
    };
    onCalendarTap = () {
      ConstantFunctions.getSharePrefModeString("login_token").then(
        (loginToken) {
          print("object : login_token : $loginToken");

          RestApiUtils.ShowLoadingDialog(context);
          ServiceClaim.GetClaimFunction(context, loginToken).then((value) {
            Navigator.pop(context);

            List<DataSingleClaim> data = value.data!;

            if (data == null) {
              ConstantFunctions.getSnakeBar(context, "data is null");
            } else if (data.isNotEmpty) {
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
          context, ConstantFunctions.OpenNewActivity(const ScreenProfile()));
    };
    onNewClaimTap = () {
      ConstantFunctions.getSharePrefModeString("login_token").then(
        (loginToken) {
          RestApiUtils.ShowLoadingDialog(context);
          ServiceClaim.GetAllDropDown(context, loginToken)
              .then((modelAllDropdown) {
            ServiceClaim.GetServiceTypeDropDown(context, loginToken)
                .then((modelservices) {
              if (modelAllDropdown.data != null &&
                  modelAllDropdown.data!.isNotEmpty) {
                Navigator.pop(context);

                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(NewClaims(
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
        ConstantFunctions.OpenNewActivity(const ScreenOnDemand()),
      );
    };
    onMeasureAssistTap = () {
      Navigator.push(
        context,
        ConstantFunctions.OpenNewActivity(const ScreenMeasureAssist()),
      );
    };
    return Scaffold(key: _drawerKey, drawer: ScreenDrawer(), body: GetBody());
  }

  Widget GetBody() {
    return Container(
        color: ThemeColors.background_color,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: Color.fromRGBO(255, 94, 0, 1),
                          borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(95),
                          )),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
                      child: Column(
                        children: [
                          const SizedBox(height: 30),
                          Row(
                            children: [
                              InkWell(
                                onTap: onProfile,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 94, 0, 1),
                                  ),
                                  // color: Color.fromRGBO(255, 102, 0, 1),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(left: 7),
                                  // decoration: WidgetsReusing.getListBoxDecoration(),
                                  child: const Icon(
                                    Icons.person_pin,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              const Expanded(
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
                                  decoration: const BoxDecoration(
                                    color: Color.fromRGBO(255, 94, 0, 1),
                                  ),
                                  padding: const EdgeInsets.all(10),
                                  margin: const EdgeInsets.only(right: 7),
                                  // decoration: WidgetsReusing.getListBoxDecoration(),
                                  child: const Icon(
                                    Icons.settings,
                                    size: 30,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
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
                                    Color.fromRGBO(86, 201, 250, 1)
                                  ],
                                  // tileMode: TileMode.clamp,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              height: MediaQuery.of(context).size.height / 5.8,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 5, vertical: 5),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                children: [
                                  Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        getWeatherhead2(
                                            "FrankFort, IL", "92 F"),
                                        getWeatherhead3(Icons.sunny, "Sunny",
                                            "H:94", "L:60"),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    color:
                                        const Color.fromRGBO(86, 201, 250, 1),
                                    height: MediaQuery.of(context).size.height /
                                        10.5,
                                    child: FutureBuilder<List<ModelWeather>>(
                                      future: fetchWeather(),
                                      builder: (context, snapshot) {
                                        final weather = snapshot.data;
                                        if (snapshot.connectionState ==
                                            ConnectionState.waiting) {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                        if (weather == null) {
                                          return const Center(
                                              child: Text('No user found'));
                                        }

                                        return ListView.builder(
                                          itemCount: weather.length,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, index) {
                                            final temp = weather[index];

                                            return getWeatherUpdate(
                                                getTime2(temp.date),
                                                // temp.date,
                                                temp.summary,
                                                temp.temperatureC.toString());
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )),
                          Container(
                            width: double.infinity,
                            // height: 120,

                            margin: const EdgeInsets.symmetric(
                                horizontal: 7, vertical: 20),
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 10),
                            decoration: WidgetsReusing.getListBoxDecoration(),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    getIconText(Icons.list_alt, "Archive"),
                                    const Spacer(),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (_) {
                                          return const Alerts();
                                        }));
                                      },
                                      child: getIconText(
                                          Icons.notifications_none_outlined,
                                          "Alerts"),
                                    ),
                                    const Spacer(),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 5),
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
                  ],
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
              child: Container(
                //  width: double.infinity,
                // height: 120,

                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                decoration: WidgetsReusing.getListBoxDecoration(),

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        _drawerKey.currentState!.openDrawer();
                      },
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(left: 15),
                        child: const Icon(
                          Icons.menu,
                          size: 30,
                          color: Color.fromRGBO(255, 102, 0, 1),
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            ConstantFunctions.OpenNewActivity(
                                DashBoardScreen()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
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
                          child: const Icon(
                            Icons.home,
                            size: 30,
                            color: Color.fromRGBO(255, 102, 0, 1),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        Navigator.push(
                          context,
                          ConstantFunctions.OpenNewActivity(
                              const MyClaimsScreen()),
                        );
                      },
                      child: const Icon(
                        Icons.list_alt,
                        size: 30,
                        color: Color.fromRGBO(255, 102, 0, 1),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }

  Widget getWeatherUpdate(
    date,
    summary,
    temp,
  ) {
    return Card(
        color: const Color.fromRGBO(86, 201, 250, 1),
        elevation: 0,
        child: Column(
          children: [
            Text(date,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 13.5)),
            const SizedBox(
              height: 5,
            ),
            Text(summary,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 13.5)),
            const SizedBox(
              height: 5,
            ),
            Text(temp,
                style: Theme.of(context)
                    .textTheme
                    .headline6!
                    .copyWith(fontSize: 13.5)),
          ],
        ));
  }

  Widget getWeatherUpdate1(
    time,
    iconData,
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
          iconData,
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

  Widget getIconText(iconData, title) {
    return Column(
      children: [
        Icon(
          iconData,
          size: 30,
          color: const Color.fromRGBO(205, 13, 30, 1),
        ),
        Text(title, style: Theme.of(context).textTheme.headline4),
      ],
    );
  }

  Widget getGridContainer(
      iconData1, title1, onTapFirst, iconData2, title2, onTapSecond) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(onTap: onTapFirst, child: GridContainer(iconData1, title1)),
        const Spacer(),
        InkWell(
          onTap: onTapSecond,
          child: GridContainer(iconData2, title2),
        )
      ],
    );
  }

  Widget GridContainer(iconData, title) {
    double widthHeight = MediaQuery.of(context).size.width / 2.5;
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      margin: const EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: widthHeight - 35,
      width: widthHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            iconData,
            size: 50,
            color: const Color.fromRGBO(205, 13, 30, 1),
          ),
          const SizedBox(height: 10),
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
    iconData,
    text,
    hummadity,
    latitude,
  ) {
    return Row(
      children: [
        Icon(
          iconData,
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

  Future<List<ModelWeather>> fetchWeather() async {
    const baseUrl = 'https://insurancefapp.azurewebsites.net';
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/weatherforecast'),
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.toString(),
        },
      );
      if (response.statusCode != HttpStatus.ok) {
        throw Exception('failed to load user');
      }
      final List photos = jsonDecode(response.body);
      return photos.map((photo) => ModelWeather.fromMap(photo)).toList();
    } catch (e) {
      throw Exception('User failed  ');
    }
  }
}
