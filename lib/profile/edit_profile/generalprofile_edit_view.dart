import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';

class GeneralProfileEditView extends StatefulWidget {
  const GeneralProfileEditView({Key? key}) : super(key: key);

  @override
  State<GeneralProfileEditView> createState() => _GeneralProfileEditViewState();
}

class _GeneralProfileEditViewState extends State<GeneralProfileEditView> {
  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    const headingTextStyle =
        TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.headline6_color_lt,
          borderRadius: BorderRadius.circular(7),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const SizedBox(height: 30),
              CircleAvatar(
                radius: 58,
                backgroundColor: Colors.yellow,
                child: Stack(children: const [
                  Align(
                    alignment: Alignment.bottomRight,
                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white70,
                      child: Icon(Icons.edit),
                    ),
                  ),
                ]),
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText('First Name', controller, 2.5),
                  ReusableText('Last Name', controller, 2.5),
                ],
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText('Inspector ID', controller, 2.5),
                  ReusableText('Date of Birth', controller, 2.5),
                ],
              ),
              const SizedBox(height: 15),

              ReusableText('Email Address', controller, 1),

              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ReusableText('Mobile Phone', controller, 2.5),
                  ReusableText('Work Phone', controller, 2.5),
                ],
              ),

              const SizedBox(height: 15),
              ReusableText('Company Name', controller, 1),
              const SizedBox(height: 15),
              ReusableText('Company Street Address', controller, 1),
              // PopupMenuButton(
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: const [
              //         SizedBox(width: 15),
              //         Text(
              //           "Availablity",
              //           style: TextStyle(
              //               fontSize: 20, fontWeight: FontWeight.w500),
              //         ),
              //         Icon(Icons.arrow_drop_down)
              //       ],
              //     ),
              //     itemBuilder: (context) => [
              //           const PopupMenuItem(
              //               value: 1, child: Text('Sunday ___ off')),
              //           const PopupMenuItem(
              //               value: 1, child: Text('Monday ___ 10-7')),
              //           const PopupMenuItem(
              //               value: 1, child: Text('Tuesday ___ 9-5')),
              //           const PopupMenuItem(
              //               value: 1, child: Text('Wednesday ___ 7-3')),
              //           const PopupMenuItem(
              //               value: 1, child: Text('Thursday ___ off')),
              //           const PopupMenuItem(
              //               value: 1, child: Text('Friday ___ 8-4')),
              //           const PopupMenuItem(
              //               value: 1, child: Text('Saturday ___ off')),
              //         ]),
              // const SizedBox(height: 30),
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 20, vertical: 10),
              //   width: double.infinity,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: const [
              //       Text("Phone Number", style: headingTextStyle),
              //       // Text("${snapshot.data!.data!.phoneNo}",
              //       Text("2375y3847347",
              //           style: TextStyle(
              //               decoration: TextDecoration.underline)),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 20, vertical: 10),
              //   width: double.infinity,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: const [
              //       Text("Email", style: headingTextStyle),
              //       // Text("${snapshot.data!.data!.companYEmail}",
              //       Text("a@gmail.com",
              //           style: TextStyle(
              //               decoration: TextDecoration.underline)),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 20, vertical: 10),
              //   width: double.infinity,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: const [
              //       Text("Company", style: headingTextStyle),
              //       // Text("${snapshot.data!.data!.company}",
              //       Text("claim servie company",
              //           style: TextStyle(
              //               decoration: TextDecoration.underline)),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 20, vertical: 10),
              //   width: double.infinity,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: const [
              //       Text("Position", style: headingTextStyle),
              //       // Text("${snapshot.data!.data!.position}",
              //       Text("Inspector",
              //           style: TextStyle(
              //               decoration: TextDecoration.underline)),
              //     ],
              //   ),
              // ),
              // const Text("Prefrences", style: headingTextStyle),
              // Container(
              //   child: Row(
              //     children: [
              //       Expanded(
              //         child: Container(
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 20, vertical: 10),
              //           width: double.infinity,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: const [
              //               Text("Stories", style: headingTextStyle),
              //               Text(
              //                   // "${snapshot.data!.data!.stories}",
              //                   "stories",
              //                   style: TextStyle(
              //                       decoration:
              //                           TextDecoration.underline)),
              //             ],
              //           ),
              //         ),
              //       ),
              //       Expanded(
              //         child: Container(
              //           padding: const EdgeInsets.symmetric(
              //               horizontal: 20, vertical: 10),
              //           width: double.infinity,
              //           child: Column(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             crossAxisAlignment: CrossAxisAlignment.start,
              //             children: const [
              //               Text("Pitch", style: headingTextStyle),
              //               // Text("${snapshot.data!.data!.pitch}",
              //               Text("max 7/9",
              //                   style: TextStyle(
              //                       decoration:
              //                           TextDecoration.underline)),
              //             ],
              //           ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Container(
              //   padding: const EdgeInsets.symmetric(
              //       horizontal: 20, vertical: 10),
              //   width: double.infinity,
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.start,
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: const [
              //       Text("HAAG Certified", style: headingTextStyle),
              //       // Text("${snapshot.data!.data!.haaGCertified}",
              //       Text("Address: xactnet address",
              //           style: TextStyle(
              //               decoration: TextDecoration.underline)),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget ReusableText(
      String txt1, TextEditingController textController, double width) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 12,
        right: 12,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            txt1,
            style: const TextStyle(fontSize: 19, fontWeight: FontWeight.w500),
          ),
          Container(
            height: 40,
            // width: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width / width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(color: Colors.black),
              color: Colors.white,
            ),
            child: TextFormField(
              controller: textController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
