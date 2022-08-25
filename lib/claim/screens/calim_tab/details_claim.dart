// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/claim/models/model_get_claim_id.dart';
import 'package:claim_core/claim/services/service_claim.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class DetailClaims extends StatefulWidget {
  static const routeName = "/detail";
  // final DataSingleClaim? claim;
  final DataSingleClaim? claim;
  final String claimId;
  final TabController controller;
  const DetailClaims({
    Key? key,
    // this.claim,
    this.claim,
    required this.claimId,
    required this.controller,
  }) : super(key: key);

  @override
  State<DetailClaims> createState() => _DetailClaimsState();
}

class _DetailClaimsState extends State<DetailClaims> {
  Future<ModelGetClaimId>? future_get_claimId;
  String login_token = "";
  String claimId = "";
  @override
  void initState() {
    super.initState();

    ConstantFunctions.getSharePrefModeString(
      "login_token",
    ).then(
      (loginToken) {
        // print(""object : login_token : $loginToken","object : claim_Id : ${widget.claim.claimId}"");
        login_token = loginToken;
        // this.claimId = claimId;
        setState(() {
          future_get_claimId =
              ServiceClaim.GetClaimById(context, loginToken, claimId);
        });
      },
    );
  }

  // Future<ModelGetClaim>? future_get_claim;

  // String login_token = "";

  // @override
  // void initState() {
  //   super.initState();

  //   ConstantFunctions.getSharePrefModeString("login_token").then(
  //     (loginToken) {
  //       print("object : login_token : $loginToken");
  //       this.login_token = loginToken;
  //       setState(() {
  //         future_get_claim = ServiceClaim.GetClaimFunction(context, loginToken);
  //       });
  //     },
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        BackGroundColor1(),
        Container(
            decoration: const BoxDecoration(
                // color: ThemeColors.background_color,
                // borderRadius: BorderRadius.circular(20),
                ),
            // margin: EdgeInsets.only(left: 12, right: 12),
            height: MediaQuery.of(context).size.height / 1.4,
            width: MediaQuery.of(context).size.width,
            child: Column(children: [
              const SizedBox(
                height: 4,
              ),
              Container(
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  decoration: BoxDecoration(
                    color: ThemeColors.primary_light_color1,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  // height: 520,
                  height: MediaQuery.of(context).size.height / 1.5,
                  width: MediaQuery.of(context).size.width,
                  child: Container(
                      // color: Colors.amberAccent,
                      margin: const EdgeInsets.only(
                          left: 10, right: 10, top: 5, bottom: 5),
                      child: Column(
                        children: [
                          Expanded(
                              child: SingleChildScrollView(
                            child: Column(
                              children: [
                                claimDetail(
                                  "${widget.claim!.carrierName}",
                                  "${widget.claim!.catastropheEvent}",
                                  "${widget.claim!.reInspection}",
                                  "${widget.claim!.serviceType}",
                                  "${widget.claim!.inspectionTime}",
                                  "${widget.claim!.pitch}",
                                  "${widget.claim!.stories}",
                                  "${widget.claim!.isDamageType}",
                                  "${widget.claim!.isDamageLocation}",
                                  "${widget.claim!.measureassistNone}",
                                ),
// carrier, Catastropheevent,Reinspection,ServiceType,TimeOfInspection,
// Pitch,Stories,DamageType,DamageLocation,MeasureAssist
                              ],
                            ),
                          )),
                        ],
                      ))),
            ])),
      ]),
    );
  }

  Widget claimDetail(
      carrier,
      Catastropheevent,
      Reinspection,
      ServiceType,
      TimeOfInspection,
      Pitch,
      Stories,
      DamageType,
      DamageLocation,
      MeasureAssist) {
    TextStyle style2 = const TextStyle(
        color: Colors.black54, fontSize: 13.5, fontWeight: FontWeight.bold);
    TextStyle style1 = const TextStyle(
        color: Colors.black, fontSize: 13.5, fontWeight: FontWeight.bold);

    TextStyle style3 = const TextStyle(
        color: Colors.black, fontSize: 16.5, fontWeight: FontWeight.bold);
    return Card(
        elevation: 0,
        color: ThemeColors.primary_light_color1,
        margin: const EdgeInsets.only(left: 0, right: 0, top: 8),
        child: Container(
            width: double.infinity,
            // margin: EdgeInsets.all(10),
            margin:
                const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Column(children: [
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Claim Details',
                  style: style3,
                ),
              ),
              //Carrer
              Container(
                  margin: const EdgeInsets.only(top: 30),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Carrier:',
                        style: style1,
                      ),
                      Text(
                        carrier,
                        style: style2,
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Catastrophe Event:',
                        style: style1,
                      ),
                      Text(
                        Catastropheevent,
                        style: style2,
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Reinspection:',
                        style: style1,
                      ),
                      Text(
                        Reinspection,
                        style: style2,
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Service Type:',
                        style: style1,
                      ),
                      Text(
                        ServiceType,
                        style: style2,
                      ),
                    ],
                  )),

              Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Time of Inspection:',
                        style: style1,
                      ),
                      Text(
                        TimeOfInspection,
                        style: style2,
                      ),
                    ],
                  )),

              Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Pitch:',
                        style: style1,
                      ),
                      Text(
                        Pitch,
                        style: style2,
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Stories:',
                        style: style1,
                      ),
                      Text(
                        Stories,
                        style: style2,
                      ),
                    ],
                  )),

              Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Damage Type:',
                        style: style1,
                      ),
                      Text(
                        DamageType,
                        style: style2,
                      ),
                    ],
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 10),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Damage Location:',
                        style: style1,
                      ),
                      Text(
                        DamageLocation,
                        style: style2,
                      ),
                    ],
                  )),

              Container(
                  margin: const EdgeInsets.only(top: 20),
                  alignment: Alignment.bottomLeft,
                  child: Row(
                    children: [
                      Text(
                        'Measure Asist:',
                        style: style1,
                      ),
                      Text(
                        MeasureAssist,
                        style: style2,
                      ),
                    ],
                  )),
              const SizedBox(
                height: 20,
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'Additional Info',
                  style: style3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Making a claim in your writing allows you to present the main idea of the document in the form of an argument that you will support with evidence throughout the document. A claim statement is a type of thesis statement in which you present the main idea of what you are writing in the form of an argument. Think of claims like a thesis statement in the form of an argument.',
                  style: style2,
                ),
              )
            ])));
  }
}
