// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:claim_core/app_theme_work/textformfield_theme.dart';
import 'package:claim_core/app_theme_work/textformfield_theme.dart';
import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:claim_core/sidebar/widgets/widget_main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotesClaims extends StatefulWidget {
  // const NotesClaims({Key? key}) : super(key: key);
  static const routeName = "/login";

  final TabController controller;
  const NotesClaims({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<NotesClaims> createState() => _NotesClaimsState();
}

class _NotesClaimsState extends State<NotesClaims> {
  TextEditingController outgoingController = TextEditingController();
  TextEditingController addnoteController = TextEditingController();
  onTapSubmit() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      BackGroundColor1(),
      Container(
          decoration: BoxDecoration(
              // color: ThemeColors.background_color,
              // borderRadius: BorderRadius.circular(20),
              ),
          height: MediaQuery.of(context).size.height / 1.4,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    // color: ThemeColors.background_color,
                    // borderRadius: BorderRadius.circular(20),
                    ),
                // color: Colors.white,
                // height: 520,
                height: MediaQuery.of(context).size.height / 1.5,
                width: MediaQuery.of(context).size.width,
                child: Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                    SizedBox(
                      height: 37.0,
                      width: 180.0,
                      child: Padding(
                          padding: const EdgeInsets.only(
                            top: 2.0,
                          ),
                          child: Container(
                              child: InkWell(
                            child: Container(
                              height: 40,
                              width: 120,
                              decoration: BoxDecoration(
                                color: ThemeColors.primary_red,
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                              child: const Center(
                                  child: Text(
                                'Add New',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                            onTap: () {
                              showAlertDialog(context);
                            },
                          ))),
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    NotesCard(
                      "Main cintact pri",
                      "hi i am d",
                      "nnn hgg mmmmmmmmmmmmmmm",
                      "you are illegebale for this podt",
                      "jjjjjmmm mmmmm mmm ",
                      "i ma haoppp mmmmmmmmmmm",
                      "are you stopid",
                      "22-3-2022",
                      "claimsatisfies",
                    ),
                    NotesCard(
                      "Main cintact pri",
                      "hi i am d",
                      "nnn hgg ",
                      "you are illegebale for this podt",
                      "jjjjjmmm  ",
                      "i ma haoppp ",
                      "are you stopid",
                      "22-3-2022",
                      "claimsatisfies",
                    ),
                    NotesCard(
                      "Main cintact pri",
                      "hi i am d",
                      "nnn hgg ",
                      "you are illegebale for this podt",
                      "jjjjjmmm  ",
                      "i ma haoppp ",
                      "are you stopid",
                      "22-3-2022",
                      "claimsatisfies",
                    ),
                  ])),
                ),
              ),
            ],
          )),
    ]));
  }

  Widget NotesCard(
      hradlinetext, text1, text2, text3, text4, text5, text6, date, no) {
    TextStyle style2 = TextStyle(
        color: Colors.black54, fontSize: 11, fontWeight: FontWeight.bold);

    TextStyle style3 = TextStyle(
        color: Colors.black, fontSize: 13.5, fontWeight: FontWeight.bold);

    return Card(
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        margin: EdgeInsets.only(left: 20, right: 20, top: 8),
        child: Container(
            width: double.infinity,
            // margin: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
            child: Column(children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  hradlinetext,
                  style: style3,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text1,
                  style: style2,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text2,
                  style: style2,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text3,
                  style: style2,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text4,
                  style: style2,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text5,
                  style: style2,
                ),
              ),
              SizedBox(
                height: 2,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  text6,
                  style: style2,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Container(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        date,
                        style: style2,
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Text(
                        no,
                        style: style2,
                      ),
                    ),
                  ])),
            ])));
  }

  void showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Container(
        height: 340.0,
        // width: double.infinity,
        width: 400,
        child: Column(
          children: <Widget>[
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.cancel_presentation),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    iconSize: 30,
                  ),
                ),
                SizedBox(
                  width: 40,
                ),
                Text(
                  'Add Note',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),

                //   // enabled: ,
                //   // focusNode: focus_node,
                //   textAlign: TextAlign.left,
                //   controller: addnoteController,
                //   style: const TextStyle(color: Colors.black),
                //   // keyboardType: keyboardType,
                //   decoration: InputDecoration(
                //     contentPadding:
                //         const EdgeInsets.only(top: 10, left: 10, right: 10),
                //     hintText: 'Add notes',
                //     fillColor: Colors.black,
                //     focusedBorder: OutlineInputBorder(
                //       borderRadius: BorderRadius.circular(25.0),
                //       // borderSide: BorderSide.none,
                //     ),
                //     enabledBorder: const OutlineInputBorder(
                //         // borderRadius: BorderRadius.circular(25.0),
                //         // borderSide: BorderSide.none,
                //         ),
                //   ),
                // ),
              ],
            ),
            const SizedBox(
              height: 5,
            ),
            TextFormField(
              // enabled: ,
              // focusNode: focus_node,
              textAlign: TextAlign.left,
              // minLines: 20,
              controller: outgoingController,
              style: const TextStyle(color: Colors.black),

              // keyboardType: keyboardType,
              decoration: InputDecoration(
                contentPadding:
                    const EdgeInsets.only(top: 10, left: 10, right: 10),
                hintText: 'outgoing call',
                fillColor: Colors.blueGrey,
                focusedBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.0),
                    // borderSide: BorderSide.none,

                    ),
                enabledBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.0),
                    // borderSide: BorderSide.none,
                    ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 150,
              width: 260,
              // color: Colors.black,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1),
                borderRadius: BorderRadius.circular(2.0),
              ),
              child: TextFormField(
                // enabled: ,
                // focusNode: focus_node,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                textAlign: TextAlign.left,
                // maxLengthEnforcement: 20,
                controller: addnoteController,
                style: const TextStyle(color: Colors.black),
                // keyboardType: keyboardType,
                decoration: InputDecoration(
                  contentPadding:
                      const EdgeInsets.only(top: 10, left: 10, right: 10),
                  // hintText: 'Add notes',
                  fillColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                  enabledBorder: const OutlineInputBorder(
                    // borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
              child: WidgetsReusing.getMaterialButton(
                  context, "Save", onTapSubmit),
            ),
          ],
        ),
      ),
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }
}
