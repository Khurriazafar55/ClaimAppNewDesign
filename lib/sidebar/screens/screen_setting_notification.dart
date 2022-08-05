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
      (login_token) {
        print("object : login_token : $login_token");
        this.login_token = login_token;
        setState(() {
          future =
              SidebarService.GetAllNotificationFunction(context, login_token);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    GestureTapCallback onPresseddd = () {
      LoadData();
    };

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Theme.of(context).colorScheme.background,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.black87,
          ),
        ),
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Setting",
              style: TextStyle(fontSize: 21, color: Colors.black87),
            ),
            Divider(
              endIndent: 20,
              indent: 30,
              thickness: 1,
            ),
            Text(
              "Notication",
              style: TextStyle(fontSize: 19, color: Colors.black87),
            ),
          ],
        ),
        actions: [SizedBox(width: 40)],
      ),
      body: Container(
        child: FutureBuilder(
          future: future,
          builder: (context, AsyncSnapshot<ModelNotifications> snapshot) {
            if (snapshot.hasError) {
              return WidgetsReusing.getReLoadWidget(context,
                  message: "${snapshot.error.toString()}",
                  onPresseddd: onPresseddd);
            } else if (snapshot.hasData) {
              if (snapshot.data!.data!.length > 0) {
                return ListView.builder(
                  itemCount: snapshot.data!.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("${snapshot.data!.data![index].title}"),
                      subtitle:
                          Text("${snapshot.data!.data![index].description}"),
                    );
                  },
                );
              } else {
                return WidgetsReusing.getReLoadWidget(context,
                    message: "No notification found", onPresseddd: onPresseddd);
              }
            } else {
              return ConstantFunctions.ShowProgressLoadingView(context);
            }
          },
        ),
      ),
    );
  }
}
