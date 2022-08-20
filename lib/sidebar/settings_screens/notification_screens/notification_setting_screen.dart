import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/sidebar/models/model_notifications.dart';
import 'package:claim_core/sidebar/services/sidebar_service.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class ScreenSettingNotification extends StatefulWidget {
  const ScreenSettingNotification({Key? key}) : super(key: key);

  @override
  State<ScreenSettingNotification> createState() =>
      _ScreenSettingNotificationState();
}

class _ScreenSettingNotificationState extends State<ScreenSettingNotification> {
  Future<ModelNotifications>? future;
  String login_token = "";

  @override
  void initState() {
    super.initState();
    LoadData();
  }

  void LoadData() {
    ConstantFunctions.getSharePrefModeString("login_token").then(
      (loginToken) {
        print("object : login_token : $loginToken");
        login_token = loginToken;
        setState(() {
          future =
              SidebarService.GetAllNotificationFunction(context, loginToken);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GestureTapCallback onPresseddd = () {
      LoadData();
    };

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Scaffold(
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
          title: Column(
            children: const [
              Text(
                "Notifications",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: ThemeColors.scaffold_color_lt),
              ),
              Divider(
                thickness: 2,
                color: ThemeColors.headline6_color_lt,
                endIndent: 30,
                indent: 30,
              ),
            ],
          ),
          actions: const [
            SizedBox(
              width: 30,
            )
          ],
        ),
        body: Container(
          child: FutureBuilder(
            future: future,
            builder: (context, AsyncSnapshot<ModelNotifications> snapshot) {
              if (snapshot.hasError) {
                return WidgetsReusing.getReLoadWidget(context,
                    message: snapshot.error.toString(),
                    onPresseddd: onPresseddd);
              } else if (snapshot.hasData) {
                if (snapshot.data!.data!.isNotEmpty) {
                  return Column(
                    children: [
                      const Text(
                        "Enable Device Notification",
                        style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: ThemeColors.scaffold_color_lt),
                      ),
                      const SizedBox(height: 10),
                      ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text("${snapshot.data!.data![index].title}"),
                            subtitle: Text(
                                "${snapshot.data!.data![index].description}"),
                          );
                        },
                      ),
                    ],
                  );
                } else {
                  return WidgetsReusing.getReLoadWidget(context,
                      message: "No notification found",
                      onPresseddd: onPresseddd);
                }
              } else {
                return ConstantFunctions.ShowProgressLoadingView(context);
              }
            },
          ),
        ),
      ),
    );
  }
}
