import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/dashboard/models/model_profile.dart';
import 'package:flutter/material.dart';

class GeneralProfileView extends StatefulWidget {
  const GeneralProfileView({Key? key}) : super(key: key);

  @override
  State<GeneralProfileView> createState() => _GeneralProfileViewState();
}

class _GeneralProfileViewState extends State<GeneralProfileView> {
  // late GestureTapCallback onContacts;

  GestureTapCallback? onProfile;
  GestureTapCallback? onLoadPress;

  Future<ModelProfile>? _future;

  static const headingTextStyle =
      TextStyle(fontSize: 20, fontWeight: FontWeight.w500);

  @override
  Widget build(BuildContext context) {
    // onContacts = () {
    //   Navigator.push(
    //       context, ConstantFunctions.OpenNewActivity(const ScreenContacts()));
    // };
    return Padding(
      padding: const EdgeInsets.only(top: 16, left: 12, right: 12, bottom: 12),
      child: Container(
        decoration: BoxDecoration(
          color: ThemeColors.headline6_color_lt,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          children: [
            // Row(
            //   children: const [
            //     InkWell(
            //       onTap: onContacts,
            //       child: Container(
            //         padding: const EdgeInsets.all(10),
            //         margin: const EdgeInsets.only(left: 7),
            //         decoration: WidgetsReusing.getListBoxDecoration(),
            //         child: const Icon(
            //           Icons.person,
            //           size: 30,
            //         ),
            //       ),
            //     ),
            //     Expanded(
            //       child: Text(
            //         "My Profile",
            //         style: Theme.of(context).textTheme.headline1,
            //         textAlign: TextAlign.center,
            //       ),
            //     ),
            //     InkWell(
            //       onTap: () => Navigator.of(context).pop(),
            //       child: Container(
            //         padding: const EdgeInsets.all(10),
            //         margin: const EdgeInsets.only(right: 7),
            //         child: const Icon(
            //           Icons.close,
            //           size: 30,
            //         ),
            //       ),
            //     ),
            // ],
            // ),

            Expanded(
              // child: FutureBuilder(
              //   future: _future,
              //   builder: (context, AsyncSnapshot<ModelProfile> snapshot) {
              //     if (snapshot.hasData) {
              //       if (snapshot.data != null) {
              // return
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 17),
                    const CircleAvatar(
                        radius: 50,
                        backgroundColor: Colors.grey,
                        child:
                            Icon(Icons.person, size: 70, color: Colors.white)),
                    const SizedBox(height: 15),
                    // Text("${snapshot.data!.data!.name}",
                    const Text("Jason winshxon", style: headingTextStyle),
                    const SizedBox(height: 15),
                    const Text("Inspector ID : 232345"),

                    // "${snapshot.data!.data!.inspectorId}",

                    const SizedBox(height: 15),
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

                    ReusablelistTile(
                      Icons.email_outlined,
                      'jwin@jamesclaims.com',
                    ),
                    ReusablelistTile(
                      Icons.phone_android_rounded,
                      '0800-37648-457',
                    ),
                    ReusablelistTile(
                      Icons.phone,
                      '0813-37648-457',
                    ),
                    ReusablelistTile(
                      Icons.home_work_outlined,
                      'James Claims Service',
                      widget: const Text(
                        '5040W townville, ll4858',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ),
                    ReusablelistTile(
                      Icons.person_outline,
                      'Inspector',
                    ),
                    ReusablelistTile(
                      Icons.cake_outlined,
                      'November 4',
                    ),
                    ReusablelistTile(
                      Icons.star_border_purple500_rounded,
                      'Haag Certified',
                    ),
                    ReusablelistTile(
                      Icons.auto_graph_rounded,
                      'Xactware Id: jwins@jamesclaims.com',
                    ),

                    const Divider(
                      thickness: 1.5,
                      endIndent: 10,
                      indent: 10,
                      color: Colors.black26,
                    ),

                    const Text("Prefrences", style: headingTextStyle),
                    const SizedBox(height: 8),
                    ReusablelistTile(
                      Icons.text_rotation_angledown_outlined,
                      'Max Pitch: 9/12',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget ReusablelistTile(IconData iconDAta, String title, {Widget? widget}) {
    return ListTile(
        dense: true,
        leading: Icon(
          iconDAta,
          size: 30,
          color: Colors.black,
        ),
        title: Text(
          title,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        subtitle: widget);
  }
}
