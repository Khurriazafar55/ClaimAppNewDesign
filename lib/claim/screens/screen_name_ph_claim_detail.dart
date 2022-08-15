import 'dart:async';

import 'package:claim_core/app_theme_work/textformfield_theme.dart';
import 'package:claim_core/app_theme_work/textformfield_theme1.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/models/model_get_claim_id.dart';
import 'package:claim_core/claim/reports/screen_get_report.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScreenNamePHClaimDetail extends StatefulWidget {
  final DataSingleClaim dataSingleClaim;
  final Color status_color;
  const ScreenNamePHClaimDetail(
      {required this.dataSingleClaim, required this.status_color});

  @override
  _ScreenNamePHClaimDetailState createState() =>
      _ScreenNamePHClaimDetailState();
}

class _ScreenNamePHClaimDetailState extends State<ScreenNamePHClaimDetail> {
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

  String _selection_radio = "roof";

  @override
  void initState() {
    super.initState();

    InitionalizeTextEditingController();
    setState(() {
      DataSingleClaim claim_detail = widget.dataSingleClaim;

      print("HelloArmy ${widget.dataSingleClaim.claimStatus}");
      print("HelloArmy ${claim_detail.measureassistElevation!}");
      print("HelloArmy ${claim_detail.measureassistRoof!}");
      print("HelloArmy ${claim_detail.measureassistNone!}");

      if (claim_detail.measureassistElevation!) {
        _selection_radio = "elevation";
      } else if (claim_detail.measureassistRoof!) {
        _selection_radio = "roof";
      } else {
        _selection_radio = "none";
      }

      txtEdtCntrlr1!.text = "${claim_detail.policyHolderName}";
      txtEdtCntrlr2!.text = "${claim_detail.mainContactPhoneNumber}";
      txtEdtCntrlr3!.text = "${claim_detail.policyHolderEmail}";
      txtEdtCntrlr4!.text = "${claim_detail.policyHolderPhoneNumber}";
      txtEdtCntrlr5!.text = "${claim_detail.adjusterName}";
      txtEdtCntrlr6!.text = "${claim_detail.adjusterEmail}";
      txtEdtCntrlr7!.text = "${claim_detail.adjusterPhoneNumber}";
      txtEdtCntrlr8!.text = "${claim_detail.address}";
      txtEdtCntrlr9!.text = "${claim_detail.city}";
      txtEdtCntrlr10!.text = "${claim_detail.zipCode}";
      txtEdtCntrlr11!.text = "${claim_detail.claimId}";
      txtEdtCntrlr12!.text = "${claim_detail.isDamageTypeValue}";
      txtEdtCntrlr13!.text = "${claim_detail.stories}";
      txtEdtCntrlr14!.text = "${claim_detail.additionalFileSubmission}";
      txtEdtCntrlr15!.text = "${claim_detail.additionalInformation}";
      txtEdtCntrlr16!.text = "${claim_detail.inspectionDate}";
      txtEdtCntrlr17!.text = "${claim_detail.inspectionTime}";
      txtEdtCntrlr18!.text = "${claim_detail.state!.value}";
      txtEdtCntrlr19!.text = "${claim_detail.catastropheEvent!.value}";
      txtEdtCntrlr20!.text = "${claim_detail.reInspection!.value}";
      txtEdtCntrlr21!.text = "${claim_detail.independentAdjuster!.value}";
      if (claim_detail.serviceType != null) {
        txtEdtCntrlr22!.text = "${claim_detail.serviceType!.serviceName}";
      }
      txtEdtCntrlr23!.text = "${claim_detail.isDamageType}";
      txtEdtCntrlr24!.text = "${claim_detail.pitch!.value}";
      txtEdtCntrlr25!.text = "${claim_detail.photoSubmissionType!.value}";
      txtEdtCntrlr26!.text = "${claim_detail.scopeSubmissionType!.value}";
      txtEdtCntrlr27!.text = "${claim_detail.measurementSubmissionType!.value}";
    });

    // print("objectobject ${snapshot.data!.data!.length}");
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

    return Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        // key: _drawerKey,
        // drawer: ScreenDrawer(),
        appBar: AppBar(
          elevation: 0,
          centerTitle: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          leading: InkWell(
            onTap: () => Navigator.of(context).pop(),
            child: Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(left: 15),
              child: Icon(
                Icons.arrow_back,
                color: Colors.black87,
                size: 30,
              ),
            ),
          ),
          title: InkWell(
            onTap: () async {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.info_outline,
                      size: 30,
                      color: Colors.black87,
                    ),
                    Text(
                      " [1-Name of PH]",
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 20),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                getIconText(
                    "Assigned",
                    WidgetsReusing.getColor(
                        widget.dataSingleClaim.claimStatus)),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                Icons.arrow_back,
                color: Colors.transparent,
                size: 30,
              ),
            ),
          ],
        ),
        body: Column(
          children: [
            // SizedBox(height: AppBar().preferredSize.height),
            Expanded(
              child: ListView(
                children: [
                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "",
                    txtEdtCntrlr1,
                    "Policy Holder Name",
                    paddding,
                    enabled: false,
                  ),
                  Divider(thickness: 2, endIndent: 5, indent: 1),
                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "Main Contact Phone Number",
                    txtEdtCntrlr2,
                    "Main Contact Phone Number",
                    paddding,
                    enabled: false,
                  ),
                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "Policy Holder Email",
                    txtEdtCntrlr3,
                    "Policy Holder Email",
                    paddding,
                    enabled: false,
                  ),
                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "Policy Holder Phone Number",
                    txtEdtCntrlr4,
                    "Policy Holder Phone Number",
                    paddding,
                    enabled: false,
                  ),
                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "Adjuster Name",
                    txtEdtCntrlr5,
                    "Adjuster Name",
                    paddding,
                    enabled: false,
                  ),
                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "Adjuster Email",
                    txtEdtCntrlr6,
                    "Adjuster Email",
                    paddding,
                    enabled: false,
                  ),
                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
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
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 5),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "Address",
                          txtEdtCntrlr8,
                          "Address",
                          paddding,
                          enabled: false,
                        ),
                      ),
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
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
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "State",
                          txtEdtCntrlr18,
                          "State",
                          paddding,
                          enabled: false,
                        ),
                      ),
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                            context, "Zip", txtEdtCntrlr10, "Zip", paddding,
                            enabled: false),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "Catastrope Event",
                          txtEdtCntrlr19,
                          "Catastrope Event",
                          paddding,
                          enabled: false,
                        ),
                      ),
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
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
                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "Are you an independent Adjuster ? ",
                    txtEdtCntrlr21,
                    "Are you an independent Adjuster ? ",
                    paddding,
                    enabled: false,
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "Claim Number",
                          txtEdtCntrlr11,
                          "Claim Number",
                          paddding,
                          enabled: false,
                        ),
                      ),
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
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
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "Inspection Date",
                          txtEdtCntrlr16,
                          "Inspection Date",
                          paddding,
                          enabled: false,
                        ),
                      ),
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
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
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                            context,
                            "Damage Type",
                            txtEdtCntrlr23,
                            "Damage Type",
                            paddding,
                            enabled: false),
                      ),
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
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
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                            context, "Pitch", txtEdtCntrlr24, "Pitch", paddding,
                            enabled: false),
                      ),
                      Expanded(
                          child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
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
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                            context,
                            "Photo Submission Type",
                            txtEdtCntrlr25,
                            "Stories",
                            paddding,
                            enabled: false),
                      ),
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
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
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                            context,
                            "Report Submission Type",
                            txtEdtCntrlr26,
                            "Report Submission Type",
                            paddding,
                            enabled: false),
                      ),
                      Expanded(
                        child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                            context,
                            "Measurement Submission Type",
                            txtEdtCntrlr27,
                            "Measurement Submission Type",
                            paddding,
                            enabled: false),
                      ),
                    ],
                  ),

                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "Aditional File Submission",
                    txtEdtCntrlr14,
                    "Aditional File Submission",
                    paddding,
                    enabled: false,
                  ),

                  TextFormFieldTheme1.GetTextFormFieldWithBorder(
                    context,
                    "Aditional Information",
                    txtEdtCntrlr15,
                    "Aditional Information",
                    paddding,
                    enabled: false,
                  ),

                  Divider(thickness: 2, endIndent: 5, indent: 1),

                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    width: double.infinity,
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Measurement Assist",
                            style: Theme.of(context).textTheme.headline6),
                        SizedBox(height: 5),
                        Text(
                            "If you want to request a measurements for your inspection, do so here",
                            style: Theme.of(context).textTheme.bodyText2),
                      ],
                    ),
                  ),

                  Column(
                    children: [
                      ListTile(
                        title: Text("None"),
                        leading: Radio(
                            value: "none",
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
                            value: "roof",
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
                            value: "elevation",
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                    child: WidgetsReusing.getElevatedButton(
                        context, "Go to Report", () {
                      ConstantFunctions.getSharePrefModeString("login_token")
                          .then(
                        (login_token) {
                          RestApiUtils.ShowLoadingDialog(context);

                          ServiceClaim.GetAllDropDown(context, login_token)
                              .then((modelAllDropdown) {
                            if (modelAllDropdown.data! != null &&
                                modelAllDropdown.data!.length > 0) {
                              //TODO

                              ServiceClaim.GetReportFunction(
                                      context,
                                      login_token,
                                      widget.dataSingleClaim.id.toString())
                                  .then((modelGetReport) {
                                Navigator.pop(context);

                                print(
                                    "HelloSifat data ${modelGetReport.data!}");
                                print(
                                    "HelloSifat id ${modelGetReport.data!.claimReportModel!.id}");

                                if (modelGetReport.data! != null) {
                                  Navigator.push(
                                      context,
                                      ConstantFunctions.OpenNewActivity(
                                          ScreenGetReport(
                                        modelGetReport: modelGetReport,
                                        modelAllDropdown: modelAllDropdown,
                                      )));
                                } /*else {
                                  Navigator.push(
                                      context,
                                      ConstantFunctions.OpenNewActivity(
                                          ScreenReports(
                                        claimFinalClass:
                                            modelGetReport.data!.claim,
                                        modelAllDropdown: modelAllDropdown,
                                      )));
                                }*/
                              });
                            }
                          });
                        },
                      );
                    }),
                  ),

                  //sdfsdfsfsfdsdf
                  SizedBox(height: 30)
                ],
              ),
            ),
          ],
        ));
  }

  Widget getIconText(title, Color color) {
    return Text(
      "Assigned",
      textAlign: TextAlign.left,
      style: Theme.of(context).textTheme.subtitle2!.copyWith(
          color: Colors.black87,
          decoration: TextDecoration.underline,
          decorationStyle: TextDecorationStyle.solid,
          decorationColor: color,
          fontSize: 19,
          fontWeight: FontWeight.w600),
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
                "[1-Name of PH]",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
              getIconText("Assigned",
                  WidgetsReusing.getColor(widget.dataSingleClaim.claimStatus)),
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
}
