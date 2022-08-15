import 'dart:async';
import 'dart:convert';

import 'package:claim_core/app_theme_work/textformfield_theme.dart';
import 'package:claim_core/app_theme_work/textformfield_theme1.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/claim/models/model_service.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/dashboard/models/model_all_dropdown.dart';
import 'package:claim_core/utilities/rest_api_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utilities/constant_functions.dart';

class ScreenNewClaims extends StatefulWidget {
  final ModelAllDropdown modelAllDropdown;
  final ModelService modelservices;
  const ScreenNewClaims(
      {required this.modelAllDropdown, required this.modelservices});

  @override
  _ScreenNewClaimsState createState() => _ScreenNewClaimsState();
}

class _ScreenNewClaimsState extends State<ScreenNewClaims> {
  List<DataAllDropDown> carrier_name = [];
  List<DataAllDropDown> state = [];
  List<DataAllDropDown> catastrophe_event = [];
  List<DataAllDropDown> independent_adjuster = [];

  List<DataAllDropDown> damage_type = [];
  List<DataAllDropDown> pitch = [];
  List<DataAllDropDown> re_inspection = [];
  List<DataAllDropDown> scope_submission_type = [];
  List<DataAllDropDown> photo_submission_type = [];
  List<DataAllDropDown> report_submission_type = [];
  List<DataAllDropDown> measurment_submission_type = [];

  List<String> carrier_name_dropdown = [];
  List<String> state_dropdown = [];
  List<String> catastrophe_event_dropdown = [];
  List<String> independent_adjuster_dropdown = [];
  List<String> service_type_dropdown = [];
  List<String> damage_type_dropdown = [];
  List<String> pitch_dropdown = [];
  List<String> re_inspection_dropdown = [];
  List<String> scope_submission_type_dropdown = [];
  List<String> photo_submission_type_dropdown = [];
  List<String> report_submission_type_dropdown = [];
  List<String> measurment_submission_type_dropdown = [];

  List<DataServiceType> service_type = [];

  void DropDownDataAssigning() {
    widget.modelservices.data!.forEach((element) {
      service_type.add(element);
      service_type_dropdown.add(element.serviceName!);
    });

    widget.modelAllDropdown.data!.forEach((element) {
      if (element.dropDown == "Carrier_Name") {
        carrier_name.add(element);
        carrier_name_dropdown.add(element.value!);
      } else if (element.dropDown == "State") {
        state.add(element);
        state_dropdown.add(element.value!);
      } else if (element.dropDown == "Catastrophe_Event") {
        catastrophe_event.add(element);
        catastrophe_event_dropdown.add(element.value!);
      } else if (element.dropDown == "Independent_Adjuster") {
        independent_adjuster.add(element);
        independent_adjuster_dropdown.add(element.value!);
      } else if (element.dropDown == "Damage_Type") {
        damage_type.add(element);
        damage_type_dropdown.add(element.value!);
      } else if (element.dropDown == "Pitch") {
        pitch.add(element);
        pitch_dropdown.add(element.value!);
      } else if (element.dropDown == "Re_Inspection") {
        re_inspection.add(element);
        re_inspection_dropdown.add(element.value!);
      } else if (element.dropDown == "Scope_Submission_Type") {
        scope_submission_type.add(element);
        scope_submission_type_dropdown.add(element.value!);
      } else if (element.dropDown == "Photo_Submission_Type") {
        photo_submission_type.add(element);
        photo_submission_type_dropdown.add(element.value!);
      } else if (element.dropDown == "Report_Submission_Type") {
        report_submission_type.add(element);
        report_submission_type_dropdown.add(element.value!);
      } else if (element.dropDown == "Measurement_Submission_Type") {
        measurment_submission_type.add(element);
        measurment_submission_type_dropdown.add(element.value!);
      }
    });

    setState(() {
      if (carrier_name.length > 0) {
        carrier_name_select = carrier_name[0].value!;
        carrier_name_fullobject = carrier_name[0];
      }
      if (state.length > 0) {
        state_select = state[0].value!;
        state_fullobject = state[0];
      }
      if (catastrophe_event.length > 0) {
        catastrophe_event_select = catastrophe_event[0].value!;
        catastrophe_event_fullobject = catastrophe_event[0];
      }
      if (independent_adjuster.length > 0) {
        independent_adjuster_select = independent_adjuster[0].value!;
        independent_adjuster_fullobject = independent_adjuster[0];
      }
      if (service_type.length > 0) {
        service_type_select = service_type[0].serviceName!;
        service_type_fullobject = service_type[0];
      }

      if (damage_type.length > 0) {
        damage_type_select = damage_type[0].value!;
        damage_type_fullobject = damage_type[0];
      }
      if (pitch.length > 0) {
        pitch_select = pitch[0].value!;
        pitch_fullobject = pitch[0];
      }
      if (re_inspection.length > 0) {
        re_inspection_select = re_inspection[0].value!;
        re_inspection_fullobject = re_inspection[0];
      }
      if (scope_submission_type.length > 0) {
        scope_submission_type_select = scope_submission_type[0].value!;
        scope_submission_type_fullobject = scope_submission_type[0];
      }
      if (photo_submission_type.length > 0) {
        photo_submission_type_select = photo_submission_type[0].value!;
        photo_submission_type_fullobject = photo_submission_type[0];
      }
      if (report_submission_type.length > 0) {
        report_submission_type_select = report_submission_type[0].value!;
        report_submission_type_fullobject = report_submission_type[0];
      }
      if (measurment_submission_type.length > 0) {
        measurment_submission_type_select =
            measurment_submission_type[0].value!;
        measurment_submission_type_fullobject = measurment_submission_type[0];
      }
    });
  }

