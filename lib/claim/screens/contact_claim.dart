// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class ContactClaims extends StatefulWidget {
  // static const routeName = "/contact";

  final TabController controller;
  ContactClaims({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<ContactClaims> createState() => _ContactClaimsState();
}

class _ContactClaimsState extends State<ContactClaims> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: ThemeColors.background_color,
            // borderRadius: BorderRadius.circular(20),
          ),
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: ThemeColors.primary_light_color1,
                  // borderRadius: BorderRadius.circular(20),
                ),
                // color: Colors.white,
                // height: 520,
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                    Container(
                      height: 190,
                      color: Colors.black,
                    ),
                    myallclaims(
                      "jarry frob",
                      "0900 09000",
                      " anna eiil",
                      "samat nagt laht",
                      "amna@gmail.com",
                      "090078986",
                      "Rose Rober",
                      "rose@gmail.com",
                      "09786544",
                    )
                  ])),
                ),
              ),
            ],
          )),
    );
  }

  Widget myallclaims(Contactname, Contactphone, policyName, policyAddress,
      policyEmail, policyPhone, AdjusterName, AdjusterEmail, AdjusterPhone) {
    // TextStyle style1 = TextStyle(
    //     color: Colors.black, fontSize: 14.5, fontWeight: FontWeight.bold);
    TextStyle style2 = TextStyle(
        color: Colors.black54, fontSize: 12, fontWeight: FontWeight.bold);

    TextStyle style3 = TextStyle(
        color: Colors.black, fontSize: 15.5, fontWeight: FontWeight.bold);

    return Card(
      elevation: 2,
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.only(left: 30, right: 30, top: 8),
      child: Container(
        width: double.infinity,
        // margin: EdgeInsets.all(10),
        margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),

        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'MainContact',
                          style: style3,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          Contactname,
                          style: style2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          Contactphone,
                          style: style2,
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'PolicyHolder',
                          style: style3,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          policyName,
                          style: style2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          policyAddress,
                          style: style2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Text(
                                'Email:',
                                style: style2,
                              ),
                              Text(
                                policyEmail,
                                style: style2,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Text(
                                'Phone:',
                                style: style2,
                              ),
                              Text(
                                policyPhone,
                                style: style2,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          'Adjuster',
                          style: style3,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          AdjusterName,
                          style: style2,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Text(
                                'Email:',
                                style: style2,
                              ),
                              Text(
                                AdjusterEmail,
                                style: style2,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          alignment: Alignment.bottomLeft,
                          child: Row(
                            children: [
                              Text(
                                'Phone:',
                                style: style2,
                              ),
                              Text(
                                AdjusterPhone,
                                style: style2,
                              ),
                            ],
                          )),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
