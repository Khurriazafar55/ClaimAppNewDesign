import 'package:claim_core/app_theme_work/text_themes.dart';
import 'package:claim_core/claim/models/model_get_claim.dart';
import 'package:claim_core/utilities/app_assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class WidgetsReusing {
  static BoxDecoration getListBoxDecoration() {
    return BoxDecoration(
        color: Colors.white,
        //sifat
        borderRadius: BorderRadius.all(Radius.circular(5)),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(.25),
              offset: Offset(1, 1),
              blurRadius: 5,
              spreadRadius: 1)
        ]);
  }

  static Widget GetClaimListItem(DataSingleClaim? data) {
    return Container(
      margin: EdgeInsets.only(left: 5, right: 5, top: 7, bottom: 7),
      padding: EdgeInsets.only(left: 5, right: 5, top: 7, bottom: 7),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(5)),
          border: Border.all(width: 2, color: Colors.black54)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child: Text("Claim id ${data?.id}"),
              ),
              Expanded(
                  flex: 1,
                  child: Divider(
                    thickness: 2,
                    color: getColor(data!.claimStatus),
                    // color: Colors.red,
                  )),
            ],
          ),
          Text(
            "${data.address}",
            style: TextStyle(fontSize: 17),
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: Text("${data.adjusterName}",
                    style: TextStyle(fontSize: 14)),
              ),
              Expanded(
                  child: Text(
                "${data.inspectionDate}",
                style: TextStyle(fontSize: 14),
              )),
              Expanded(
                  child: Text(
                "${data.inspectionDate}",
                style: TextStyle(fontSize: 14),
              )),
            ],
          ),
        ],
      ),
    );
  }

  static Color getColor(value) {
    if (value == "Assigned") {
      return Colors.blue;
    } else if (value == "Unassigned") {
      return Colors.blue;
    } else if (value == "Rejected") {
      return Colors.red;
    } else if (value == "Accepted") {
      return Colors.green;
    } else if (value == "Approved") {
      return Colors.green;
    } else if (value == "In Progress") {
      return Colors.orange;
    } else if (value == "Cancelled") {
      return Colors.grey;
    } else if (value == "Denied") {
      return Colors.red;
    } else if (value == "QUALITY AS.") {
      return Colors.purple;
    } else {
      return Colors.purple;
    }
  }

  static Widget getReLoadWidget(context,
      {String icon_path = AppAssets.internet_api_issue,
      String? message,
      onPresseddd}) {
    return ListView(
      children: [
        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
          child: Column(
            children: [
              Container(
                width: 140,
                height: 140,
                child: Lottie.asset(icon_path),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                "$message",
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 23,
                    letterSpacing: .2,
                    color: Colors.black87),
              ),
              SizedBox(
                height: 25,
              ),
              GetTextButton(context, "Reload", onPresseddd,
                  EdgeInsets.symmetric(horizontal: 20))
            ],
          ),
        ),
      ],
    );
  }

  static Widget GetListSingleItem(String title, String value) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: 62,
            height: 25,
            child: Text('${title}',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          Text('${value}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700])),
        ],
      ),
    );
  }

  static Widget GetGoalItem(IconData icon_data, String title, String value) {
    return Container(
      child: Row(
        children: [
          Icon(icon_data),
          SizedBox(width: 10),
          Text('${title}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
          Spacer(),
          Text('${value}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: Colors.black)),
        ],
      ),
    );
  }

  static Widget GetListSingleItemWidthHeight(
      String title, String value, double item_width, double item_height) {
    return Container(
      child: Row(
        children: [
          SizedBox(
            width: item_width,
            height: item_height,
            child: Text('${title}',
                style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                    color: Colors.black)),
          ),
          Text('${value}',
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey[700])),
        ],
      ),
    );
  }

  //=========== Tab bar Work =========================================

  static Material GetMaterialTabbar(context, tabController, tabList) {
    return Material(
      // color: Theme.of(context).colorScheme.secondary,
      color: Theme.of(context).colorScheme.background,
      child: TabBar(
        onTap: (vvv) {
          if (vvv == 0) {
            tabController.index = 0;
          } else if (vvv == 1) {
            tabController.index = 1;
          }
        },
        controller: tabController,
        isScrollable: false,
        labelColor: Colors.black,
        indicatorColor: Colors.white,
        indicatorPadding: EdgeInsets.symmetric(horizontal: 0),
        indicatorWeight: 3,
        // indicator: Decoration(),
        labelStyle: Theme.of(context)
            .textTheme
            .headline4!
            .copyWith(fontSize: 18, color: Colors.black),
        tabs: GetTabs(context, tabList),
      ),
    );
  }

  static List<Widget> GetTabs(context, List<String> titles) {
    final myTabs = titles.map((title) {
      return Container(
        // padding: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.all(Radius.circular(10)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: Offset(0, 5),
                  blurRadius: 10,
                  spreadRadius: 3)
            ]),
        width: MediaQuery.of(context).size.width / 2.5,
        child: Tab(text: title),
      );
    }).toList();
    return myTabs;
  }

  //=========== Tab bar Work =========================================

  static Widget GetTextFormField(context, _controller,
      {keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: _controller,
      style: Theme.of(context).textTheme.bodyText2,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }

  static Widget getElevatedButton(context, String text, onTap) {
    return Container(
      width: double.infinity,
      height: 55,
      child: ElevatedButton(
        style: Theme.of(context).elevatedButtonTheme.style,
        onPressed: onTap,
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
      ),
    );
  }

  static Widget GetTextButton(context, String text, onTap, edgeinsets) {
    return Container(
      width: double.infinity,
      margin: edgeinsets,
      color: Color.fromRGBO(255, 102, 0, 1),
      height: 50,
      child: TextButton(
        style: Theme.of(context).textButtonTheme.style,
        onPressed: onTap,
        child: Text(
          text,
          style: TextThemes.button_text,
        ),
      ),
    );
  }

  static Widget GetTextButtonTransparent(
      context, String text, onTap, edgeinsets) {
    return Container(
      width: double.infinity,
      margin: edgeinsets,
      height: 50,
      color: Colors.transparent,
      child: TextButton(
        style: Theme.of(context).textButtonTheme.style,
        onPressed: onTap,
        child: Text(
          text,
          style: TextThemes.button_text,
        ),
      ),
    );
  }
}
