import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/screens/calim_tab/claim_tabs.dart';
import 'package:claim_core/claim/screens/screen_my_claims.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:claim_core/provider/userprovider.dart';
import 'package:claim_core/sidebar/screens/screen_drawer.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';
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
    print('$spilt ---------------');
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
        login_token = loginToken;
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
    return Scaffold(
        body: Stack(children: [
      BackGroundColor1(),
      Container(
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
                              color: ThemeColors.background_color,
                            ),
                            // color: Color.fromRGBO(255, 102, 0, 1),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(left: 7),
                            // decoration: WidgetsReusing.getListBoxDecoration(),
                            child: const Icon(
                              Icons.calendar_today,
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
                              color: ThemeColors.background_color,
                            ),
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(right: 7),
                            // decoration: WidgetsReusing.getListBoxDecoration(),
                            child: const Icon(
                              Icons.filter_alt_outlined,
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
                            '7/6/2022',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          Icon(
                            Icons.arrow_drop_down,
                            color: Colors.white,
                            size: 20,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 1.4,
                      // color: ThemeColors.background_color,
                      child: FutureBuilder(
                        future: future_get_claim,
                        builder:
                            (context, AsyncSnapshot<ModelGetClaim> snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator(
                              semanticsLabel: 'loading..',
                              color: Colors.white,
                              backgroundColor: Colors.white54,
                            ));
                          }

                          if (snapshot.hasError) {
                            return Container(
                              child: const Text('Something Wents wrong'),
                            );
                          }
                          if (snapshot.data != null) {
                            return Container(
                              margin:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,
                              decoration: const BoxDecoration(
                                  // color: Colors.white,
                                  ),
                              child: MediaQuery.removePadding(
                                context: context,
                                removeTop: true,
                                child: ListView.builder(
                                  itemCount: snapshot.data!.data!.length,
                                  itemBuilder: (context, index) {
                                    final claim = snapshot.data!.data![index];

                                    if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                          child: CircularProgressIndicator());
                                    }
                                    if (snapshot.data == null) {}
                                    return GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                ClaimMainPage(
                                              claim: claim,
                                              claimId: claim.claimId!,
                                            ),
                                          ),
                                        );
                                      },
                                      child: myallclaims(
                                        "${claim.adjusterName}",
                                        "${claim.address}",
                                        "${claim.claimId}",
                                        "${claim.claimStatus}",
                                        "${claim.inspectionDate}",
                                        "${claim.inspectionDate}",
                                      ),
                                    );
                                  },
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                              child: Text('No Claims found!'),
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
            ),
          ],
        ),
      ),
    ]));
  }

  Widget myallclaims(
    name,
    address,
    claimId,
    status,
    dateAssign,
    dateInspection,
  ) {
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              name,
                              style: style1,
                            ),
                            Text(
                              status,
                              style: style3,
                            ),
                          ],
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              address,
                              style: style2,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Assined',
                                  style: style2,
                                ),
                                Text(
                                  dateAssign,
                                  style: style2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              claimId,
                              style: style2,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Column(
                              children: [
                                Text(
                                  'Inspector Date',
                                  style: style2,
                                ),
                                Text(
                                  dateInspection,
                                  style: style2,
                                ),
                              ],
                            ),
                          ],
                        ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Text(
                        //           name,
                        //           style: style3,
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         height: 10,
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Text(
                        //           address,
                        //           style: style2,
                        //         ),
                        //       ),
                        //       const SizedBox(
                        //         height: 10,
                        //       ),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Text(
                        //           '',
                        //           style: style3,
                        //         ),
                        //       ),
                        //       Container(
                        //           alignment: Alignment.bottomLeft,
                        //           child: Row(
                        //             children: [
                        //               Text(
                        //                 'Claim ID:',
                        //                 style: style2,
                        //               ),
                        //               Text(
                        //                 claimId,
                        //                 style: style2,
                        //               ),
                        //             ],
                        //           )),
                        //       Align(
                        //         alignment: Alignment.topLeft,
                        //         child: Text(
                        //           '',
                        //           style: style3,
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        // Expanded(
                        //     flex: 1,
                        //     child: Container(
                        //       color: Colors.black,
                        //     )),
                        //     Expanded(
                        //       flex: 5,
                        //       child: Column(
                        //         children: [
                        //           Align(
                        //             alignment: Alignment.topRight,
                        //             child: Text(
                        //               status,
                        //               style: style3,
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: 10,
                        //           ),
                        //           Align(
                        //             alignment: Alignment.center,
                        //             child: Text(
                        //               'Assigned',
                        //               style: style2,
                        //             ),
                        //           ),
                        //           Align(
                        //             alignment: Alignment.center,
                        //             child: Text(
                        //               dateAssign,
                        //               style: style2,
                        //             ),
                        //           ),
                        //           const SizedBox(
                        //             height: 10,
                        //           ),
                        //           Align(
                        //             alignment: Alignment.center,
                        //             child: Text(
                        //               'Inspection Date',
                        //               style: style2,
                        //             ),
                        //           ),
                        //           Align(
                        //             alignment: Alignment.topLeft,
                        //             child: Text(
                        //               dateInspection,
                        //               style: style2,
                        //             ),
                        //           ),
                      ],
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }

  TextStyle style1 = const TextStyle(
      color: Color.fromARGB(255, 49, 46, 46),
      fontSize: 15.5,
      fontWeight: FontWeight.bold);

  TextStyle style2 = const TextStyle(
    color: Colors.black,
    fontSize: 14,
    // fontWeight: FontWeight.bold,
  );

  TextStyle style3 = const TextStyle(
    color: Colors.blue,
    fontSize: 15.5,
    fontWeight: FontWeight.bold,
    decoration: TextDecoration.underline,
    decorationColor: Colors.blue,
    decorationThickness: 2.5,
  );
  Widget ReusableClaimsData(String text, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          text,
          style: style2,
        ),
        Text(
          text2,
          style: style2,
        ),
      ],
    );
  }
}