  String carrier_name_select = "";
  String state_select = "";
  String catastrophe_event_select = "";
  String independent_adjuster_select = "";
  String service_type_select = "";
  String damage_type_select = "";
  String pitch_select = "";
  String re_inspection_select = "";
  String scope_submission_type_select = "";
  String photo_submission_type_select = "";
  String report_submission_type_select = "";
  String measurment_submission_type_select = "";

  DataAllDropDown? carrier_name_fullobject;
  DataAllDropDown? state_fullobject;
  DataAllDropDown? catastrophe_event_fullobject;
  DataAllDropDown? independent_adjuster_fullobject;
  DataServiceType? service_type_fullobject;
  DataAllDropDown? damage_type_fullobject;
  DataAllDropDown? pitch_fullobject;
  DataAllDropDown? re_inspection_fullobject;
  DataAllDropDown? scope_submission_type_fullobject;
  DataAllDropDown? photo_submission_type_fullobject;
  DataAllDropDown? report_submission_type_fullobject;
  DataAllDropDown? measurment_submission_type_fullobject;

  String radio_button = "none";
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
      txtEdtCntrlr17;

  final textStyle = TextStyle(
      fontFamily: 'Varela',
      fontSize: 19,
      letterSpacing: .5,
      fontWeight: FontWeight.w600);

  @override
  void initState() {
    super.initState();

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

    txtEdtCntrlr16!.text =
        ConstantFunctions.formattedDatefinal.format(DateTime.now());

    txtEdtCntrlr17!.text =
        ConstantFunctions.formattedTimefinal.format(DateTime.now());
  }

  String inspection_date =
      ConstantFunctions.calendar_formate.format(DateTime.now());

  String inspection_time =
      ConstantFunctions.calendar_formate.format(DateTime.now());

  String _createdBy = "String";
  String _createdDate = DateTime.now().toString();

