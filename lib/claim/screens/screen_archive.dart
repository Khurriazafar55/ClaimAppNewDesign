import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:flutter/material.dart';

class ScreenArchive extends StatefulWidget {
  const ScreenArchive({Key? key}) : super(key: key);

  @override
  _ScreenArchiveState createState() => _ScreenArchiveState();
}

class _ScreenArchiveState extends State<ScreenArchive> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      // key: _drawerKey,
      // drawer: ScreenDrawer(),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(left: 7),
                      ),
                      Expanded(
                        child: Text(
                          "Archive",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.only(right: 7),
                        decoration: WidgetsReusing.getListBoxDecoration(),
                        child: Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    // height: 90,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        getIconText("Quility Assur", Colors.purple),
                        getIconText("Approved", Colors.green),
                        getIconText("Denied", Colors.red),
                        getIconText("Cancelled", Colors.black54),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return WidgetsReusing.GetClaimListItem(null!);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              //  width: double.infinity,
              // height: 120,

              margin: EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: WidgetsReusing.getListBoxDecoration(),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.25),
                                offset: Offset(1, 1),
                                blurRadius: 5,
                                spreadRadius: 1)
                          ]),
                      child: Icon(
                        Icons.home,
                        size: 30,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () async {
                      // Navigator.push(
                      //   context,
                      //   ConstantFunctions.OpenNewActivity(ScreenMyClaims()),
                      // );
                    },
                    child: Icon(
                      Icons.list_alt,
                      size: 30,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getIconText(title, Color color) {
    return Container(
      margin: EdgeInsets.only(left: 6, top: 20, right: 6, bottom: 5),
      padding: EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: color,
        width: 2.5, // Underline thickness
      ))),
      child: Text(title,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(fontSize: 15, letterSpacing: -0.5)),
    );
  }

  Widget getGridContainer(
      icon_data1, title1, onTapFirst, icon_data2, title2, onTapSecond) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: onTapFirst,
            child: GridContainer(icon_data1, title1, onTapFirst)),
        Spacer(),
        InkWell(
          onTap: onTapFirst,
          child: GridContainer(icon_data2, title2, onTapSecond),
        )
      ],
    );
  }

  Widget GridContainer(icon_data, title, onTap) {
    double width_height = MediaQuery.of(context).size.width / 2.5;
    return Container(
      margin: EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: width_height - 35,
      width: width_height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon_data, size: 50),
          SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
