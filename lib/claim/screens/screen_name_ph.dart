/*
import 'dart:async';

import 'package:claim_app/app_theme_work/textformfield_theme.dart';
import 'package:claim_app/app_theme_work/widgets_reusing.dart';
import 'package:claim_app/claim/models/model_get_claim_id.dart';
import 'package:claim_app/claim/models/model_get_report.dart';
import 'package:claim_app/claim/reports/screen_reports.dart';
import 'package:claim_app/claim/services/service_claim.dart';
import 'package:claim_app/utilities/constant_functions.dart';
import 'package:claim_app/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenNamePH extends StatefulWidget {
  final String claim_id;
  final Color status_color;
  const ScreenNamePH({required this.claim_id, required this.status_color});

  @override
  _ScreenNamePHState createState() => _ScreenNamePHState();
}

class _ScreenNamePHState extends State<ScreenNamePH> {
  TextEditingController? txtEdtCntrlr1,
      txtEdtCntrlr2,
      txtEdtCntrlr3,
      txtEdtCntrlr4,
      txtEdtCntrlr5,
      txtEdtCntrlr6,
      txtEdtCntrlr7,
      txtEdtCntrlr8,
      txtEdtCntrlr9,
      txtEdtCntrlr10,
      txtEdtCntrlr11,
      txtEdtCntrlr12,
      txtEdtCntrlr13,
      txtEdtCntrlr14,
      txtEdtCntrlr15,
      txtEdtCntrlr16,
      txtEdtCntrlr17,
      txtEdtCntrlr18,
      txtEdtCntrlr19,
      txtEdtCntrlr20,
      txtEdtCntrlr21,
      txtEdtCntrlr22,
      txtEdtCntrlr23,
      txtEdtCntrlr24,
      txtEdtCntrlr25,
      txtEdtCntrlr26,
      txtEdtCntrlr27;

  Future<ModelGetClaimId>? future_get_claim;

  @override
  void initState() {
    super.initState();

    InitionalizeTextEditingController();
    ConstantFunctions.getSharePrefModeString("login_token").then(
      (login_token) {
        setState(() {
          future_get_claim = ServiceClaim.GetClaimById(
            context,
            login_token,
            widget.claim_id,
          );
        });
      },
    );
  }

  void InitionalizeTextEditingController() {
    txtEdtCntrlr1 = TextEditingController();
    txtEdtCntrlr2 = TextEditingController();
    txtEdtCntrlr3 = TextEditingController();
    txtEdtCntrlr4 = TextEditingController();
    txtEdtCntrlr5 = TextEditingController();
    txtEdtCntrlr6 = TextEditingController();
    txtEdtCntrlr7 = TextEditingController();
    txtEdtCntrlr8 = TextEditingController();
    txtEdtCntrlr9 = TextEditingController();
    txtEdtCntrlr10 = TextEditingController();
    txtEdtCntrlr11 = TextEditingController();
    txtEdtCntrlr12 = TextEditingController();
    txtEdtCntrlr13 = TextEditingController();
    txtEdtCntrlr14 = TextEditingController();
    txtEdtCntrlr15 = TextEditingController();
    txtEdtCntrlr16 = TextEditingController();
    txtEdtCntrlr17 = TextEditingController();
    txtEdtCntrlr18 = TextEditingController();
    txtEdtCntrlr19 = TextEditingController();
    txtEdtCntrlr20 = TextEditingController();
    txtEdtCntrlr21 = TextEditingController();
    txtEdtCntrlr22 = TextEditingController();
    txtEdtCntrlr23 = TextEditingController();
    txtEdtCntrlr24 = TextEditingController();
    txtEdtCntrlr25 = TextEditingController();
    txtEdtCntrlr26 = TextEditingController();
    txtEdtCntrlr27 = TextEditingController();

    txtEdtCntrlr16!.text =
        ConstantFunctions.formattedDatefinal.format(DateTime.now());

    txtEdtCntrlr17!.text =
        ConstantFunctions.formattedTimefinal.format(DateTime.now());
  }

  final paddding = EdgeInsets.symmetric(horizontal: 5, vertical: 5);

  @override
  Widget build(BuildContext context) {
    GestureTapCallback GOTOReport = () {};

    String _selection_radio = "roof";
    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        // key: _drawerKey,
        // drawer: ScreenDrawer(),
        body: Column(
          children: [
            SizedBox(height: AppBar().preferredSize.height),
            Expanded(
              child: FutureBuilder(
                future: future_get_claim,
                builder: (context, AsyncSnapshot<ModelGetClaimId> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.data != null) {
                      if (snapshot.data!.data!.length > 0) {
                        DataClaimDetails claim_detail = snapshot.data!.data![0];

                        ClaimFinalClass claim_final_class =
                            GetClaimDetails(snapshot.data!.data![0]);

                        if (claim_detail.measureassistElevation!) {
                          _selection_radio = "elevation";
                        } else if (claim_detail.measureassistRoof!) {
                          _selection_radio = "roof";
                        } else {
                          _selection_radio = "none";
                        }

                        txtEdtCntrlr1!.text =
                            "${snapshot.data!.data![0].policyHolderName}";
                        txtEdtCntrlr2!.text =
                            "${snapshot.data!.data![0].mainContactPhoneNumber}";
                        txtEdtCntrlr3!.text =
                            "${snapshot.data!.data![0].policyHolderEmail}";
                        txtEdtCntrlr4!.text =
                            "${snapshot.data!.data![0].policyHolderPhoneNumber}";
                        txtEdtCntrlr5!.text =
                            "${snapshot.data!.data![0].adjusterName}";
                        txtEdtCntrlr6!.text =
                            "${snapshot.data!.data![0].adjusterEmail}";
                        txtEdtCntrlr7!.text =
                            "${snapshot.data!.data![0].adjusterPhoneNumber}";
                        txtEdtCntrlr8!.text =
                            "${snapshot.data!.data![0].address}";
                        txtEdtCntrlr9!.text = "${snapshot.data!.data![0].city}";
                        txtEdtCntrlr10!.text =
                            "${snapshot.data!.data![0].zipCode}";
                        txtEdtCntrlr11!.text =
                            "${snapshot.data!.data![0].claimId}";
                        txtEdtCntrlr12!.text =
                            "${snapshot.data!.data![0].isDamageTypeValue}";
                        txtEdtCntrlr13!.text =
                            "${snapshot.data!.data![0].stories}";
                        txtEdtCntrlr14!.text =
                            "${snapshot.data!.data![0].additionalFileSubmission}";
                        txtEdtCntrlr15!.text =
                            "${snapshot.data!.data![0].additionalInformation}";
                        txtEdtCntrlr16!.text =
                            "${snapshot.data!.data![0].inspectionDate}";
                        txtEdtCntrlr17!.text =
                            "${snapshot.data!.data![0].inspectionTime}";
                        txtEdtCntrlr18!.text =
                            "${snapshot.data!.data![0].state!.value}";
                        txtEdtCntrlr19!.text =
                            "${snapshot.data!.data![0].catastropheEvent!.value}";
                        txtEdtCntrlr20!.text =
                            "${snapshot.data!.data![0].reInspection!.value}";
                        txtEdtCntrlr21!.text =
                            "${snapshot.data!.data![0].independentAdjuster!.value}";
                        // txtEdtCntrlr22!.text =
                        //     "${snapshot.data!.data![0].serviceType!.serviceName}";
                        txtEdtCntrlr23!.text =
                            "${snapshot.data!.data![0].isDamageType}";
                        txtEdtCntrlr24!.text =
                            "${snapshot.data!.data![0].pitch!.value}";
                        txtEdtCntrlr25!.text =
                            "${snapshot.data!.data![0].photoSubmissionType!.value}";
                        txtEdtCntrlr26!.text =
                            "${snapshot.data!.data![0].scopeSubmissionType!.value}";
                        txtEdtCntrlr27!.text =
                            "${snapshot.data!.data![0].measurementSubmissionType!.value}";

                        print("objectobject ${snapshot.data!.data!.length}");

                        return ListView(
                          children: [
                            GetAppBar(),
                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "",
                              txtEdtCntrlr1,
                              "Policy Holder Name",
                              paddding,
                              enabled: false,
                            ),
                            Divider(thickness: 2, endIndent: 5, indent: 1),
                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "Main Contact Phone Number",
                              txtEdtCntrlr2,
                              "Main Contact Phone Number",
                              paddding,
                              enabled: false,
                            ),
                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "Policy Holder Email",
                              txtEdtCntrlr3,
                              "Policy Holder Email",
                              paddding,
                              enabled: false,
                            ),
                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "Policy Holder Phone Number",
                              txtEdtCntrlr4,
                              "Policy Holder Phone Number",
                              paddding,
                              enabled: false,
                            ),
                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "Adjuster Name",
                              txtEdtCntrlr5,
                              "Adjuster Name",
                              paddding,
                              enabled: false,
                            ),
                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "Adjuster Email",
                              txtEdtCntrlr6,
                              "Adjuster Email",
                              paddding,
                              enabled: false,
                            ),
                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "Adjuster Phone Number",
                              txtEdtCntrlr7,
                              "Adjuster Phone Number",
                              paddding,
                              enabled: false,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Carrier Name",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "Address",
                                    txtEdtCntrlr8,
                                    "Address",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "City",
                                    txtEdtCntrlr9,
                                    "City",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "State",
                                    txtEdtCntrlr18,
                                    "State",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                          context,
                                          "Zip",
                                          txtEdtCntrlr10,
                                          "Zip",
                                          paddding,
                                          enabled: false),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "Catastrope Event",
                                    txtEdtCntrlr19,
                                    "Catastrope Event",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "Re-Inspection?",
                                    txtEdtCntrlr20,
                                    "Re-Inspection?",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                              ],
                            ),
                            //are you adjuster
                            Expanded(
                              child:
                                  TextFormFieldTheme.GetTextFormFieldWithBorder(
                                context,
                                "Are you an independent Adjuster ? ",
                                txtEdtCntrlr21,
                                "Are you an independent Adjuster ? ",
                                paddding,
                                enabled: false,
                              ),
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "Claim Number",
                                    txtEdtCntrlr11,
                                    "Claim Number",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "Service Type",
                                    txtEdtCntrlr22,
                                    "Service Type",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "Inspection Date",
                                    txtEdtCntrlr16,
                                    "Inspection Date",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                    context,
                                    "Inspection Time",
                                    txtEdtCntrlr17,
                                    "Inspection Time",
                                    paddding,
                                    enabled: false,
                                  ),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                          context,
                                          "Damage Type",
                                          txtEdtCntrlr23,
                                          "Damage Type",
                                          paddding,
                                          enabled: false),
                                ),
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                          context,
                                          "Damage Location",
                                          txtEdtCntrlr12,
                                          "Damage Location",
                                          paddding,
                                          enabled: false),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                          context,
                                          "Pitch",
                                          txtEdtCntrlr24,
                                          "Pitch",
                                          paddding,
                                          enabled: false),
                                ),
                                Expanded(
                                    child: TextFormFieldTheme
                                        .GetTextFormFieldWithBorder(
                                            context,
                                            "Stories",
                                            txtEdtCntrlr13,
                                            "Stories",
                                            paddding,
                                            enabled: false)),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                          context,
                                          "Photo Submission Type",
                                          txtEdtCntrlr25,
                                          "Stories",
                                          paddding,
                                          enabled: false),
                                ),
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                          context,
                                          "Scope Submission Type",
                                          txtEdtCntrlr26,
                                          "Scope Submission Type",
                                          paddding,
                                          enabled: false),
                                ),
                              ],
                            ),

                            Row(
                              children: [
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                          context,
                                          "Report Submission Type",
                                          txtEdtCntrlr26,
                                          "Report Submission Type",
                                          paddding,
                                          enabled: false),
                                ),
                                Expanded(
                                  child: TextFormFieldTheme
                                      .GetTextFormFieldWithBorder(
                                          context,
                                          "Measurement Submission Type",
                                          txtEdtCntrlr27,
                                          "Measurement Submission Type",
                                          paddding,
                                          enabled: false),
                                ),
                              ],
                            ),

                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "Aditional File Submission",
                              txtEdtCntrlr14,
                              "Aditional File Submission",
                              paddding,
                              enabled: false,
                            ),

                            TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "Aditional Information",
                              txtEdtCntrlr15,
                              "Aditional Information",
                              paddding,
                              enabled: false,
                            ),

                            Divider(thickness: 2, endIndent: 5, indent: 1),

                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 10),
                              width: double.infinity,
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text("Measurement Assist",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6),
                                  SizedBox(height: 5),
                                  Text(
                                      "If you want to request a measurements for your inspection, do so here",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText2),
                                ],
                              ),
                            ),

                            Column(
                              children: [
                                ListTile(
                                  title: Text("None"),
                                  leading: Radio(
                                      value: "None",
                                      groupValue: _selection_radio,
                                      onChanged: (value) {
                                        setState(() {
                                          _selection_radio = value.toString();
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: Text("Roof"),
                                  leading: Radio(
                                      value: "Roof",
                                      groupValue: _selection_radio,
                                      onChanged: (value) {
                                        setState(() {
                                          _selection_radio = value.toString();
                                        });
                                      }),
                                ),
                                ListTile(
                                  title: Text("Elevation"),
                                  leading: Radio(
                                      value: "Elevation",
                                      groupValue: _selection_radio,
                                      onChanged: (value) {
                                        setState(() {
                                          _selection_radio = value.toString();
                                        });
                                      }),
                                )
                              ],
                            ),

                            Divider(thickness: 2, endIndent: 5, indent: 1),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 18, vertical: 5),
                              child: WidgetsReusing.getElevatedButton(
                                  context, "Go to Report", () {
                                ConstantFunctions.getSharePrefModeString(
                                        "login_token")
                                    .then(
                                  (login_token) {
                                    RestApiUtils.ShowLoadingDialog(context);
                                    ServiceClaim.GetAllDropDown(
                                            context, login_token)
                                        .then((modelAllDropdown) {
                                      Navigator.pop(context);
                                      if (modelAllDropdown.data != null &&
                                          modelAllDropdown.data!.length > 0) {
                                        Navigator.push(
                                            context,
                                            ConstantFunctions.OpenNewActivity(
                                                ScreenReports(
                                              modelAllDropdown:
                                                  modelAllDropdown,
                                              claimFinalClass:
                                                  claim_final_class,
                                            )));
                                      } else {
                                        ConstantFunctions.getSnakeBar(context,
                                            "Drop down values getting failed");
                                      }
                                    });
                                  },
                                );
                              }),
                            ),

                            //sdfsdfsfsfdsdf
                            SizedBox(height: 30)
                          ],
                        );
                      } else {
                        return Column(
                          children: [
                            SizedBox(height: 35),
                            GetAppBar(),
                            WidgetsReusing.getReLoadWidget(context,
                                message: "No data found", onPresseddd: null),
                          ],
                        );
                      }
                    } else {
                      return Column(
                        children: [
                          GetAppBar(),
                          WidgetsReusing.getReLoadWidget(context,
                              message: "No data found", onPresseddd: null),
                        ],
                      );
                    }
                  } else if (snapshot.hasError) {
                    return Column(
                      children: [
                        GetAppBar(),
                        WidgetsReusing.getReLoadWidget(context,
                            message: snapshot.error.toString(),
                            onPresseddd: null),
                      ],
                    );
                  } else {
                    return Center(
                        child:
                            ConstantFunctions.ShowProgressLoadingView(context));
                  }
                },
              ),
            ),
          ],
        ));
  }

  Widget getIconText(title, Color color) {
    return Container(
      margin: EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 5),
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: color,
        width: 2.5, // Underline thickness
      ))),
      // child: Text(title, style: Theme.of(context).textTheme.subtitle2),
    );
  }

  Widget getGridContainer(
      icon_data1, title1, onTapFirst, icon_data2, title2, onTapSecond) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: onTapFirst,
            child: GridContainer(icon_data1, title1, onTapFirst)),
        Spacer(),
        InkWell(
          onTap: onTapFirst,
          child: GridContainer(icon_data2, title2, onTapSecond),
        )
      ],
    );
  }

  ClaimFinalClass GetClaimDetails(DataClaimDetails claim_detail) {
    return ClaimFinalClass(
      isCarrierOtherValue: claim_detail.isCarrierOtherValue,
      isDamageType: claim_detail.isDamageType,
      isDamageTypeValue: claim_detail.isDamageTypeValue,
      isDamageLocation: claim_detail.isDamageLocation,
      isDamageLocationValue: claim_detail.isDamageLocationValue,
      catastropheEvent: claim_detail.catastropheEvent,
      reInspection: claim_detail.reInspection,
      address: claim_detail.address,
      city: claim_detail.city,
      independentAdjuster: claim_detail.independentAdjuster,
      state: claim_detail.state,
      zipCode: claim_detail.zipCode,
      device: claim_detail.device,
      note: claim_detail.note,
      remarks: claim_detail.remarks,
      pitch: claim_detail.pitch,
      stories: claim_detail.stories,
      inspectionDate: claim_detail.inspectionDate,
      inspectionTime: claim_detail.inspectionTime,
      photoSubmissionType: claim_detail.photoSubmissionType,
      scopeSubmissionType: claim_detail.scopeSubmissionType,
      reportSubmissionType: claim_detail.reportSubmissionType,
      measurementSubmissionType: claim_detail.measurementSubmissionType,
      additionalFileSubmission: claim_detail.additionalFileSubmission,
      additionalInformation: claim_detail.additionalInformation,
      formType: claim_detail.formType,
      map: claim_detail.map,
      claimStatus: claim_detail.claimStatus,
      measureassistNone: claim_detail.measureassistNone,
      measureassistRoof: claim_detail.measureassistRoof,
      measureassistElevation: claim_detail.measureassistElevation,
      isActive: claim_detail.isActive,
      createdBy: claim_detail.createdBy,
      createdDate: claim_detail.createdDate,
    );
  }

  Widget GridContainer(icon_data, title, onTap) {
    double width_height = MediaQuery.of(context).size.width / 2.5;
    return Container(
      margin: EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: width_height - 35,
      width: width_height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon_data, size: 50),
          SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }

  Widget GetAppBar() {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        InkWell(
          onTap: () async {},
          child: Container(
            padding: EdgeInsets.all(5),
            child: Icon(
              Icons.info_outline,
              size: 30,
            ),
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "[Name of PH]",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              getIconText("Assigned", widget.status_color),
            ],
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 15, left: 5),
          decoration: WidgetsReusing.getListBoxDecoration(),
          child: Icon(
            Icons.search,
            size: 30,
          ),
        ),
      ],
    );
  }

  final _decoration = ShapeDecoration(
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
  );

  DateTime? _chosenDateTime;
}
*/