  @override
  Widget build(BuildContext context) {
    GestureTapCallback onTapSubmit = () {
      String main_contact_phone = txtEdtCntrlr2!.text.toString();
      String policy_holder_name = txtEdtCntrlr1!.text.toString();
      String policy_holder_mail = txtEdtCntrlr3!.text.toString();
      String policy_holder_phone = txtEdtCntrlr4!.text.toString();
      String adjuster_name = txtEdtCntrlr5!.text.toString();
      String adjuster_email = txtEdtCntrlr6!.text.toString();
      String adjuster_phone = txtEdtCntrlr7!.text.toString();
      String address = txtEdtCntrlr8!.text.toString();
      String city = txtEdtCntrlr9!.text.toString();
      String zip = txtEdtCntrlr10!.text.toString();
      String _claim_id = txtEdtCntrlr11!.text.toString();

      print("HelloBro : ${service_type_fullobject!.modifiedDate}");

      //===================================================
      Map<String, dynamic> parent_map = {
        "userClaim": {
          "id": 0,
          "main_Contact_Phone_Number": main_contact_phone,
          "claim_ID": _claim_id,
          "service_Type": {
            "id": service_type_fullobject!.id,
            "service_name": service_type_fullobject!.serviceName,
            "price": service_type_fullobject!.price,
            "team": {
              "id": service_type_fullobject!.team!.id,
              "teamName": service_type_fullobject!.team!.teamName,
              "teamDescription": service_type_fullobject!.team!.teamDescription,
              "isActive": service_type_fullobject!.team!.isActive,
              "createdBy": service_type_fullobject!.team!.createdBy,
              "createdDate": "2022-02-18T09:10:53.508Z"
            },
            "createdBy": service_type_fullobject!.createdBy,
            "appUsersCreated": service_type_fullobject!.appUsersCreated,
            "createdDate": "2022-02-18T09:10:53.508Z",
            "modifiedBy": service_type_fullobject!.modifiedBy,
            "appUsersModified": service_type_fullobject!.appUsersCreated,
            "modifiedDate": "2022-02-18T09:10:53.508Z",
            "isActive": service_type_fullobject!.isActive,
          },
          "policy_Holder_Name": policy_holder_name,
          "adjuster_Name": adjuster_name,
          "policy_Holder_Email": policy_holder_mail,
          "adjuster_Email": adjuster_email,
          "policy_Holder_Phone_Number": policy_holder_phone,
          "adjuster_Phone_Number": adjuster_phone,
          "carrier_Name": {
            "id": carrier_name_fullobject!.id,
            "key": carrier_name_fullobject!.key,
            "value": carrier_name_fullobject!.value,
            "dropDown": carrier_name_fullobject!.dropDown,
            "isActive": carrier_name_fullobject!.isActive,
            "createdBy": carrier_name_fullobject!.createdBy,
            "createdDate": "2022-02-18T09:10:53.508Z"
          },
          "isCarrierOther": 0,
          "isCarrierOtherValue": "null",
          "isDamageType": false,
          "isDamageTypeValue": "null",
          "isDamageLocation": false,
          "isDamageLocationValue": "null",
          "catastrophe_Event": {
            "id": catastrophe_event_fullobject!.id,
            "key": catastrophe_event_fullobject!.key,
            "value": catastrophe_event_fullobject!.value,
            "dropDown": catastrophe_event_fullobject!.dropDown,
            "isActive": catastrophe_event_fullobject!.isActive,
            "createdBy": catastrophe_event_fullobject!.createdBy,
            "createdDate": "2022-02-18T09:10:53.508Z"
          },
          "re_Inspection": {
            "id": re_inspection_fullobject!.id,
            "key": re_inspection_fullobject!.key,
            "value": re_inspection_fullobject!.value,
            "dropDown": re_inspection_fullobject!.dropDown,
            "isActive": re_inspection_fullobject!.isActive,
            "createdBy": re_inspection_fullobject!.createdBy,
            "createdDate": "2022-02-18T09:10:53.508Z"
          },
          "address": "abc",
          "city": "sdfsdf",
          "independent_Adjuster": {
            "id": independent_adjuster_fullobject!.id,
            "key": independent_adjuster_fullobject!.key,
            "value": independent_adjuster_fullobject!.value,
            "dropDown": independent_adjuster_fullobject!.dropDown,
            "isActive": independent_adjuster_fullobject!.isActive,
            "createdBy": independent_adjuster_fullobject!.createdBy,
            "createdDate": "2022-02-18T09:10:53.508Z"
          },
          "state": {
            "id": 1164,
            "key": "string",
            "value": "string",
            "dropDown": "string",
            "isActive": true,
            "createdBy": "string",
            "createdDate": "2022-02-18T09:10:53.508Z"
          },
          "zip_Code": "23454",
          "device": "mob",
          "note": "dfd",
          "remarks": "dfd",
          "pitch": {
            "id": 1219,
            "key": "string",
            "value": "string",
            "dropDown": "string",
            "isActive": true,
            "createdBy": "string",
            "createdDate": "2022-02-18T09:10:53.508Z"
          },
          "stories": 2,
          "inspection_Date": "2022-02-18",
          "inspection_Time": "2022-02-18T07:40:15.936Z",
          "photo_Submission_Type": {
            "id": 1231,
            "key": "string",
            "value": "string",
            "dropDown": "string",
            "isActive": true,
            "createdBy": "string",
            "createdDate": "2022-02-18T09:10:53.509Z"
          },
          "scope_Submission_Type": {
            "id": 1235,
            "key": "string",
            "value": "string",
            "dropDown": "string",
            "isActive": true,
            "createdBy": "string",
            "createdDate": "2022-02-18T09:10:53.509Z"
          },
          "report_Submission_Type": {
            "id": 1239,
            "key": "string",
            "value": "string",
            "dropDown": "string",
            "isActive": true,
            "createdBy": "string",
            "createdDate": "2022-02-18T09:10:53.509Z"
          },
          "measurement_Submission_Type": {
            "id": 1241,
            "key": "string",
            "value": "string",
            "dropDown": "string",
            "isActive": true,
            "createdBy": "string",
            "createdDate": "2022-02-18T09:10:53.509Z"
          },
          "additional_File_Submission": "fsdfg",
          "additional_Information": "dfgdfg",
          "form_Type": "Client",
          "map": "dfg",
          "claim_Status": "UnAssigned",
          "measureassistNone": true,
          "measureassistRoof": true,
          "measureassistElevation": true,
          "isActive": true,
          "createdBy": "7966808f-9c59-4273-96f6-15d4584f0b13",
          "createdDate": "2022-02-18T09:10:53.509Z"
        },
        "dmgLocation": [],
        "dmgtype": [],
        "photSubMisType": [],
        "scopeSubMisType": [],
        "reportSubMisType": [],
        "measurementSubMisType": [],
        "service_Type_List": [],
        "scope_Submission_Type_List": [],
        "report_Submission_Type_List": [],
        "re_Inspection_List": [],
        "photo_Submission_Type_List": [],
        "measurement_Submission_Type_List": [],
        "independent_Adjuster_List": [],
        "damage_Type_List": [],
        "catastrophe_Event_List": [],
        "carrier_Name_List": [],
        "pitch_List": [],
        "damage_Location": [],
        "user_Claim_Image_List": [],
        "state_List": []
      };

      //===================================================

      // print("re_inspection_fullobject : ${value_map}");

      // print("object")

      ConstantFunctions.getSharePrefModeString("login_token").then(
        (login_token) {
          RestApiUtils.ShowLoadingDialog(context);
          ServiceClaim.CreateClaimFunction(context, login_token, parent_map)
              .then((value) {
            Navigator.pop(context);
            if (value.status == 200) {
              ConstantFunctions.getSnakeBar(context, value.message);
              Navigator.pop(context);
            } else {
              ConstantFunctions.getSnakeBar(context, "${value.message}");
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
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Main Contact Phone Number",
                    txtEdtCntrlr2,
                    "Main Contact Phone Number",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    keyboardType: TextInputType.phone),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Policy Holder Email",
                    txtEdtCntrlr3,
                    "Policy Holder Email",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    keyboardType: TextInputType.emailAddress),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Policy Holder Phone Number",
                    txtEdtCntrlr4,
                    "Policy Holder Phone Number",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    keyboardType: TextInputType.phone),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Adjuster Name",
                    txtEdtCntrlr5,
                    "Adjuster Name",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Adjuster Email",
                    txtEdtCntrlr6,
                    "Adjuster Email",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    keyboardType: TextInputType.emailAddress),
                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Adjuster Phone Number",
                    txtEdtCntrlr7,
                    "Adjuster Phone Number",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    keyboardType: TextInputType.phone),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Carrier Name",
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _decoration,
                        child: DropdownButton(
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                          underline: Container(), //rem
                          items: carrier_name_dropdown
                              .map((value) => DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              carrier_name_select = value ?? "";
                              carrier_name.forEach((full_object) {
                                if (carrier_name_select == full_object.value) {
                                  carrier_name_fullobject = full_object;
                                }
                              });
                            });
                          },
                          // isExpanded: false,
                          value: carrier_name_select,
                          isExpanded: true,
                        ),
                      ),
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
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    ),
                    Expanded(
                      child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "City",
                          txtEdtCntrlr9,
                          "City",
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
                            Text("State",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: state_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    state_select = value ?? "";
                                    state.forEach((full_object) {
                                      if (state_select == full_object.value) {
                                        state_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: state_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "Zip",
                          txtEdtCntrlr10,
                          "Zip",
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          keyboardType: TextInputType.number),
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
                            Text("Catastrope Event",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: catastrophe_event_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    catastrophe_event_select = value ?? "";
                                    catastrophe_event.forEach((full_object) {
                                      if (value == full_object.value) {
                                        catastrophe_event_fullobject =
                                            full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: catastrophe_event_select,
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
                            Text("Re-Inspection?",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: re_inspection_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    re_inspection_select = value ?? "";
                                    re_inspection.forEach((full_object) {
                                      if (value == full_object.value) {
                                        re_inspection_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: re_inspection_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                //are you adjuster
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Are you an independent Adjuster ? ",
                          style: Theme.of(context).textTheme.headline6),
                      SizedBox(height: 5),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: _decoration,
                        child: DropdownButton(
                          icon: Icon(Icons.keyboard_arrow_down),
                          iconSize: 30,
                          underline: Container(), //rem
                          items: independent_adjuster_dropdown
                              .map((value) => DropdownMenuItem(
                                    child: Text(value),
                                    value: value,
                                  ))
                              .toList(),
                          onChanged: (String? value) {
                            setState(() {
                              independent_adjuster_select = value ?? "";
                              independent_adjuster.forEach((full_object) {
                                if (value == full_object.value) {
                                  independent_adjuster_fullobject = full_object;
                                }
                              });
                            });
                          },
                          // isExpanded: false,
                          value: independent_adjuster_select,
                          isExpanded: true,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "Claim Number",
                          txtEdtCntrlr11,
                          "Claim Number",
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10)),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Service Type",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: service_type_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    service_type_select = value ?? "";
                                    service_type.forEach((full_object) {
                                      if (value == full_object.serviceName) {
                                        service_type_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: service_type_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: InkWell(
                          onTap: () {
                            _showDatePickerDate(context);
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
                              // TextFormFieldTheme.GetTextFormFieldWithBorder(
                              //     context,
                              //     "Inspection Date",
                              //     txtEdtCntrlr16,
                              //     "Inspection Date",
                              //     EdgeInsets.symmetric(
                              //         horizontal: 10, vertical: 10),
                              //     enabled: false),
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
                              // TextFormFieldTheme.GetTextFormFieldWithBorder(
                              //     context,
                              //     "Inspection Time",
                              //     txtEdtCntrlr17,
                              //     "Inspection Time",
                              //     EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              //     enabled: false),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                            Text("Damage Type",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: damage_type_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    damage_type_select = value ?? "";
                                    damage_type.forEach((full_object) {
                                      if (value == full_object.value) {
                                        damage_type_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: damage_type_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "Damage Location",
                          txtEdtCntrlr12,
                          "Damage Location",
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
                            Text("Pitch",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: pitch_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    pitch_select = value ?? "";
                                    pitch.forEach((full_object) {
                                      if (value == full_object.value) {
                                        pitch_fullobject = full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: pitch_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldTheme1.GetTextFormFieldWithBorder(
                          context,
                          "Stories",
                          txtEdtCntrlr13,
                          "Stories",
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                          keyboardType: TextInputType.number),
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
                            Text("Photo Submission Type",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: photo_submission_type_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    photo_submission_type_select = value ?? "";
                                    photo_submission_type
                                        .forEach((full_object) {
                                      if (value == full_object.value) {
                                        photo_submission_type_fullobject =
                                            full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: photo_submission_type_select,
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
                            Text("Scope Submission Type",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: scope_submission_type_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    scope_submission_type_select = value ?? "";
                                    scope_submission_type
                                        .forEach((full_object) {
                                      if (value == full_object.value) {
                                        scope_submission_type_fullobject =
                                            full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: scope_submission_type_select,
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
                            Text("Report Submission Type",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: report_submission_type_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    report_submission_type_select = value ?? "";
                                    report_submission_type
                                        .forEach((full_object) {
                                      if (value == full_object.value) {
                                        report_submission_type_fullobject =
                                            full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: report_submission_type_select,
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
                            Text("Measurement Submission Type",
                                style: Theme.of(context).textTheme.headline6),
                            SizedBox(height: 5),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0),
                              decoration: _decoration,
                              child: DropdownButton(
                                icon: Icon(Icons.keyboard_arrow_down),
                                iconSize: 30,
                                underline: Container(), //rem
                                items: measurment_submission_type_dropdown
                                    .map((value) => DropdownMenuItem(
                                          child: Text(value),
                                          value: value,
                                        ))
                                    .toList(),
                                onChanged: (String? value) {
                                  setState(() {
                                    measurment_submission_type_select =
                                        value ?? "";
                                    measurment_submission_type
                                        .forEach((full_object) {
                                      if (value == full_object.value) {
                                        measurment_submission_type_fullobject =
                                            full_object;
                                      }
                                    });
                                  });
                                },
                                // isExpanded: false,
                                value: measurment_submission_type_select,
                                isExpanded: true,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Aditional File Submission",
                    txtEdtCntrlr14,
                    "Aditional File Submission",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),

                TextFormFieldTheme.GetTextFormFieldWithBorder(
                    context,
                    "Aditional Information",
                    txtEdtCntrlr15,
                    "Aditional Information",
                    EdgeInsets.symmetric(horizontal: 10, vertical: 10)),

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

                Column(children: [
                  ListTile(
                    title: Text("None"),
                    leading: Radio(
                        value: "none",
                        groupValue: radio_button,
                        onChanged: (value) {
                          setState(() {
                            radio_button = value.toString();
                          });
                        }),
                  ),
                  ListTile(
                    title: Text("Roof"),
                    leading: Radio(
                        value: "roof",
                        groupValue: radio_button,
                        onChanged: (value) {
                          setState(() {
                            radio_button = value.toString();
                          });
                        }),
                  ),
                  ListTile(
                    title: Text("Elevation"),
                    leading: Radio(
                        value: "elevation",
                        groupValue: radio_button,
                        onChanged: (value) {
                          setState(() {
                            radio_button = value.toString();
                          });
                        }),
                  )
                ]),

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

  Future<void> _showDialog() async {
    ConstantFunctions.getSharePrefModeString("last_claim_data").then((value) {
      String id = jsonDecode(value)["id"].toString();
      String policy_Holder_Name = jsonDecode(value)["policy_Holder_Name"];
      String main_Contact_Phone_Number =
          jsonDecode(value)["main_Contact_Phone_Number"];
      String policy_Holder_Email = jsonDecode(value)["policy_Holder_Email"];
      String policy_Holder_Phone_Number =
          jsonDecode(value)["policy_Holder_Phone_Number"];
      String adjuster_Name = jsonDecode(value)["adjuster_Name"];
      String adjuster_Email = jsonDecode(value)["adjuster_Email"];
      String adjuster_Phone_Number = jsonDecode(value)["adjuster_Phone_Number"];
      String address = jsonDecode(value)["address"];
      String city = jsonDecode(value)["city"];
      String zip_Code = jsonDecode(value)["zip_Code"];
      String claim_ID = jsonDecode(value)["claim_ID"];
      String isDamageLocationValue = jsonDecode(value)["isDamageLocationValue"];
      String stories = jsonDecode(value)["stories"];
      String additional_File_Submission =
          jsonDecode(value)["additional_File_Submission"];
      String additional_Information =
          jsonDecode(value)["additional_Information"];
      String inspection_Date = jsonDecode(value)["inspection_Date"];
      String inspection_Time = jsonDecode(value)["inspection_Time"];
      String isCarrierOther = jsonDecode(value)["isCarrierOther"];
      String isCarrierOtherValue = jsonDecode(value)["isCarrierOtherValue"];
      String isDamageType = jsonDecode(value)["isDamageType"];
      String isDamageTypeValue = jsonDecode(value)["isDamageTypeValue"];
      String isDamageLocation = jsonDecode(value)["isDamageLocation"];
      String isActive = jsonDecode(value)["isActive"];
      String createdBy = jsonDecode(value)["createdBy"];
      String createdDate = jsonDecode(value)["createdDate"];
      String device = jsonDecode(value)["device"];
      String note = jsonDecode(value)["note"];
      String remarks = jsonDecode(value)["remarks"];
      String form_Type = jsonDecode(value)["form_Type"];
      String map = jsonDecode(value)["map"];
      String claim_Status = jsonDecode(value)["claim_Status"];

      return showDialog<void>(
        context: context,
        barrierDismissible: true, // user must tap button!
        builder: (BuildContext context) {
          print("objectre_inspection ${jsonDecode(value)}");

          return AlertDialog(
            actions: [
              TextButton(
                  onPressed: () {
                    // _id = int.parse(id);
                    txtEdtCntrlr1!.text = policy_Holder_Name;
                    txtEdtCntrlr2!.text = main_Contact_Phone_Number;
                    txtEdtCntrlr3!.text = policy_Holder_Email;
                    txtEdtCntrlr4!.text = policy_Holder_Phone_Number;
                    txtEdtCntrlr5!.text = adjuster_Name;
                    txtEdtCntrlr6!.text = adjuster_Email;
                    txtEdtCntrlr7!.text = adjuster_Phone_Number;
                    txtEdtCntrlr8!.text = address;
                    txtEdtCntrlr9!.text = city;
                    txtEdtCntrlr10!.text = zip_Code;
                    txtEdtCntrlr11!.text = claim_ID;
                    txtEdtCntrlr12!.text = isDamageLocationValue;
                    txtEdtCntrlr13!.text = stories;
                    txtEdtCntrlr14!.text = additional_File_Submission;
                    txtEdtCntrlr15!.text = additional_Information;

                    // _isCarrierOther = jsonDecode(value)["isCarrierOther"];
                    // _isCarrierOtherValue = jsonDecode(value)["isCarrierOtherValue"];
                    //  _isDamageType = jsonDecode(value)["isDamageType"];
                    // _isDamageTypeValue =
                    //     jsonDecode(value)["isDamageTypeValue"];
                    // _isDamageLocation =
                    //     jsonDecode(value)["isDamageLocation"] == "false"
                    //         ? false
                    //         : true;
                    // _isActive = isActive == "true" ? true : false;
                    // _createdBy = createdBy;
                    // _createdDate = createdDate;
                    // _device = device;
                    // _note = note;
                    // _remarks = remarks;
                    // _form_Type = form_Type;
                    // _map = map;
                    // _claim_Status = claim_Status;

                    inspection_date = inspection_Date;
                    inspection_time = inspection_Time;

                    String carrier_Name = jsonDecode(value)["carrier_Name"];
                    carrier_name_fullobject =
                        DataAllDropDown.fromString(carrier_Name);
                    carrier_name_select = carrier_name_fullobject!.value!;

                    String state = jsonDecode(value)["state"];
                    state_fullobject = DataAllDropDown.fromString(state);
                    state_select = state_fullobject!.value!;

                    String catastrophe_Event =
                        jsonDecode(value)["catastrophe_Event"];
                    catastrophe_event_fullobject =
                        DataAllDropDown.fromString(catastrophe_Event);
                    catastrophe_event_select =
                        catastrophe_event_fullobject!.value!;

                    String re_inspection = jsonDecode(value)["re_inspection"];
                    re_inspection_fullobject =
                        DataAllDropDown.fromString(re_inspection);
                    re_inspection_select = re_inspection_fullobject!.value!;

                    String independent_adjuster =
                        jsonDecode(value)["independent_adjuster"];
                    independent_adjuster_fullobject =
                        DataAllDropDown.fromString(independent_adjuster);
                    independent_adjuster_select =
                        independent_adjuster_fullobject!.value!;

                    //TODO
                    String service_Type = jsonDecode(value)["service_Type"];
                    service_type_fullobject =
                        DataServiceType.fromString(service_Type);
                    service_type_select = service_type_fullobject!.serviceName!;

                    String pitch = jsonDecode(value)["pitch"];
                    pitch_fullobject = DataAllDropDown.fromString(pitch);
                    pitch_select = pitch_fullobject!.value!;

                    String photo_Submission_Type =
                        jsonDecode(value)["photo_Submission_Type"];
                    photo_submission_type_fullobject =
                        DataAllDropDown.fromString(photo_Submission_Type);
                    photo_submission_type_select =
                        photo_submission_type_fullobject!.value!;

                    String scope_submission_type =
                        jsonDecode(value)["scope_submission_type"];
                    scope_submission_type_fullobject =
                        DataAllDropDown.fromString(scope_submission_type);
                    scope_submission_type_select =
                        scope_submission_type_fullobject!.value!;

                    String report_Submission_Type =
                        jsonDecode(value)["report_Submission_Type"];
                    report_submission_type_fullobject =
                        DataAllDropDown.fromString(report_Submission_Type);
                    report_submission_type_select =
                        report_submission_type_fullobject!.value!;

                    String measurement_Submission_Type =
                        jsonDecode(value)["measurement_Submission_Type"];
                    measurment_submission_type_fullobject =
                        DataAllDropDown.fromString(measurement_Submission_Type);
                    measurment_submission_type_select =
                        measurment_submission_type_fullobject!.value!;

                    //==============================================
                    setState(() {
                      Navigator.pop(context);
                      /* damage_type_fullobject = DataAllDropDown.fromJson(
                          jsonDecode(value)["isDamageType"]);*/
                    });
                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(color: Colors.white),
                  ))
            ],
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  ListItemClick("id", jsonDecode(value)["id"]),
                  ListItemClick("policy_Holder_Name",
                      jsonDecode(value)["policy_Holder_Name"]),
                  ListItemClick("main_Contact_Phone_Number",
                      jsonDecode(value)["main_Contact_Phone_Number"]),
                  ListItemClick("policy_Holder_Email",
                      jsonDecode(value)["policy_Holder_Email"]),
                  ListItemClick("policy_Holder_Phone_Number",
                      jsonDecode(value)["policy_Holder_Phone_Number"]),
                  ListItemClick(
                      "adjuster_Name", jsonDecode(value)["adjuster_Name"]),
                  ListItemClick(
                      "adjuster_Email", jsonDecode(value)["adjuster_Email"]),
                  ListItemClick("adjuster_Phone_Number",
                      jsonDecode(value)["adjuster_Phone_Number"]),
                  ListItemClick("address", jsonDecode(value)["address"]),
                  ListItemClick("city", jsonDecode(value)["city"]),
                  ListItemClick("zip_Code", jsonDecode(value)["zip_Code"]),
                  ListItemClick("claim_ID", jsonDecode(value)["claim_ID"]),
                  ListItemClick("isDamageLocationValue",
                      jsonDecode(value)["isDamageLocationValue"]),
                  ListItemClick("stories", jsonDecode(value)["stories"]),
                  ListItemClick("additional_File_Submission",
                      jsonDecode(value)["additional_File_Submission"]),
                  ListItemClick("additional_Information",
                      jsonDecode(value)["additional_Information"]),
                  ListItemClick(
                      "inspection_Date", jsonDecode(value)["inspection_Date"]),
                  ListItemClick(
                      "inspection_Time", jsonDecode(value)["inspection_Time"]),
                  ListItemClick(
                      "isCarrierOther", jsonDecode(value)["isCarrierOther"]),
                  ListItemClick("isCarrierOtherValue",
                      jsonDecode(value)["isCarrierOtherValue"]),
                  ListItemClick("isDamageTypeValue",
                      jsonDecode(value)["isDamageTypeValue"]),
                  ListItemClick("isDamageLocation",
                      jsonDecode(value)["isDamageLocation"]),
                  ListItemClick("isActive", jsonDecode(value)["isActive"]),
                  ListItemClick("createdBy", jsonDecode(value)["createdBy"]),
                  ListItemClick(
                      "createdDate", jsonDecode(value)["createdDate"]),
                  ListItemClick("device", jsonDecode(value)["device"]),
                  ListItemClick("note", jsonDecode(value)["note"]),
                  ListItemClick("remarks", jsonDecode(value)["remarks"]),
                  ListItemClick("form_Type", jsonDecode(value)["form_Type"]),
                  ListItemClick("map", jsonDecode(value)["map"]),
                  ListItemClick(
                      "claim_Status", jsonDecode(value)["claim_Status"]),
                  //==========================================================

                  ListItemClick("re_inspection",
                      jsonDecode(jsonDecode(value)["re_inspection"])["value"]),

                  ListItemClick("carrier_Name",
                      jsonDecode(jsonDecode(value)["carrier_Name"])["value"]),

                  ListItemClick(
                      "state", jsonDecode(jsonDecode(value)["state"])["value"]),

                  ListItemClick(
                      "catastrophe_Event",
                      jsonDecode(
                          jsonDecode(value)["catastrophe_Event"])["value"]),

                  ListItemClick(
                      "independent_Adjuster",
                      jsonDecode(
                          jsonDecode(value)["independent_Adjuster"])["value"]),

                  ListItemClick("service_Type",
                      jsonDecode(jsonDecode(value)["service_Type"])["value"]),
                  ListItemClick(
                      "pitch", jsonDecode(jsonDecode(value)["pitch"])["value"]),
                  ListItemClick(
                      "state", jsonDecode(jsonDecode(value)["state"])["value"]),
                  ListItemClick("isDamageType",
                      jsonDecode(jsonDecode(value)["isDamageType"])["value"]),
                ],
              ),
            ),
          );
        },
      );
    });
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
        InkWell(
          onTap: () async {
            _showDialog();
          },
          child: Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 15),
            decoration: WidgetsReusing.getListBoxDecoration(),
            child: Icon(
              Icons.format_paint,
              size: 30,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "New Claims",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(right: 15),
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

  // Show the modal that contains the CupertinoDatePicker
  void _showDatePickerDate(ctx) {
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
                          txtEdtCntrlr16!.text = _date.toString();
                          txtEdtCntrlr16!.text =
                              ConstantFunctions.calendar_formate.format(_date);
                          inspection_date =
                              ConstantFunctions.calendar_formate.format(_date);
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
                          txtEdtCntrlr17!.text = ConstantFunctions
                              .formattedTimefinal
                              .format(_date);
                          // txtEdtCntrlr17!.text = _date.toString();

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
