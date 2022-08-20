import 'dart:async';
import 'dart:io';

import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/screens/screen_my_claims.dart';
import 'package:claim_core/sidebar/models/model_notifications.dart';
import 'package:claim_core/sidebar/screens/screen_drawer.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../../provider/userprovider.dart';
import '../../splas_screen.dart';

class Alerts extends StatefulWidget {
  const Alerts({Key? key}) : super(key: key);

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _drawerKey, drawer: ScreenDrawer(), body: GetBody());
  }

  Widget GetBody() {
    var userdata = Provider.of<UserProvider>(context);
    var message = userdata.userModel.message;
    return Container(
        color: ThemeColors.orange_button,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 40,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                decoration: const BoxDecoration(
                                  color: Color.fromRGBO(255, 94, 0, 1),
                                ),
                                // color: Color.fromRGBO(255, 102, 0, 1),
                                padding: const EdgeInsets.all(10),
                                margin: const EdgeInsets.only(left: 7),
                                // decoration: WidgetsReusing.getListBoxDecoration(),
                                child: const Icon(
                                  Icons.arrow_back,
                                  size: 30,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 113,
                            child: Center(
                              child: Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                        width: 2.0, color: Colors.white),
                                  ),
                                ),
                                child: Column(children: const [
                                  Text(
                                    'Alerts',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                ]),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      height: 37.0,
                      width: 180.0,
                      child: Padding(
                          padding: const EdgeInsets.only(top: 2.0),
                          child: Container(
                              child: InkWell(
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: const Center(
                                  child: Text(
                                'clear all',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            onTap: () {
                              // ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              //   content: Text("Sending Message"),
                              // ));
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //       builder: (context) => login_screen(),
                              //     ));
                            },
                          ))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    //               Container(
                    //                 child:
                    //                 FutureBuilder(
                    //                future: getAllNotificationFunction(message!),
                    //                builder: (context, snapshot) {
                    //                if (snapshot.hasData) {
                    //               ModelNotifications data = snapshot.data.data;
                    //               return CustomInfoSubways(
                    //                 markers: data,
                    //               );
                    //             } else {
                    //             return Center(
                    //              child: CircularProgressIndicator(),
                    //              );
                    //     }
                    //   },
                    // ),),

                    // Container(
                    //   child: FutureBuilder(
                    //     future: getAllNotificationFunction(message),
                    //     builder: (context, snapshot) {
                    //       if (snapshot.hasData) {
                    //         ModelNotifications notificationsmodel =
                    //             snapshot.data;
                    //         return Container(
                    //           width: MediaQuery.of(context).size.width,
                    //           height: MediaQuery.of(context).size.height,
                    //           decoration: BoxDecoration(
                    //               color: Colors.white,
                    //               borderRadius: BorderRadius.only(
                    //                   topLeft: Radius.circular(25),
                    //                   topRight: Radius.circular(25))),
                    //           child: ListView.builder(
                    //             itemCount: notificationsmodel.data.length,
                    //             itemBuilder: (context, index) {
                    //               return ListTile(
                    //                 title: Text(
                    //                     notificationsmodel.data[index].title),
                    //                 subtitle: Text(
                    //                     notificationsmodel.data[index].body),
                    //                 trailing: Text(
                    //                     "${timeago.format(notificationsmodel.data[index].createdOn)}"),
                    //               );
                    //             },
                    //           ),
                    //         );
                    //       } else {
                    //         return Center(
                    //           child: CircularProgressIndicator(),
                    //         );
                    //       }
                    //     },
                    //   ),
                    // ),

                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 2),
                      child: alertsData("Claim Assigned",
                          "Aaasign for 07/12/2022 at 2.00", "Today at2:00"),
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
            )
          ],
        ));
  }

  Widget alertsData(
    text1,
    text2,
    text3,
  ) {
    TextStyle style1 = const TextStyle(
        color: ThemeColors.headline1_color_lt,
        fontSize: 15,
        fontWeight: FontWeight.bold);
    TextStyle style2 = const TextStyle(
        color: ThemeColors.headline1_color_lt,
        fontSize: 13.5,
        fontWeight: FontWeight.bold);
    TextStyle style3 = const TextStyle(
      color: ThemeColors.headline1_color_lt,
      fontSize: 10,
    );
    return Card(
        color: Colors.white,
        margin: const EdgeInsets.all(2),
        // padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        // elevation: 0,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10),
              child: Row(children: [
                Text(text1, style: style1),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5),
              child: Row(children: [
                Text(text2, style: style2),
              ]),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10, bottom: 5),
              child: Row(children: [
                Text(text3, style: style3),
              ]),
            ),
          ],
        ));
  }

  // Future<ModelNotifications> getAllNotificationFunction(String message) async {
  //   const baseUrl = 'https://insurancefapp.azurewebsites.net';
  //   try {
  //     Map<String, String> _header = {
  //       'Content-Type': 'application/json',
  //       'Accept': 'application/json',
  //       'Authorization': 'Bearer $message',
  //     };
  //     final response = await http
  //         .get(Uri.parse('$baseUrl/api/Notification/GetAll'), headers: _header);
  //     // var response = await client
  //     //     .get(Uri.parse(RestApiUtils.get_all_notification), headers: _header)
  //     //     .timeout(time_out);

  Future<ModelNotifications> getAllNotificationFunction(String bearer) async {
    const baseUrl = 'https://insurancefapp.azurewebsites.net';
    try {
      Map<String, String> header = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $bearer',
      };
      final response = await http
          .get(Uri.parse('$baseUrl/api/Notification/GetAll'), headers: header);
      // var response = await client
      //     .get(Uri.parse(RestApiUtils.get_all_notification), headers: _header)
      //     .timeout(time_out);

      RestApiUtils.GetPrintHeaderBody(
          RestApiUtils.get_all_notification, header, null, response);

      if (response.statusCode == 200) {
        final model = modelNotificationsFromMap(response.body);
        return model;
      } else if (response.statusCode == 401) {
        ConstantFunctions.saveSharePrefModeString("login_token", "");
        ConstantFunctions.OpenNewScreenClean(context, ScreenSplash());
        return null!;
      } else {
        return ModelNotifications(data: null);
      }
    } on TimeoutException catch (_) {
      return ModelNotifications(data: null);
    } on SocketException {
      return ModelNotifications(data: null);
    } catch (ex) {
      return ModelNotifications(data: null);
    }
  }

  //     RestApiUtils.GetPrintHeaderBody(
  //         RestApiUtils.get_all_notification, _header, null, response);

  //     if (response.statusCode == 200) {
  //       final _model = modelNotificationsFromMap(response.body);
  //       return _model;
  //     } else if (response.statusCode == 401) {
  //       ConstantFunctions.saveSharePrefModeString("login_token", "");
  //       ConstantFunctions.OpenNewScreenClean(context, ScreenSplash());
  //       return null!;
  //     } else {
  //       return ModelNotifications(data: null);
  //     }
  //   } on TimeoutException catch (_) {
  //     return ModelNotifications(data: null);
  //   } on SocketException {
  //     return ModelNotifications(data: null);
  //   } catch (ex) {
  //     return ModelNotifications(data: null);
  //   }

}
