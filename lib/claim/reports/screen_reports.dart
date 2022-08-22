import 'dart:convert';

import 'package:claim_core/app_theme_work/textformfield_theme.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_get_report.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/dashboard/models/model_all_dropdown.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenReports extends StatefulWidget {
  final ModelAllDropdown modelAllDropdown;
  final ClaimFinalClass? claimFinalClass;
  // final DataClaimDetails? dataClaimDetails;
  const ScreenReports({required this.modelAllDropdown, this.claimFinalClass});

  @override
  _ScreenReportsState createState() => _ScreenReportsState();
}

class _ScreenReportsState extends State<ScreenReports> {
  List<DataAllDropDown> edge_metal = [];
  List<DataAllDropDown> garage_material = [];
  List<DataAllDropDown> cause_loss = [];
  List<DataAllDropDown> roof_type = [];
  List<DataAllDropDown> roof_style = [];
  List<DataAllDropDown> dwelling = [];
  List<DataAllDropDown> dwelling_material = [];
  List<DataAllDropDown> dwelling_type = [];

  List<String> edge_metal_dropdown = [];
  List<String> garage_material_dropdown = [];
  List<String> cause_loss_dropdown = [];
  List<String> dwelling_type_dropdown = [];
  List<String> roof_type_dropdown = [];
  List<String> roof_style_dropdown = [];
  List<String> dwelling_dropdown = [];
  List<String> dwelling_material_dropdown = [];

  void DropDownDataAssigning() {
    widget.modelAllDropdown.data!.forEach((element) {
      if (element.dropDown == "CauseofLoss_List") {
        cause_loss.add(element);
        cause_loss_dropdown.add(element.value!);
      } else if (element.dropDown == "Roof_Type") {
        //Roof_Type  Damage_Type
        roof_type.add(element);
        roof_type_dropdown.add(element.value!);
      } else if (element.dropDown == "Roof_Style") {
        // Roof_Style  Damage_Type
        roof_style.add(element);
        roof_style_dropdown.add(element.value!);
      } else if (element.dropDown == "Edge_Metal") {
        edge_metal.add(element);
        edge_metal_dropdown.add(element.value!);
      } else if (element.dropDown == "Garage_Material") {
        garage_material.add(element);
        garage_material_dropdown.add(element.value!);
      } else if (element.dropDown == "Dwelling") {
        dwelling.add(element);
        dwelling_dropdown.add(element.value!);
      } else if (element.dropDown == "Dwelling_Material") {
        dwelling_material.add(element);
        dwelling_material_dropdown.add(element.value!);
      } else if (element.dropDown == "Dwelling_Type") {
        dwelling_type.add(element);
        dwelling_type_dropdown.add(element.value!);
      }
    });

    setState(() {
      if (edge_metal.length > 0) {
        edge_metal_select = edge_metal[0].value!;
        edge_metal_fullobject = edge_metal[0];
      }
      if (garage_material.length > 0) {
        garage_material_select = garage_material[0].value!;
        garage_material_fullobject = garage_material[0];
      }

      if (cause_loss.length > 0) {
        cause_loss_select = cause_loss[0].value!;
        cause_loss_fullobject = cause_loss[0];
      }
      if (dwelling.length > 0) {
        dwelling_select = dwelling[0].value!;
        dwelling_fullobject = dwelling[0];
      }
      if (dwelling_material.length > 0) {
        dwelling_material_select = dwelling_material[0].value!;
        dwelling_material_fullobject = dwelling_material[0];
      }
      if (dwelling_type.length > 0) {
        dwelling_type_select = dwelling_type[0].value!;
        dwelling_type_fullobject = dwelling_type[0];
      }
      if (roof_type.length > 0) {
        roof_type_select = roof_type[0].value!;
        roof_type_fullobject = roof_type[0];
      }

      if (roof_style.length > 0) {
        roof_style_select = roof_style[0].value!;
        roof_style_fullobject = roof_style[0];
      }
    });
  }

  String edge_metal_select = "";
  String garage_material_select = "";
  String cause_loss_select = "";
  String dwelling_type_select = "";
  String roof_type_select = "";
  String roof_style_select = "";
  String dwelling_select = "";
  String dwelling_material_select = "";

