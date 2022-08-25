import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/screens/screen_archive.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class MyClaimsScreen extends StatefulWidget {
  const MyClaimsScreen({Key? key}) : super(key: key);

  @override
  _MyClaimsScreenState createState() => _MyClaimsScreenState();
}

class _MyClaimsScreenState extends State<MyClaimsScreen> {
  Future<ModelGetClaim>? future_get_claim;

  String login_token = "";

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
    GestureTapCallback onPresseddd = () {
      setState(() {
        future_get_claim = ServiceClaim.GetClaimFunction(context, login_token);
      });
    };

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // key: _drawerKey,
      // drawer: ScreenDrawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: AppBar().preferredSize.height),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 15),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "My Claims",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            ConstantFunctions.OpenNewActivity(
                                const ScreenArchive()),
                          );
                        },
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(right: 7),
                          decoration: WidgetsReusing.getListBoxDecoration(),
                          child: const Icon(
                            Icons.search,
                            size: 30,
                          ),
                        ),
                      )
                    ],
                  ),
                  Container(
                    // height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getIconText("Assigned", Colors.blue),
                        getIconText("In Progress", Colors.orange),
                        getIconText("Cancelled", Colors.black54),
                      ],
                    ),
                  ),
                  // Expanded(
                  //   child: FutureBuilder(
                  //     future: future_get_claim,
                  //     builder:
                  //         (context, AsyncSnapshot<ModelGetClaim> snapshot) {
                  //       //  print("snapshotobject : hasData : ${snapshot.hasData}");
                  //       // print("snapshotobject : hasError : ${snapshot.hasError}");

                  //       if (snapshot.hasData) {
                  //         // print("object : data : ${snapshot.data}");
                  //         if (snapshot.data!.data == null &&
                  //             snapshot.data!.status == 200) {
                  //           return WidgetsReusing.getReLoadWidget(context,
                  //               icon_path: AppAssets.claim_issues,
                  //               message: "${snapshot.error.toString()}",
                  //               onPresseddd: onPresseddd);
                  //         }
                  //         if (snapshot.data!.data != null &&
                  //             snapshot.data!.data!.length > 0) {
                  //           return ListView.builder(
                  //             itemCount: snapshot.data!.data!.length,
                  //             itemBuilder: (context, index) {
                  //               return InkWell(
                  //                 onTap: () {
                  //                   Color _colour = Colors.blue;
                  //                   if (snapshot.data!.data![index].state ==
                  //                       "Assigned") {
                  //                     _colour = Colors.blue;
                  //                   } else if (snapshot
                  //                           .data!.data![index].state ==

                  //                       "In Progress") {
                  //                     _colour = Colors.orange;
                  //                   } else if (snapshot
                  //                           .data!.data![index].state ==
                  //                       "Cancelled") {
                  //                     _colour = Colors.black54;
                  //                   }

                  //                   Navigator.push(
                  //                       context,
                  //                       ConstantFunctions.OpenNewActivity(
                  //                           ScreenNamePHClaimDetail(
                  //                         dataSingleClaim:
                  //                             snapshot.data!.data![index],
                  //                         status_color: _colour,
                  //                       )));
                  //                 },
                  //                 child: WidgetsReusing.GetClaimListItem(
                  //                     snapshot.data!.data![index]),
                  //               );

                  //             },

                  //           );
                  //         } else {
                  //           return WidgetsReusing.getReLoadWidget(context,
                  //               icon_path: "claim_issues.json",
                  //               message: "${snapshot.data!.message}",
                  //               onPresseddd: onPresseddd);
                  //         }
                  //       } else if (snapshot.hasError) {
                  //         return WidgetsReusing.getReLoadWidget(context,
                  //             message: "${snapshot.error.toString()}",
                  //             onPresseddd: onPresseddd);
                  //       } else {
                  //         return ConstantFunctions.ShowProgressLoadingView(
                  //             context);
                  //       }
                  //     },
                  //   ),
                  // ),
                  // // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: 10,
                  //     itemBuilder: (context, index) {
                  //       return WidgetsReusing.GetClaimListItem();
                  //     },
                  //   ),
                  // )

                  Container(
                    child: FutureBuilder(
                      future: future_get_claim,
                      builder:
                          (context, AsyncSnapshot<ModelGetClaim> snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            //   child: CircularProgressIndicator(
                            //       color: Colors.white,
                            //       backgroundColor: Colors.green),
                            // );
                            child: Text('Searching..'),
                          );
                        }
                        if (snapshot.data == null) {
                          return const Center(
                            child: Text('No Claims found!'),
                          );
                        } else {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(25),
                                    topRight: Radius.circular(25))),
                            child: ListView.builder(
                              itemCount: snapshot.data!.data!.length,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  title: Text(snapshot.data!.data![index].id
                                      .toString()),
                                  subtitle: Text(snapshot
                                      .data!.data![index].mainContactPhoneNumber
                                      .toString()),
                                  // trailing: Text(
                                  //     "${timeago.format(notificationsmodel.data[index].createdOn)}"),
                                );
                              },
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getIconText(title, Color color) {
    return Container(
      margin: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 5),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: color,
        width: 2.5, // Underline thickness
      ))),
      child: Text(title,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(fontSize: 13)),
    );
  }

  Widget getGridContainer(
      iconData1, title1, onTapFirst, iconData2, title2, onTapSecond) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: onTapFirst,
            child: GridContainer(iconData1, title1, onTapFirst)),
        const Spacer(),
        InkWell(
          onTap: onTapFirst,
          child: GridContainer(iconData2, title2, onTapSecond),
        )
      ],
    );
  }

  Widget GridContainer(iconData, title, onTap) {
    double widthHeight = MediaQuery.of(context).size.width / 2.5;
    return Container(
      margin: const EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: widthHeight - 35,
      width: widthHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 50),
          const SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
