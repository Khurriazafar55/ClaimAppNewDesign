import 'package:claim_core/profile/edit_profile/attachprofile_edit_view.dart';
import 'package:claim_core/profile/edit_profile/availprofile_edit_view.dart';
import 'package:claim_core/profile/edit_profile/experprofile_edit_view.dart';
import 'package:claim_core/profile/edit_profile/generalprofile_edit_view.dart';
import 'package:flutter/material.dart';

import '../../app_theme_work/theme_colors.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({Key? key}) : super(key: key);

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  @override
  Widget build(BuildContext context) {
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
              "Edit Profile",
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: ThemeColors.scaffold_color_lt),
            ),
            actions: [
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.save,
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
          body: TabBarView(
            children: [
              GeneralProfileEditView(),
              AvailProfileEditView(),
              ExpProfileEditView(),
              AttachProfileEditView(),
            ],
          ),
        ));
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
