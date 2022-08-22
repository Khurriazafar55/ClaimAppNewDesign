import 'package:claim_core/dashboard/models/model_profile.dart';
import 'package:claim_core/profile/my_profile/attach_profile_view.dart';
import 'package:claim_core/profile/my_profile/availablity_profile_view.dart';
import 'package:claim_core/profile/my_profile/exper_profile_view.dart';
import 'package:claim_core/profile/my_profile/general_profile_view.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';
import '../edit_profile/profile_edit_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // late GestureTapCallback onContacts;

  GestureTapCallback? onProfile;
  GestureTapCallback? onLoadPress;

  Future<ModelProfile>? _future;

  @override
  void initState() {
    super.initState();

    ConstantFunctions.getSharePrefModeString("login_token").then(
      (loginToken) {
        setState(() {
          // _future = DashboardService.GetProfile(login_token);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // onContacts = () {
    //   Navigator.push(
    //       context, ConstantFunctions.OpenNewActivity(const ScreenContacts()));
    // };
    onLoadPress = () {
      ConstantFunctions.getSharePrefModeString("login_token").then(
        (loginToken) {
          setState(() {
            // _future = DashboardService.GetProfile(login_token);
          });
        },
      );
    };

    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: ThemeColors.background_color,
          appBar: AppBar(
            leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: const Icon(
                Icons.close,
                color: ThemeColors.headline6_color_lt,
              ),
            ),
            backgroundColor: ThemeColors.background_color,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              "My Profile",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      ConstantFunctions.OpenNewActivity(
                          const ProfileEditScreen()));
                },
                child: const Icon(
                  Icons.edit_note,
                  size: 30,
                  color: ThemeColors.headline6_color_lt,
                ),
              ),
              const SizedBox(
                width: 20,
              ),
            ],
            bottom: TabBar(
              indicatorColor: Colors.amberAccent,
              automaticIndicatorColorAdjustment: true,
              isScrollable: true,
              tabs: [
                ReusableContainer('General'),
                ReusableContainer('Availablity'),
                ReusableContainer('Experience'),
                ReusableContainer('Attachment'),
              ],
            ),
          ),
          body: const TabBarView(
            children: [
              GeneralProfileView(),
              AvailableProfileView(),
              ExpProfileView(),
              AttachProfileView(),
            ],
          )),
    );
  }

  Widget ReusableContainer(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        height: 35,
        width: MediaQuery.of(context).size.width / 4,
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
