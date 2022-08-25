// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FilesClaims extends StatefulWidget {
  static const routeName = "/files";

  final TabController controller;
  const FilesClaims({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FilesClaims> createState() => _FilesClaimsState();
}

class _FilesClaimsState extends State<FilesClaims> {
  onTapSubmit() {}

  String namedoc1 = '';
  String namedoc2 = "";
  String namedoc3 = "";
  String namedoc4 = "";
  String path1 = "";
  String path2 = "";
  String path3 = "";
  String path4 = "";

  @override
  Widget build(BuildContext context) {
    String nameId1 = "";
    return Scaffold(
      body: Stack(children: [
        BackGroundColor1(),
        Container(
            child: Container(
          margin: const EdgeInsets.only(left: 20, right: 10),
          child: Column(
            children: [
              Container(
                  child: SingleChildScrollView(
                      child: Column(children: [
                Container(
                    height: MediaQuery.of(context).size.height / 1.5,
                    margin: const EdgeInsets.only(left: 0, right: 0),
                    decoration: BoxDecoration(
                        // color: ThemeColors.background_color,
                        borderRadius: BorderRadius.circular(10)),
                    child: Container(
                        // margin:
                        //     EdgeInsets.only(left: 10, right: 10, top: 10),
                        child: SingleChildScrollView(
                            child: Column(children: [
                      MyCard("Attached files(4)", () async {}),
                      const SizedBox(
                        height: 20,
                      ),
                      //pdf
                      Container(
                        child: Row(
                          children: [
                            // GestureDetector(
                            //   child: Container(
                            //       height: 100,
                            //       width: 100,
                            //       // color: Colors.white,
                            //       child: (path1 == null)
                            //           ? Container()
                            //           : Image.file(
                            //               File(path1),
                            //               fit: BoxFit.cover,
                            //               // width: double.infinity,
                            //             )),
                            //   onTap: () async {
                            //     final result =
                            //         await FilePicker.platform.pickFiles(
                            //       type: FileType.custom,
                            //       allowedExtensions: [
                            //         'jpg',
                            //         'pdf',
                            //         'doc',
                            //         'png',
                            //         'mp4',
                            //         'mkv'
                            //       ],
                            //     );
                            //     //   if (result == null)return;
                            //     // final file = result.files.first;
                            //     if (result == null) return;
                            //     final file = result.files.first;
                            //     setState(() {
                            //       namedoc1 = file.name;
                            //       path1 = file.path!;
                            //     });
                            //   },
                            // ),
                            (path1 != null)
                                ? const SizedBox(
                                    height: 100,
                                    width: 100,
                                    child:
                                        //  Image.file(
                                        // File(path1),
                                        Icon(
                                      Icons.file_copy_outlined,
                                      size: 60,
                                    ),

                                    // fit: BoxFit.cover,
                                    // width: double.infinity,
                                  )
                                // )
                                : const Icon(Icons.file_copy),

                            const SizedBox(
                              width: 35,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _docname(namedoc1),
                                  Row(
                                    children: [
                                      Button(
                                        color: ThemeColors.primary_red,
                                        text: 'View',
                                        onPressed: () async {
                                          final result = await FilePicker
                                              .platform
                                              .pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: [
                                              'jpg',
                                              'pdf',
                                              'doc',
                                              'png',
                                              'mp4',
                                              'mkv'
                                            ],
                                          );
                                          //   if (result == null)return;
                                          // final file = result.files.first;
                                          if (result == null) return;
                                          final file = result.files.first;
                                          setState(() {
                                            namedoc1 = file.name;
                                            path1 = file.path!;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Button(
                                        color: ThemeColors.primary_red,
                                        text: 'Remove',
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      //png
                      Container(
                        child: Row(
                          children: [
                            SizedBox(
                              height: 100,
                              width: 100,
                              // color: Colors.white,
                              child: (path2 == null)
                                  ? Container()
                                  : const Icon(
                                      Icons.file_copy_outlined,
                                      size: 60,
                                    ),
                              // Image.file(
                              //     File(path2),
                              //     fit: BoxFit.cover,
                              //     // width: double.infinity,
                              //   )
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _docname(namedoc2),
                                  Row(
                                    children: [
                                      Button(
                                        color: ThemeColors.primary_red,
                                        text: 'View',
                                        onPressed: () async {
                                          final result = await FilePicker
                                              .platform
                                              .pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: [
                                              'jpg',
                                              'pdf',
                                              'doc',
                                              'png',
                                              'mp4',
                                              'mkv'
                                            ],
                                          );
                                          //   if (result == null)return;
                                          // final file = result.files.first;
                                          if (result == null) return;
                                          final file = result.files.first;
                                          setState(() {
                                            namedoc2 = file.name;
                                            path2 = file.path!;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Button(
                                        color: ThemeColors.primary_red,
                                        text: 'Remove',
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 10,
                      ),
                      //docs
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              child: const SizedBox(
                                height: 100,
                                width: 100,
                                child: Icon(
                                  Icons.file_copy_outlined,
                                  size: 60,
                                ),
                                // Image.file(
                                //   File(path3),
                                //   fit: BoxFit.cover,
                                //   // width: double.infinity,
                                // )
                              ),
                              onTap: () async {
                                final result =
                                    await FilePicker.platform.pickFiles(
                                  type: FileType.custom,
                                  allowedExtensions: [
                                    // 'jpg',
                                    // 'pdf',
                                    'doc',
                                    // 'png',
                                    // 'mp4',
                                    // 'mkv'
                                  ],
                                );
                                //   if (result == null)return;
                                // final file = result.files.first;
                                if (result == null) return;
                                final file = result.files.first;
                                setState(() {
                                  namedoc3 = file.name;
                                  path3 = file.path!;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _docname(namedoc3),
                                  Row(
                                    children: [
                                      Button(
                                        color: ThemeColors.primary_red,
                                        text: 'View',
                                        onPressed: () async {
                                          final result = await FilePicker
                                              .platform
                                              .pickFiles(
                                            type: FileType.custom,
                                            allowedExtensions: [
                                              'jpg',
                                              'pdf',
                                              'doc',
                                              'png',
                                              'mp4',
                                              'mkv'
                                            ],
                                          );
                                          //   if (result == null)return;
                                          // final file = result.files.first;
                                          if (result == null) return;
                                          final file = result.files.first;
                                          setState(() {
                                            namedoc4 = file.name;
                                            path4 = file.path!;
                                          });
                                        },
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Button(
                                        color: ThemeColors.primary_red,
                                        text: 'Remove',
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        child: Row(
                          children: [
                            GestureDetector(
                              child: const SizedBox(
                                height: 100,
                                width: 100,
                                // color: Colors.white,
                                child: Icon(
                                  Icons.file_copy_outlined,
                                  size: 60,
                                ),
                                // Image.file(
                                //   File(path4),
                                //   fit: BoxFit.cover,
                                //   // width: double.infinity,
                                // )
                              ),
                              onTap: () async {
                                final result =
                                    await FilePicker.platform.pickFiles(
                                        // type: FileType.custom,
                                        // allowedExtensions: [
                                        //   'jpg',
                                        //   'pdf',
                                        //   'doc',
                                        //   'png',
                                        //   'mp4',
                                        //   'mkv'
                                        // ],
                                        );
                                //   if (result == null)return;
                                // final file = result.files.first;
                                if (result == null) return;
                                final file = result.files.first;
                                setState(() {
                                  namedoc4 = file.name;
                                  path4 = file.path!;
                                });
                              },
                            ),
                            const SizedBox(
                              width: 35,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  _docname(namedoc4),
                                  Row(
                                    children: [
                                      Button(
                                        color: ThemeColors.primary_red,
                                        text: 'View',
                                        onPressed: () {},
                                      ),
                                      const SizedBox(
                                        width: 20,
                                      ),
                                      Button(
                                        color: ThemeColors.primary_red,
                                        text: 'Remove',
                                        onPressed: () {},
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      //   // color: Colors.black,
                      //   child: Row(
                      //     children: [
                      //       Expanded(
                      //           flex: 2,
                      //           child: Container(
                      //             height: 100,
                      //             width: 30,
                      //             color: Colors.white,
                      //           )),
                      //       SizedBox(
                      //         width: 30,
                      //       ),
                      //       Expanded(
                      //         flex: 4,
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               child: Column(
                      //                 children: [
                      //                   SizedBox(
                      //                     height: 15,
                      //                   ),
                      //                   Button(
                      //                     color: ThemeColors.primary_red,
                      //                     text: 'View',
                      //                     onPressed: () {},
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //             // SizedBox(
                      //             //   width: 10,
                      //             // ),
                      //             Container(
                      //               child: Column(
                      //                 children: [
                      //                   _text('sample.docs'),
                      //                   Button(
                      //                     color: ThemeColors.primary_red,
                      //                     text: 'Remove',
                      //                     onPressed: () {},
                      //                   )
                      //                 ],
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       )
                      //     ],
                      //   ),
                      // ),
                    ]))))
              ])))
            ],
          ),
        ))
      ]),
    );
  }

//Attached files(4)
  _text(text) {
    return Container(
      child: Text(
        text,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold),
      ),
    );
  }

  _card2() {
    return Container(
      // color: Colors.black,
      child: Row(
        children: [
          Expanded(
              flex: 2,
              child: Container(
                height: 120,
                width: 30,
                color: Colors.white,
              )),
          const SizedBox(
            width: 30,
          ),
          Expanded(
            flex: 4,
            child: Row(
              children: [
                Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 15,
                      ),
                      Button(
                        color: ThemeColors.primary_red,
                        text: 'View',
                        onPressed: () async {
                          final result = await FilePicker.platform.pickFiles();
                          //   if (result == null)return;
                          // final file = result.files.first;
                          // if (result == null) return;
                          // final file = result.files.first;
                          // setState(() {
                          //   nameId = file.name;
                          //   // print(file.size);
                          // });
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  child: Column(
                    children: [
                      _text('claim.pdf'),
                      Button(
                        color: ThemeColors.primary_red,
                        text: 'Remove',
                        onPressed: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  _docname(text) {
    return Text(text,
        style: const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold));
  }

  Widget MyCard(text, onTap) {
    return Container(
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            style: const TextStyle(
                color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            width: 120,
          ),
          InkWell(
            onTap: onTap,
            child: const Icon(
              Icons.attach_file,
              size: 30,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    this.onPressed,
    required this.color,
    required this.text,
  }) : super(key: key);
  final void Function()? onPressed;
  final Color color;

  final String text;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      height: 30,
      textColor: Colors.white,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }
}
