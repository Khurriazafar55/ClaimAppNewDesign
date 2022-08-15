import 'package:claim_core/app_theme_work/widgets_reusing.dart';
import 'package:flutter/material.dart';

class ScreenOnDemand extends StatefulWidget {
  const ScreenOnDemand({Key? key}) : super(key: key);

  @override
  _ScreenOnDemandState createState() => _ScreenOnDemandState();
}

class _ScreenOnDemandState extends State<ScreenOnDemand> {
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
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          children: [
            Expanded(
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  Row(
                    children: [
                      InkWell(
                        onTap: () => Navigator.of(context).pop(),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          margin: const EdgeInsets.only(left: 15),
                          child: const Icon(
                            Icons.arrow_back,
                            size: 30,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Text(
                          "On Demand",
                          style: Theme.of(context).textTheme.headline1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(right: 7),
                        decoration: WidgetsReusing.getListBoxDecoration(),
                        child: const Icon(
                          Icons.search,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return WidgetsReusing.GetClaimListItem(null);
                      },
                    ),
                  )
                ],
              ),
            ),
            Container(
              //  width: double.infinity,
              // height: 120,

              margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              decoration: WidgetsReusing.getListBoxDecoration(),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Icon(
                    Icons.menu,
                    size: 30,
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.25),
                                offset: const Offset(1, 1),
                                blurRadius: 5,
                                spreadRadius: 1)
                          ]),
                      child: const Icon(
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
                    child: const Icon(
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
      margin: const EdgeInsets.only(left: 10, top: 20, right: 10, bottom: 5),
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
        color: color,
        width: 2.5, // Underline thickness
      ))),
      child: Text(title, style: Theme.of(context).textTheme.subtitle2),
    );
  }

  Widget getGridContainer(
      iconData1, title1, onTapFirst, iconData2, title2, onTapSecond) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
            onTap: onTapFirst,
            child: GridContainer(iconData1, title1, onTapFirst)),
        const Spacer(),
        InkWell(
          onTap: onTapFirst,
          child: GridContainer(iconData2, title2, onTapSecond),
        )
      ],
    );
  }

  Widget GridContainer(iconData, title, onTap) {
    double widthHeight = MediaQuery.of(context).size.width / 2.5;
    return Container(
      margin: const EdgeInsets.all(7),
      decoration: WidgetsReusing.getListBoxDecoration(),
      height: widthHeight - 35,
      width: widthHeight,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(iconData, size: 50),
          const SizedBox(height: 10),
          Text(title, style: Theme.of(context).textTheme.bodyText1),
        ],
      ),
    );
  }
}
