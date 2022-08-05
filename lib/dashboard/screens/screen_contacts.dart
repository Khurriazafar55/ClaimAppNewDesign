import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:claim_core/dashboard/models/model_get_contact.dart';
import 'package:claim_core/utilities/constant_functions.dart';
import 'package:flutter/material.dart';

class ScreenContacts extends StatefulWidget {
  const ScreenContacts({Key? key}) : super(key: key);

  @override
  State<ScreenContacts> createState() => _ScreenContactsState();
}

class _ScreenContactsState extends State<ScreenContacts> {
  late GestureTapCallback onContacts;

  late GestureTapCallback onProfile;

  Future<ModelGetContact>? _future_contact_list;

  @override
  void initState() {
    super.initState();
    ConstantFunctions.getSharePrefModeString("login_token").then(
      (login_token) {
        setState(() {
          // _future_contact_list =
          // DashboardService.GetContact(context, login_token);
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    onContacts = () {
      Navigator.push(
          context, ConstantFunctions.OpenNewActivity(ScreenContacts()));
    };

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: AppBar().preferredSize.height),
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  // onTap: onContacts,
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(left: 7),
                    decoration: WidgetsReusing.getListBoxDecoration(),
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.black87,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        "Contacts",
                        style: Theme.of(context).textTheme.headline1,
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        "Coast to coast claim Services",
                        style: Theme.of(context)
                            .textTheme
                            .headline5!
                            .copyWith(color: Colors.black87),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.of(context).pop(),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 7),
                    child: Icon(
                      Icons.close,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Divider(
              indent: 20,
              endIndent: 10,
              height: 12,
              color: Colors.black87,
            ),
            Expanded(
                child: FutureBuilder(
              future: _future_contact_list,
              builder: (context, AsyncSnapshot<ModelGetContact> snapshot) {
                if (snapshot.hasData) {
                  print("HelloData snapshot data ${snapshot.data!.data}");
                  print("HelloData snapshot data ${snapshot.data}");
                  if (snapshot.data != null &&
                      snapshot.data!.data!.length > 0) {
                    return ListView.builder(
                        itemCount: snapshot.data!.data!.length,
                        itemBuilder: (context, index) {
                          var contact_data = snapshot.data!.data![index];
                          return Container(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: Icon(Icons.person,
                                        color: Colors.black87),
                                  ),
                                  SizedBox(width: 5),
                                  Expanded(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${contact_data.name}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline3,
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          contact_data.phoneNo != null
                                              ? "${contact_data.phoneNo}"
                                              : "",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline4,
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      if (contact_data.phoneNo != null) {
                                        ConstantFunctions.openPhoneCall(
                                            phoneNumber: contact_data.phoneNo
                                                .toString());
                                      } else {
                                        ConstantFunctions.getSnakeBar(context,
                                            "Phone number not available");
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.call,
                                          color: Colors.black87),
                                    ),
                                  ),
                                  SizedBox(width: 5),
                                  InkWell(
                                    onTap: () {
                                      if (contact_data.phoneNo != null) {
                                        ConstantFunctions.openSMS(
                                            phoneNumber:
                                                contact_data.phoneNo.toString(),
                                            message: "");
                                      } else {
                                        ConstantFunctions.getSnakeBar(context,
                                            "Phone number not available");
                                      }
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      child: Icon(Icons.message,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                  } else {
                    return WidgetsReusing.getReLoadWidget(context,
                        message: "zero record found", onPresseddd: null);
                  }
                } else if (snapshot.hasError) {
                  return WidgetsReusing.getReLoadWidget(context,
                      message: "${snapshot.error}", onPresseddd: null);
                } else {
                  return ConstantFunctions.ShowProgressLoadingView(context);
                }
              },
            )),
          ],
        ),
      ),
    );
  }
}