  DataAllDropDown? edge_metal_fullobject;
  DataAllDropDown? garage_material_fullobject;
  DataAllDropDown? cause_loss_fullobject;
  DataAllDropDown? dwelling_type_fullobject;
  DataAllDropDown? roof_type_fullobject;
  DataAllDropDown? roof_style_fullobject;
  DataAllDropDown? dwelling_fullobject;
  DataAllDropDown? dwelling_material_fullobject;

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
      txtEdtCntrlr18;

  final textStyle = TextStyle(
      fontFamily: 'Varela',
      fontSize: 19,
      letterSpacing: .5,
      fontWeight: FontWeight.w600);

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    InitionalizeTextEditingController();

    DropDownDataAssigning();
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
  }

  String inspection_date =
      ConstantFunctions.calendar_formate.format(DateTime.now());
  String date_of_loss =
      ConstantFunctions.calendar_formate.format(DateTime.now());

  String inspection_time =
      ConstantFunctions.calendar_formate.format(DateTime.now());

  String _createdBy = "2022-02-18T09:10:53.508Z";
  String _createdDate = "2022-02-18T09:10:53.508Z";
  bool _home_owner = false;
  bool _mortgagee = false;
  bool _different_claimant = false;
  bool _contractor = false;
  bool _none_present = false;
  bool _attached = false;

  String isFeltPresent = "Yes";
  String IceWaterShieldPresent = "Yes";

  @override
  Widget build(BuildContext context) {
    GestureTapCallback onTapSubmit = () {
      String policy_holder_name = txtEdtCntrlr1!.text.toString();
      String home_owner_name = txtEdtCntrlr2!.text.toString();
      String contractor_name = txtEdtCntrlr3!.text.toString();
      String roof_age = txtEdtCntrlr4!.text.toString();
      String layers = txtEdtCntrlr5!.text.toString();
      String pitch = txtEdtCntrlr6!.text.toString();
      String stories = txtEdtCntrlr7!.text.toString();
      String roof_summery = txtEdtCntrlr8!.text.toString();
      String roof_components = txtEdtCntrlr9!.text.toString();
      String front_elevation_summery = txtEdtCntrlr10!.text.toString();
      String left_elevation_summery = txtEdtCntrlr11!.text.toString();
      String back_elevation_summery = txtEdtCntrlr12!.text.toString();
      String right_elevation_summery = txtEdtCntrlr13!.text.toString();
      String interior_summery = txtEdtCntrlr14!.text.toString();
      String public_notes = txtEdtCntrlr15!.text.toString();
      String private_notes = txtEdtCntrlr16!.text.toString();
      String garage = txtEdtCntrlr17!.text.toString();
      String what_type = txtEdtCntrlr18!.text.toString();

      Map<String, String> value_map = {
        "id": "0",
        "claimId": "24",
        "inspectorID": "string",
        "assignId": "6",
        "claimPersonName": "sdfsdf",
        "roof_Type": jsonEncode(roof_type_fullobject),
        "roofStyle_Type": jsonEncode(roof_style_fullobject),
        "roofAge": roof_age,
        "layer": layers,
        "edgeMetal_Type": jsonEncode(edge_metal_fullobject),
        "pitch_Type": jsonEncode(pitch),
        "homeowner": "${_home_owner}",
        "mortagee": "${_mortgagee}",
        "homeName": "string",
        "differentClaimant": "${_different_claimant}",
        "contractor": "${_contractor}",
        "noneWerePresento": "${_none_present}",
        "isFeltPresentCheck": isFeltPresent,
        "isIceWaterShieldPresent": IceWaterShieldPresent,
        "whattype": what_type,
        "contractorsName": contractor_name,
        "inspection_Date": inspection_date,
        "inspection_Time": inspection_time,
        "mortgageeName": "string",
        "differentClaimantName": "string",
        "dateofLoss": date_of_loss,
        "dwelling": jsonEncode(dwelling_fullobject),
        "dwellingMaterial": jsonEncode(dwelling_material_fullobject),
        "dwellingType": jsonEncode(dwelling_type_fullobject),
        "stories": stories,
        "garage": garage,
        "note": "string",
        "remarks": "string",
        "attached": "${_attached}",
        "garageMaterial": jsonEncode(dwelling_material_fullobject),
        "roofInformation": "string",
        "roofSumary": roof_summery,
        "roofComponents": roof_components,
        "forontElevationSumary": front_elevation_summery,
        "leftElevationSumary": left_elevation_summery,
        "backElevationSumary": back_elevation_summery,
        "rightElevationSumary": right_elevation_summery,
        "interiorSumary": interior_summery,
        "publicNotes": public_notes,
        "privateNotes": private_notes,
        "workProformed": "string",
        "reportStatus": "string",
        "isActive": "true",
        "createdBy": "string",
        "createdDate": _createdDate
      };

      ConstantFunctions.getSharePrefModeString("login_token").then(
        (login_token) {
          RestApiUtils.ShowLoadingDialog(context);
          ServiceClaim.CreateReportFunction(context, login_token, value_map)
              .then((value) {
            if (value.claimReportModel != null) {
              ConstantFunctions.getSnakeBar(context, "Data added successfully");
              Navigator.pop(context);
            } else {
              ConstantFunctions.getSnakeBar(context, "${value.message}");
              Navigator.pop(context);
            }
          });
        },
      );
    };

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // key: _drawerKey,
      // drawer: ScreenDrawer(),
      body: Column(
        children: [
          SizedBox(height: AppBar().preferredSize.height),
          GetAppBar(),
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "",
                    txtEdtCntrlr1,
                    "Policy Holder Name",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                Divider(thickness: 2, endIndent: 5, indent: 1),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(" Who was present at the inspections?",
                        style: Theme.of(context).textTheme.headline6),
                    Row(
                      children: [
                        Checkbox(
                          value: this._home_owner,
                          onChanged: (bool? value) {
                            setState(() {
                              this._home_owner = value!;
                            });
                          },
                        ), //
                        Text(
                          'Home Owner',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                      ], //<Widget>[]
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: this._mortgagee,
                          onChanged: (bool? value) {
                            setState(() {
                              this._mortgagee = value!;
                            });
                          },
                        ), //
                        Text(
                          'Mortgagee',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                      ], //<Widget>[]
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: this._different_claimant,
                          onChanged: (bool? value) {
                            setState(() {
                              this._different_claimant = value!;
                            });
                          },
                        ), //
                        Text(
                          'Different Claimant',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                      ], //<Widget>[]
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: this._contractor,
                          onChanged: (bool? value) {
                            setState(() {
                              this._contractor = value!;
                            });
                          },
                        ), //
                        Text(
                          'Contractor',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                      ], //<Widget>[]
                    ),
                    Row(
                      children: [
                        Checkbox(
                          value: this._none_present,
                          onChanged: (bool? value) {
                            setState(() {
                              this._none_present = value!;
                            });
                          },
                        ), //
                        Text(
                          'None ware present',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.w600),
                        ),
                      ], //<Widget>[]
                    ),
                  ],
                ),

                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Home Owner's Name",
                    txtEdtCntrlr2,
                    "Paul",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Contractor's Name",
                    txtEdtCntrlr3,
                    "Paul",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _showDatePickerDate(context, true);
                          },
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Inspection Date', style: textStyle),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        width: 1.5,
                                        color: Colors.black87,
                                        style: BorderStyle.solid)),
                                child:
                                    Text('$inspection_date', style: textStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _showDatePickerTime(context);
                          },
                          child: Column(
                            children: [
                              Text('Inspection Time', style: textStyle),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    border: Border.all(
                                        width: 1.5,
                                        color: Colors.black87,
                                        style: BorderStyle.solid)),
                                child:
                                    Text('$inspection_time', style: textStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 2, endIndent: 5, indent: 1),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Cause of Loss",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: cause_loss_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    cause_loss_select = value ?? "";
                                    cause_loss.forEach((full_object) {
                                      if (cause_loss_select ==
                                          full_object.value) {
                                        cause_loss_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: cause_loss_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: InkWell(
                        onTap: () {
                          _showDatePickerDate(context, false);
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date of loss', style: textStyle),
                            Container(
                              width: double.infinity,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  border: Border.all(
                                      width: 1.5,
                                      color: Colors.black87,
                                      style: BorderStyle.solid)),
                              child: Text('$date_of_loss', style: textStyle),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Roof Type",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: roof_type_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    roof_type_select = value ?? "";
                                    roof_type.forEach((full_object) {
                                      if (value == full_object.value) {
                                        roof_type_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: roof_type_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldTheme.GetTextFormFieldWithBorder(
                          context,
                          "Roof Age",
                          txtEdtCntrlr4,
                          "25 years",
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Roof Style",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: roof_style_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    roof_style_select = value ?? "";
                                    roof_style.forEach((full_object) {
                                      if (value == full_object.value) {
                                        roof_style_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: roof_style_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldTheme.GetTextFormFieldWithBorder(
                          context,
                          "Layers",
                          txtEdtCntrlr5,
                          "1 Layer",
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Edge Matel",
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _decoration,
                        child: DropdownButton(
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                          underline: Container(), //rem
                          items: edge_metal_dropdown
                              .map((value) => DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              edge_metal_select = value ?? "";
                              edge_metal.forEach((full_object) {
                                if (edge_metal_select == full_object.value) {
                                  edge_metal_fullobject = full_object;
                                }
                              });
                            });
                          },
                          // isExpanded: false,
                          value: edge_metal_select,
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                ),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Pitch",
                    txtEdtCntrlr6,
                    "5/12",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  Is Felt Present?",
                        style: Theme.of(context).textTheme.headline6),
                    Row(
                      children: [
                        Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text("Yes"),
                                    leading: Radio(
                                        value: "Yes",
                                        groupValue: isFeltPresent,
                                        onChanged: (value) {
                                          setState(() {
                                            isFeltPresent = value.toString();
                                          });
                                        }),
                                  ),
                                ),
                                Expanded(
                                  child: ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text("No"),
                                    leading: Radio(
                                        value: "No",
                                        groupValue: isFeltPresent,
                                        onChanged: (value) {
                                          setState(() {
                                            isFeltPresent = value.toString();
                                          });
                                        }),
                                  ),
                                ),
                              ],
                            )),
                        Expanded(
                          flex: 2,
                          child: TextFormFieldTheme.GetTextFormFieldWithBorder(
                              context,
                              "What Type",
                              txtEdtCntrlr18,
                              "30 LB",
                              EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 10)),
                        ),
                      ],
                    ),
                  ],
                ),

                SizedBox(height: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("  Is Ice/Water Shield Present?",
                        style: Theme.of(context).textTheme.headline6),
                    Row(
                      children: [
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text("Yes"),
                            leading: Radio(
                                value: "Yes",
                                groupValue: IceWaterShieldPresent,
                                onChanged: (value) {
                                  setState(() {
                                    IceWaterShieldPresent = value.toString();
                                  });
                                }),
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            contentPadding: EdgeInsets.zero,
                            title: Text("No"),
                            leading: Radio(
                                value: "No",
                                groupValue: IceWaterShieldPresent,
                                onChanged: (value) {
                                  setState(() {
                                    IceWaterShieldPresent = value.toString();
                                  });
                                }),
                          ),
                        ),
                        Expanded(child: SizedBox())
                      ],
                    ),
                  ],
                ),

                Divider(thickness: 2, endIndent: 5, indent: 1),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dwelling",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: dwelling_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dwelling_select = value ?? "";
                                    dwelling.forEach((full_object) {
                                      if (value == full_object.value) {
                                        dwelling_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: dwelling_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dwelling Metail",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: dwelling_material_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dwelling_material_select = value ?? "";
                                    dwelling_material.forEach((full_object) {
                                      if (value == full_object.value) {
                                        dwelling_material_fullobject =
                                            full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: dwelling_material_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Dwelling Type",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: dwelling_type_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    dwelling_type_select = value ?? "";
                                    dwelling_type.forEach((full_object) {
                                      if (value == full_object.value) {
                                        dwelling_type_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: dwelling_type_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldTheme.GetTextFormFieldWithBorder(
                          context,
                          "Stories",
                          txtEdtCntrlr7,
                          "2 Stories",
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    ),
                  ],
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldTheme.GetTextFormFieldWithBorder(
                          context,
                          "Garage",
                          txtEdtCntrlr17,
                          "1 Car Garage",
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Checkbox(
                            value: this._attached,
                            onChanged: (bool? value) {
                              setState(() {
                                this._attached = value!;
                              });
                            },
                          ), //
                          Text(
                            'Attached',
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontSize: 17.0, fontWeight: FontWeight.w600),
                          ),
                        ], //<Widget>[]
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Garage Material",
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _decoration,
                        child: DropdownButton(
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                          underline: Container(), //rem
                          items: garage_material_dropdown
                              .map((value) => DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              garage_material_select = value ?? "";
                              garage_material.forEach((full_object) {
                                if (garage_material_select ==
                                    full_object.value) {
                                  garage_material_fullobject = full_object;
                                }
                              });
                            });
                          },
                          // isExpanded: false,
                          value: garage_material_select,
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(thickness: 2, endIndent: 5, indent: 1),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Roof Information",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.start,
                  ),
                ),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Roof Summery",
                    txtEdtCntrlr8,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Roof Components",
                    txtEdtCntrlr9,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                Divider(thickness: 2, endIndent: 5, indent: 1),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    " Elevation Information",
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.start,
                  ),
                ),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Front Elevation Summery",
                    txtEdtCntrlr10,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),

                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Left Elevation Summery",
                    txtEdtCntrlr11,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Back Elevation Summery",
                    txtEdtCntrlr12,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Right Elevation Summery",
                    txtEdtCntrlr13,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Interior Summery",
                    txtEdtCntrlr14,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),

                Divider(thickness: 2, endIndent: 5, indent: 1),

                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Public Notes",
                    txtEdtCntrlr15,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),

                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Private Notes",
                    txtEdtCntrlr16,
                    "",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                Divider(thickness: 2, endIndent: 5, indent: 1),

                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 5),
                  child: WidgetsReusing.getElevatedButton(
                      context, "Submit", onTapSubmit),
                ),

                //sdfsdfsfsfdsdf
                SizedBox(height: 30)
              ],
            ),
          ))
        ],
      ),
    );
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
      child: Text(title, style: Theme.of(context).textTheme.subtitle2),
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

  DataAllDropDown GetValue(mapObject, String value) {
    DataAllDropDown ssss =
        DataAllDropDown.fromJson(jsonDecode(mapObject)["$value"]);
    return ssss;
  }

  Widget ListItemClick(title, dynamic text) {
    return InkWell(
      onTap: () {
        // Navigator.pop(context);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$title : $text",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black87),
            ),
            Divider()
          ],
        ),
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
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.info_outline),
              Text(
                "Report",
                style: Theme.of(context).textTheme.headline1,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        InkWell(
          onTap: () {
            // Navigator.push(
            //     context,
            //     ConstantFunctions.OpenNewActivity(
            //         ScreenCamera(dataClaimDetails: widget.dataSingleClaim)));
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(right: 15),
            decoration: WidgetsReusing.getListBoxDecoration(),
            child: Icon(
              Icons.camera_alt_rounded,
              size: 30,
            ),
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

  // Show the modal that contains the CupertinoDatePicker
  void _showDatePickerDate(ctx, bool isInspectionDate) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 300,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 230,
                    child: CupertinoDatePicker(
                      initialDateTime: DateTime.now(),
                      // initialDateTime: DateTime(1990),
                      onDateTimeChanged: (DateTime _date) {
                        setState(() {
                          if (isInspectionDate) {
                            txtEdtCntrlr16!.text = _date.toString();
                            txtEdtCntrlr16!.text = ConstantFunctions
                                .calendar_formate
                                .format(_date);
                            inspection_date = ConstantFunctions.calendar_formate
                                .format(_date);
                          } else {
                            date_of_loss = ConstantFunctions.calendar_formate
                                .format(_date);
                          }
                        });
                      },
                      use24hFormat: true,
                      // maximumDate: new DateTime(2022, 12, 30),
                      minimumYear: 2022,
                      // maximumYear: 2022,
                      minuteInterval: 1,
                      mode: CupertinoDatePickerMode.date,
                    ),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }

  // Show the modal that contains the CupertinoDatePicker
  void _showDatePickerTime(ctx) {
    // showCupertinoModalPopup is a built-in function of the cupertino library
    showCupertinoModalPopup(
        context: ctx,
        builder: (_) => Container(
              height: 300,
              color: const Color.fromARGB(255, 255, 255, 255),
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    child: CupertinoDatePicker(
                      // initialDateTime: DateTime.now().subtract(Duration(days: 10021)),
                      initialDateTime: DateTime.now(),
                      onDateTimeChanged: (DateTime _date) {
                        setState(() {
                          inspection_time = ConstantFunctions.formattedTimefinal
                              .format(_date);
                          // inspection_time = _date.toString();
                        });
                      },
                      use24hFormat: false,
                      // maximumDate: new DateTime(2022, 12, 30),
                      minimumYear: 2022,
                      // maximumYear: 2022,
                      // minuteInterval: 1,
                      mode: CupertinoDatePickerMode.time,
                    ),
                  ),

                  // Close the modal
                  CupertinoButton(
                    child: const Text('OK'),
                    onPressed: () => Navigator.of(ctx).pop(),
                  )
                ],
              ),
            ));
  }
}
