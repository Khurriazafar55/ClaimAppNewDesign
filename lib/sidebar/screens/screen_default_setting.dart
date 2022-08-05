import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/sidebar/pages/page_new_claims.dart';
import 'package:claim_core/sidebar/pages/page_reports.dart';
import 'package:flutter/material.dart';

class ScreenDefaultSetting extends StatefulWidget {
  const ScreenDefaultSetting({Key? key}) : super(key: key);

  @override
  State<ScreenDefaultSetting> createState() => _ScreenDefaultSettingState();
}

class _ScreenDefaultSettingState extends State<ScreenDefaultSetting>
    with TickerProviderStateMixin {
  late TabController tabController = TabController(length: 2, vsync: this);

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
        title: Text("Default",
            style: Theme.of(context).textTheme.headline2!.copyWith(
                color: Colors.black87,
                fontSize: 19,
                fontWeight: FontWeight.w500)),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: GetBody(),
      ),
    );
  }

  Widget GetBody() {
    List<String> tabList = ['New Claims', 'Reports'];

    return Column(
      children: [
        Expanded(
            child: DefaultTabController(
          length: WidgetsReusing.GetTabs(context, tabList).length,
          child: Scaffold(
            body: Column(
              children: [
                Container(
                  // color: Theme.of(context).colorScheme.secondary,
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: WidgetsReusing.GetMaterialTabbar(
                      context, tabController, tabList),
                ),
                Expanded(
                  child: TabBarView(
                    physics: NeverScrollableScrollPhysics(),
                    controller: tabController,
                    children: [
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        alignment: Alignment.center,
                        child: PageNewClaims(),
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
    );
  }

  Widget GetMenuList(IconData iconData, String title, Color _color) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 15, right: 10, top: 10, bottom: 10),
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
