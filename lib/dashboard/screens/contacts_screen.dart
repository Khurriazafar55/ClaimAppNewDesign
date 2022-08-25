import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:claim_core/utilities/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactsScreen1 extends StatefulWidget {
  const ContactsScreen1({Key? key}) : super(key: key);

  @override
  State<ContactsScreen1> createState() => _ContactsScreen1State();
}

class _ContactsScreen1State extends State<ContactsScreen1> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();
  Future<void>? _launched;
  final String _phone = '';
  List<String> contactList = ['Doctor', 'Hafeez', 'Flutter'];

  Future<void> _makePhoneCall(String phoneNumb) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumb,
    );
    await launchUrl(launchUri);
  }

  Future<void> _openMessageApp(String messageNumber) async {
    final Uri launchUri = Uri(scheme: 'sms', path: messageNumber);
    await launchUrl(launchUri);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // key: _drawerKey,
        // drawer: ScreenDrawer(),
        // appBar: AppBar(title: const Text('Contacts'), centerTitle: true),
        body: GetBody());
  }

  Widget GetBody() {
    return Stack(children: [
      BackGroundColor1(),
      Container(
          margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Column(children: [
            const SizedBox(
              height: 40,
            ),
            ContactBar(),
            const Text(
              'Jomes Claim Services',
              style: TextStyle(color: Colors.white, fontSize: 15),
            ),
            const SizedBox(
              height: 3,
            ),
            const Divider(
              height: 2,
              thickness: 1,
              indent: 30,
              endIndent: 30,
              color: Colors.white,
            ),
            const SizedBox(
              height: 5,
            ),
            // Container(
            //     height: MediaQuery.of(context).size.height / 1.37,
            //     margin: const EdgeInsets.only(left: 12, right: 12),
            //     decoration: BoxDecoration(
            //         color: const Color.fromRGBO(255, 246, 238, 1),
            //         borderRadius: BorderRadius.circular(10)),
            //     child: Container(
            //         width: double.infinity,
            //         margin: const EdgeInsets.only(left: 10, right: 10, top: 10),
            //         child: SingleChildScrollView(
            //             child: Column(children: [
            //           // ListView.builder(
            //           //     itemBuilder: (BuildContext context, index) {
            //           //   return Contacts("Antax Sanum", "Software");
            //           // }),
            // _text('A'),
            //           Contacts("Antax Sanum", "Software"),
            //           const SizedBox(
            //             height: 5,
            //           ),
            //           Contacts("Amina Ijaz", "Software"),
            //           const SizedBox(
            //             height: 5,
            //           ),
            //           Contacts("Amina Ijaz", "Software"),
            //           const SizedBox(
            //             height: 5,
            //           ),
            //           _text('B'),
            //           Contacts("Antax Sanum", "Software"),
            //           const SizedBox(
            //             height: 5,
            //           ),
            //           Contacts("Amina Ijaz", "Software"),
            //           const SizedBox(
            //             height: 5,
            //           ),
            //           _text('C'),
            //           Contacts("Antax Sanum", "Software"),
            //           const SizedBox(
            //             height: 5,
            //           ),
            //           Contacts("Amina Ijaz", "Software"),
            //           const SizedBox(
            //             height: 5,
            //           ),
            //         ])))),

            Expanded(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                    color: const Color.fromRGBO(255, 246, 238, 1),
                    borderRadius: BorderRadius.circular(12)),
                child: Expanded(
                  flex: 113,
                  child: ListView.builder(
                      itemCount: contactList.length,
                      itemBuilder: (BuildContext context, index) {
                        return Column(
                          children: [
                            _text('A'),
                            Contacts(contactList[1], "Software"),
                          ],
                        );
                      }),
                ),
              ),
            ),

            // Container(
            //   // color: Colors.black,
            //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
            //   child: Container(
            //     //  width: double.infinity,
            //     // height: 120,

            //     margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
            //     decoration: WidgetsReusing.getListBoxDecoration(),

            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         InkWell(
            //           onTap: () {
            //             _drawerKey.currentState!.openDrawer();
            //           },
            //           child: Container(
            //             padding: const EdgeInsets.all(10),
            //             // margin: const EdgeInsets.only(left: 15),
            //             child: const Icon(
            //               Icons.menu,
            //               size: 30,
            //               color: Color.fromRGBO(255, 102, 0, 1),
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           child: InkWell(
            //             onTap: () {
            //               Navigator.push(
            //                 context,
            //                 ConstantFunctions.OpenNewActivity(
            //                     DashBoardScreen()),
            //               );
            //             },
            //             child: Container(
            //               padding: const EdgeInsets.all(10),
            //               decoration: const BoxDecoration(
            //                   color: Colors.white,
            //                   shape: BoxShape.circle,
            //                   boxShadow: [
            //                     BoxShadow(
            //                         color: Color.fromRGBO(255, 102, 0, 1),
            //                         spreadRadius: 2),
            //                     BoxShadow(
            //                         color: Color.fromRGBO(255, 102, 0, 1),
            //                         // color: Colors.black.withOpacity(.25),
            //                         offset: Offset(1, 1),
            //                         blurRadius: 5,
            //                         spreadRadius: 1)
            //                   ]),
            //               child: const Icon(
            //                 Icons.home,
            //                 size: 30,
            //                 color: Color.fromRGBO(255, 102, 0, 1),
            //               ),
            //             ),
            //           ),
            //         ),
            //         InkWell(
            //           onTap: () async {
            //             // Navigator.push(
            //             //   context,
            //             //   ConstantFunctions.OpenNewActivity(
            //             //       const ScreenMyClaims()),
            //             // );
            //           },
            //           child: const Icon(
            //             Icons.list_alt,
            //             size: 30,
            //             color: Color.fromRGBO(255, 102, 0, 1),
            //           ),
            //         )
            //       ],
            //     ),
            //   ),
            // ),
          ]))
    ]);
  }

  Widget UrlIcons(VoidCallback? onTap, icon) {
    return Card(
      elevation: 2,
      color: Colors.white,
      margin: const EdgeInsets.all(1),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          margin: const EdgeInsets.all(3),
          child: Icon(
            icon,
            color: Colors.orange,
            size: 27,
          ),
        ),
      ),
    );
  }

  _text(alphabates) {
    return Container(
        child: Row(
      children: [
        const SizedBox(
          width: 20,
        ),
        Text(
          alphabates,
          style: const TextStyle(
              color: Colors.black, fontSize: 30, fontWeight: FontWeight.w500),
        )
      ],
    ));
  }

  Widget ContactBar() {
    return Row(
      children: [
        InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            decoration: const BoxDecoration(
              color: ThemeColors.background_color,
            ),
            // color: Color.fromRGBO(255, 102, 0, 1),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(left: 15),
            // decoration: WidgetsReusing.getListBoxDecoration(),
            child: const Icon(
              Icons.person,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
        const Expanded(
          child: Center(
            child: Text(
              'Contacts',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        InkWell(
          onTap: () {},
          child: Container(
            decoration: const BoxDecoration(
              color: ThemeColors.background_color,
            ),
            padding: const EdgeInsets.all(10),
            margin: const EdgeInsets.only(right: 10),
            // decoration: WidgetsReusing.getListBoxDecoration(),
            child: const Icon(
              Icons.search,
              size: 30,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Widget Contacts(name, jobtitle) {
    TextStyle style1 = const TextStyle(
        color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold);
    TextStyle style2 = const TextStyle(
      color: Colors.black,
      fontSize: 16,
    );
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(4),
      child: Row(
        children: [
          const Expanded(
              flex: 2,
              child: SizedBox(
                height: 55,
                child: CircleAvatar(
                  radius: 25,
                  backgroundImage: AssetImage(
                    AppAssets.claim_core_logo,
                  ),
                  //  backgroundImage: NetworkImage('${user.image_url}'),
                ),
              )),
          // Expanded(flex: 1, child: Container()),
          const SizedBox(
            width: 5,
          ),
          Expanded(
              flex: 5,
              child: SizedBox(
                width: double.infinity,
                height: 50,
                // color: Colors.black,
                child: Column(children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      name,
                      style: style1,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: Text(
                      jobtitle,
                      style: style2,
                    ),
                  ),
                ]),
              )),
          Expanded(
            flex: 4,
            child: Container(
              // color: Colors.black,
              child: Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  UrlIcons(
                    () {
                      _launched = _makePhoneCall(_phone);

                      print('$_launched -----------------');
                    },
                    Icons.call,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  UrlIcons(() {
                    _launched = _openMessageApp(_phone);
                  }, Icons.comment),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
