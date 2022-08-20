import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

import 'dart:math' as math;

class MainWidget extends StatefulWidget {
  @override
  _MainWidgetState createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    // if (_controller.value == 0.8) _controller.reverse();
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: ThemeColors.background_color,
      body: Column(
        children: <Widget>[
          Stack(alignment: Alignment.center, children: [
            ClipPath(
              clipper: DrawClip(),
              child: Container(
                  height: size.height * 0.7,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                        stops: [
                          0.1,
                          0.15,
                          // 0.6,
                          // 0.9,
                        ],
                        colors: [
                          ThemeColors.dark_orange,
                          ThemeColors.orange_button,
                        ]),
                  ),
                  child: Container()),
            ),
          ]),
          Container(),
        ],
      ),
    );
  }
}

class DrawClip extends CustomClipper<Path> {
  // double move = 0;
  // double slice = math.pi;
  // DrawClip(this.move);
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height * 0.8);
    double xCenter = size.width * 0.5 + (size.width * 0.2 + 5);
    double yCenter = size.height * 0.6 + 109;

    path.quadraticBezierTo(
        xCenter, yCenter, size.width * 1.1, size.height * 0.6);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
