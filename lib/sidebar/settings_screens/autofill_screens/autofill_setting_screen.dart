import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/sidebar/pages/page_new_claims.dart';
import 'package:claim_core/sidebar/pages/page_reports.dart';
import 'package:flutter/material.dart';

import '../../../app_theme_work/theme_colors.dart';

class ScreenAutoSetting extends StatefulWidget {
  const ScreenAutoSetting({Key? key}) : super(key: key);

  @override
  State<ScreenAutoSetting> createState() => _ScreenAutoSettingState();
}

class _ScreenAutoSettingState extends State<ScreenAutoSetting>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ThemeColors.background_color,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: ThemeColors.headline6_color_lt,
          ),
        ),
        backgroundColor: ThemeColors.background_color,
        elevation: 0,
        title: const Text(
          "Autofill",
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: ThemeColors.scaffold_color_lt),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: const Icon(
              Icons.add,
              color: ThemeColors.headline6_color_lt,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBody(),
      ),
    );
  }

  Widget GetBody() {
    List<String> tabList = ['New Claims', 'Reports'];

    return Container(
      child: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
              child: DefaultTabController(
            length: WidgetsReusing.GetTabs(context, tabList).length,
            child: Scaffold(
              backgroundColor: ThemeColors.background_color,
              body: Column(
                children: [
                  Container(
                    // color: Theme.of(context).colorScheme.secondary,
                    alignment: Alignment.center,
                    width: double.infinity,
                    child: WidgetsReusing.GetMaterialTabbar(
                        context, tabController, tabList),
                  ),
                  const SizedBox(height: 12),
                  Expanded(
                    child: TabBarView(
                      physics: const NeverScrollableScrollPhysics(),
                      controller: tabController,
                      children: [
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: const PageNewClaims(),
                        ),
                        Container(
                          width: double.infinity,
                          height: double.infinity,
                          alignment: Alignment.center,
                          child: PageReports(),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ))
        ],
      ),
    );
  }

  Widget GetMenuList(String title, Color color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Expanded(
          child: Text(title,
              style: Theme.of(context).textTheme.headline2!.copyWith(
                  color: ThemeColors.headline6_color_lt,
                  fontSize: 19,
                  fontWeight: FontWeight.w500)),
        ),
        Container(
          padding: const EdgeInsets.only(left: 15, right: 10),
          child: const Icon(
            Icons.arrow_forward_ios,
            size: 24,
            color: ThemeColors.headline6_color_lt,
          ),
        )
      ],
    );
  }
}
