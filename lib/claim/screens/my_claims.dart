import 'dart:ui';

import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/screens/screen_my_claims.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/provider/userprovider.dart';
import 'package:claim_core/sidebar/screens/screen_drawer.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class MyClaims extends StatefulWidget {
  const MyClaims({Key? key}) : super(key: key);

  @override
  State<MyClaims> createState() => _MyClaimsState();
}

class _MyClaimsState extends State<MyClaims> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  Future<ModelGetClaim>? future_get_claim;

  String login_token = "";
  String getTime2(String time) {
    String spilt = time.split(',').last;
    spilt = spilt.split(',').first;
    print(spilt);
    DateTime tempDate = DateFormat("yyyy-MM-ddTHH:mm:ss").parse(spilt);
    String dateTo = DateFormat("hh:mm a").format(tempDate);
    print(dateTo);
    return dateTo;
  }

  @override
  void initState() {
    super.initState();

    ConstantFunctions.getSharePrefModeString("login_token").then(
      (loginToken) {
        print("object : login_token : $loginToken");
        this.login_token = loginToken;
        setState(() {
          future_get_claim = ServiceClaim.GetClaimFunction(context, loginToken);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(key: _drawerKey, drawer: ScreenDrawer(), body: GetBody());
  }

  Widget GetBody() {
    var userdata = Provider.of<UserProvider>(context);

    var message = userdata.userModel.message;
    return Container(
        color: ThemeColors.background_color,
        child: Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                color: ThemeColors.orange_button,
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
                                'MyClaims',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              decoration: const BoxDecoration(
                                color: ThemeColors.orange_button,
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
                      const SizedBox(
                        height: 10,
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'July,9,2022',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Icon(
                              Icons.arrow_drop_down,
                              color: Colors.white,
                              size: 20,
                            )
                          ],
                        ),
                      ),

                      Container(
                        height: MediaQuery.of(context).size.height / 1.4,
                        color: ThemeColors.background_color,
                        child: FutureBuilder(
                          future: future_get_claim,
                          builder:
                              (context, AsyncSnapshot<ModelGetClaim> snapshot) {
                            if (snapshot.hasData) {
                              return Container(
                                margin:
                                    const EdgeInsets.only(top: 10, bottom: 10),
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                decoration: const BoxDecoration(
                                  color: ThemeColors.background_color,
                                ),
                                child: MediaQuery.removePadding(
                                  context: context,
                                  removeTop: true,
                                  child:
                                      // loading == true
                                      //     ? Center(
                                      //         child: CircularProgressIndicator(),
                                      //       )
                                      //     :

                                      ListView.builder(
                                    itemCount: snapshot.data!.data!.length,
                                    itemBuilder: (context, index) {
                                      final claim = snapshot.data!.data![index];
                                      return myallclaims(
                                          "${claim.carrierName!.createdBy}",
                                          "${claim.address}",
                                          "${claim.claimId}",
                                          "status",
                                          "${claim.inspectionDate}",
                                          "${claim.inspectionDate}");

                                      // ListTile(
                                      //   title: Text(snapshot.data!.data![index].id
                                      //       .toString()),
                                      //   subtitle: Text(snapshot
                                      //       .data!.data![index].mainContactPhoneNumber
                                      //       .toString()),
                                      //   // trailing: Text(
                                      //   //     "${timeago.format(notificationsmodel.data[index].createdOn)}"),
                                      // );
                                    },
                                  ),
                                ),
                              );
                            } else {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                          },
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                child: Container(
                  //  width: double.infinity,
                  // height: 120,

                  margin:
                      const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
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
              ),
            ],
          ),
        ));
  }

  Widget myallclaims(
      name, address, claimId, status, dateAssign, dateInspection) {
    // TextStyle style1 = TextStyle(
    //     color: Colors.black, fontSize: 14.5, fontWeight: FontWeight.bold);
    TextStyle style2 = const TextStyle(
        color: Colors.black54, fontSize: 12, fontWeight: FontWeight.bold);

    TextStyle style3 = const TextStyle(
        color: Colors.black, fontSize: 15.5, fontWeight: FontWeight.bold);

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.only(left: 30, right: 30, top: 8),
      child: Container(
        width: double.infinity,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          name,
                          style: style3,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          address,
                          style: style2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Text(
                                'Claim ID:',
                                style: style2,
                              ),
                              Text(
                                claimId,
                                style: style2,
                              ),
                            ],
                          )),
                      // Align(
                      //  alignment: Alignment.bottomLeft,
                      // child: Row(
                      //   children: [
                      //     Text(
                      //       'Claim ID:',
                      //       style: style2,
                      //     ),
                      //     Text(
                      //       claimId,
                      //       style: style2,
                      //     ),
                      //   ],
                      // )),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Container(
                      color: Colors.black,
                    )),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          status,
                          style: style3,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Assigned',
                          style: style2,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          dateAssign,
                          style: style2,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Inspection Date',
                          style: style2,
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          dateInspection,
                          style: style2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
