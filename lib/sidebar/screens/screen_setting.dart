import 'package:claim_core/claim/reports/screen_gallery.dart';
import 'package:claim_core/sidebar/screens/screen_default_setting.dart';
import 'package:claim_core/sidebar/screens/screen_profile_setting.dart';
import 'package:claim_core/sidebar/screens/screen_setting_help_support.dart';
import 'package:claim_core/sidebar/screens/screen_setting_notification.dart';
import 'package:claim_core/sidebar/screens/screen_setting_security.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class ScreenSetting extends StatefulWidget {
  ScreenSetting({Key? key}) : super(key: key);

  @override
  State<ScreenSetting> createState() => _ScreenSettingState();
}

class _ScreenSettingState extends State<ScreenSetting> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        elevation: 0,
        title: Text("Screen Setting",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: Colors.black87,
                fontSize: 19,
                fontWeight: FontWeight.w500)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            InkWell(
              onTap: () {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(ScreenProfileSetting()));
              },
              child: GetMenuList(Icons.person, "Profile", Colors.black87),
            ),
            Divider(
                thickness: 1.5, color: Colors.grey, endIndent: 20, indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(ScreenDefaultSetting()));
              },
              child: GetMenuList(
                  Icons.format_list_bulleted, "Defaults", Colors.black87),
            ),
            Divider(
                thickness: 1.5, color: Colors.grey, endIndent: 20, indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        ScreenSettingNotification()));
              },
              child: GetMenuList(Icons.notifications_none_rounded,
                  "Notification", Colors.black87),
            ),
            Divider(
                thickness: 1.5, color: Colors.grey, endIndent: 20, indent: 20),
            InkWell(
              onTap: () {},
              child: GetMenuList(
                  Icons.remove_red_eye, "Appearance", Colors.black87),
            ),
            Divider(
                thickness: 1.5, color: Colors.grey, endIndent: 20, indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(ScreenSettingSecurity()));
              },
              child: GetMenuList(Icons.lock, "Security", Colors.black87),
            ),
            Divider(
                thickness: 1.5, color: Colors.grey, endIndent: 20, indent: 20),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    ConstantFunctions.OpenNewActivity(
                        ScreenSettingHelpSupport()));
              },
              child:
                  GetMenuList(Icons.headset, "Help & Support", Colors.black87),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            // InkWell(
            //   onTap: () {
            //     ConstantFunctions.getSharePrefModeString("login_token").then(
            //       (login_token) {
            //         RestApiUtils.ShowLoadingDialog(context);
            //         ServiceClaim.GetAllDropDown(context, login_token)
            //             .then((modelAllDropdown) {
            //           Navigator.pop(context);
            //
            //           if (modelAllDropdown.data != null &&
            //               modelAllDropdown.data!.length > 0) {
            //             Navigator.push(
            //                 context,
            //                 ConstantFunctions.OpenNewActivity(ScreenReports(
            //                     modelAllDropdown: modelAllDropdown)));
            //           } else {
            //             ConstantFunctions.getSnakeBar(
            //                 context, "Drop down values getting failed");
            //           }
            //         });
            //       },
            //     );
            //   },
            //   child: GetMenuList(Icons.headset, "Reports", Colors.black87),
            // ),
            // Divider(
            //   thickness: 1.5,
            //   color: Colors.grey,
            //   endIndent: 20,
            //   indent: 20,
            // ),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    ConstantFunctions.OpenNewActivity(ScreenGallery()));
              },
              child: GetMenuList(Icons.headset, "Gallery", Colors.black87),
            ),
            Divider(
              thickness: 1.5,
              color: Colors.grey,
              endIndent: 20,
              indent: 20,
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {},
              child: Text("Sign Out",
                  style: Theme.of(context).textTheme.headline2!.copyWith(
                      color: Colors.black87,
                      fontSize: 22,
                      fontWeight: FontWeight.w600)),
            ),
            // Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            //   padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            //   decoration: _decoration,
            //   child: DropdownButton(
            //     icon: Icon(Icons.keyboard_arrow_down),
            //     iconSize: 30,
            //     underline: Container(), //rem
            //     items: cause_loss_dropdown
            //         .map((value) => DropdownMenuItem(
            //               child: Text(value),
            //               value: value,
            //             ))
            //         .toList(),
            //     onChanged: (String? value) {
            //       setState(() {
            //         cause_loss_select = value ?? "";
            //         cause_loss.forEach((full_object) {
            //           if (cause_loss_select == full_object.value) {
            //             cause_loss_fullobject = full_object;
            //           }
            //         });
            //       });
            //     },
            //     // isExpanded: false,
            //     value: cause_loss_select,
            //     isExpanded: true,
            //   ),
            // )
          ],
        ),
      ),
    );
  }

  final list = ["Apple", "Orange", "Kiwi", "Banana", "Grape"];
  List<DropdownMenuItem<String>> _createList() {
    return list
        .map<DropdownMenuItem<String>>(
          (text) => DropdownMenuItem(
            value: text,
            child: Text(text),
          ),
        )
        .toList();
  }

  final _decoration = ShapeDecoration(
    shape: RoundedRectangleBorder(
      side: BorderSide(width: 1.0, style: BorderStyle.solid),
      borderRadius: BorderRadius.all(Radius.circular(5.0)),
    ),
  );

  Widget GetMenuList(IconData iconData, String title, Color _color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 10, top: 7, bottom: 7),
          child: CircleAvatar(
            radius: 14,
            backgroundColor: Colors.transparent,
            child: Icon(
              iconData,
              color: Colors.black87,
            ),
          ),
        ),
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: Colors.black87,
                  fontSize: 19,
                  fontWeight: FontWeight.w500)),
        ),
        Container(
          padding: EdgeInsets.only(left: 15, right: 10),
          child: Icon(
            Icons.arrow_forward_ios,
            size: 18,
            color: Colors.grey,
          ),
        )
      ],
    );
  }
}
