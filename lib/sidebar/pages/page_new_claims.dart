import 'dart:convert';

import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/sidebar/screens/CustomDialogBox.dart';
import 'package:claim_core/sidebar/widgets/widget_bottomnavbar.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class PageNewClaims extends StatefulWidget {
  const PageNewClaims({Key? key}) : super(key: key);

  @override
  State<PageNewClaims> createState() => _PageNewClaimsState();
}

class _PageNewClaimsState extends State<PageNewClaims> {
  String full_json = "";
  bool isdatafound = false;

  @override
  void initState() {
    super.initState();
    ConstantFunctions.getSharePrefModeString("last_claim_data").then((value) {
      setState(() {
        if (value != "no_value") {
          full_json = value;
          isdatafound = true;
        } else {
          isdatafound = false;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: isdatafound
              ? SingleChildScrollView(
                  child: ListBody(
                    children: [
                      ListItemClick("id", jsonDecode(full_json)["id"]),
                      ListItemClick("policy_Holder_Name",
                          jsonDecode(full_json)["policy_Holder_Name"]),
                      ListItemClick("main_Contact_Phone_Number",
                          jsonDecode(full_json)["main_Contact_Phone_Number"]),
                      ListItemClick("policy_Holder_Email",
                          jsonDecode(full_json)["policy_Holder_Email"]),
                      ListItemClick("policy_Holder_Phone_Number",
                          jsonDecode(full_json)["policy_Holder_Phone_Number"]),
                      ListItemClick("adjuster_Name",
                          jsonDecode(full_json)["adjuster_Name"]),
                      ListItemClick("adjuster_Email",
                          jsonDecode(full_json)["adjuster_Email"]),
                      ListItemClick("adjuster_Phone_Number",
                          jsonDecode(full_json)["adjuster_Phone_Number"]),
                      ListItemClick(
                          "address", jsonDecode(full_json)["address"]),
                      ListItemClick("city", jsonDecode(full_json)["city"]),
                      ListItemClick(
                          "zip_Code", jsonDecode(full_json)["zip_Code"]),
                      ListItemClick(
                          "claim_ID", jsonDecode(full_json)["claim_ID"]),
                      ListItemClick("isDamageLocationValue",
                          jsonDecode(full_json)["isDamageLocationValue"]),
                      ListItemClick(
                          "stories", jsonDecode(full_json)["stories"]),
                      ListItemClick("additional_File_Submission",
                          jsonDecode(full_json)["additional_File_Submission"]),
                      ListItemClick("additional_Information",
                          jsonDecode(full_json)["additional_Information"]),
                      ListItemClick("inspection_Date",
                          jsonDecode(full_json)["inspection_Date"]),
                      ListItemClick("inspection_Time",
                          jsonDecode(full_json)["inspection_Time"]),
                      ListItemClick("isCarrierOther",
                          jsonDecode(full_json)["isCarrierOther"]),
                      ListItemClick("isCarrierOtherValue",
                          jsonDecode(full_json)["isCarrierOtherValue"]),
                      ListItemClick("isDamageTypeValue",
                          jsonDecode(full_json)["isDamageTypeValue"]),
                      ListItemClick("isDamageLocation",
                          jsonDecode(full_json)["isDamageLocation"]),
                      ListItemClick(
                          "isActive", jsonDecode(full_json)["isActive"]),
                      ListItemClick(
                          "createdBy", jsonDecode(full_json)["createdBy"]),
                      ListItemClick(
                          "createdDate", jsonDecode(full_json)["createdDate"]),
                      ListItemClick("device", jsonDecode(full_json)["device"]),
                      ListItemClick("note", jsonDecode(full_json)["note"]),
                      ListItemClick(
                          "remarks", jsonDecode(full_json)["remarks"]),
                      ListItemClick(
                          "form_Type", jsonDecode(full_json)["form_Type"]),
                      ListItemClick("map", jsonDecode(full_json)["map"]),
                      ListItemClick("claim_Status",
                          jsonDecode(full_json)["claim_Status"]),
                      //==========================================================

                      ListItemClick("re_inspection",
                          jsonDecode(full_json)["re_inspection"]),

                      ListItemClick(
                          "carrier_Name",
                          jsonDecode(
                              jsonDecode(full_json)["carrier_Name"])["value"]),

                      ListItemClick("state",
                          jsonDecode(jsonDecode(full_json)["state"])["value"]),

                      ListItemClick(
                          "catastrophe_Event",
                          jsonDecode(jsonDecode(
                              full_json)["catastrophe_Event"])["value"]),

                      ListItemClick(
                          "independent_Adjuster",
                          jsonDecode(jsonDecode(
                              full_json)["independent_Adjuster"])["value"]),

                      ListItemClick(
                          "service_Type",
                          jsonDecode(
                              jsonDecode(full_json)["service_Type"])["value"]),
                      ListItemClick("pitch",
                          jsonDecode(jsonDecode(full_json)["pitch"])["value"]),
                      ListItemClick("state",
                          jsonDecode(jsonDecode(full_json)["state"])["value"]),
                      ListItemClick(
                          "isDamageType",
                          jsonDecode(
                              jsonDecode(full_json)["isDamageType"])["value"]),
                    ],
                  ),
                )
              : Container(
                  alignment: Alignment.center,
                  child: const Text('No saved data found'),
                ),
        ),
        WidgetsReusing.GetTextButton(context, "+", null,
            const EdgeInsets.symmetric(vertical: 10, horizontal: 20)),
        ResusableBottomNavBar(),
      ],
    );
  }

  void ShowDialog(context, title, text) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CustomDialogBox(
            title: title,
            descriptions: text,
            text: "Save",
          );
        });
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
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black87),
            ),
            const Divider()
          ],
        ),
      ),
    );
  }
}
