import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:flutter/material.dart';

class BackGroundColor extends StatefulWidget {
  @override
  _BackGroundColorState createState() => _BackGroundColorState();
}

class _BackGroundColorState extends State<BackGroundColor> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color(0xFff9C699),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 420),
        child: Container(
          decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 240, 91, 45),
            color: ThemeColors.background_color,
            borderRadius: BorderRadius.only(
              bottomRight:
                  Radius.elliptical(MediaQuery.of(context).size.width, 180.0),
              bottomLeft:
                  Radius.elliptical(MediaQuery.of(context).size.width, 40.0),
            ),
          ),
        ),
      ),
    );
  }
}

// class DrawClip extends CustomClipper<Path> {
//   @override
//   Path getClip(Size size) {
//     Path path = Path();
//     path.lineTo(0, size.height * 0.8);
//     double xCenter = size.width * 0.5 + (size.width * 0.2 + 5);
//     double yCenter = size.height * 0.6 + 109;

//     path.quadraticBezierTo(
//         xCenter, yCenter, size.width * 1.1, size.height * 0.6);

//     path.lineTo(size.width, 0);
//     return path;
//   }

//   @override
//   bool shouldReclip(CustomClipper<Path> oldClipper) {
//     return true;
//   }
// }

class BackGroundColor1 extends StatefulWidget {
  @override
  _BackGroundColor1State createState() => _BackGroundColor1State();
}

class _BackGroundColor1State extends State<BackGroundColor1> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Color(0xFff9C699),
      ),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 360),
        child: Container(
          decoration: BoxDecoration(
            // color: const Color.fromARGB(255, 240, 91, 45),
            color: ThemeColors.background_color,
            borderRadius: BorderRadius.only(
              bottomRight:
                  Radius.elliptical(MediaQuery.of(context).size.width, 180.0),
              bottomLeft:
                  Radius.elliptical(MediaQuery.of(context).size.width, 40.0),
            ),
          ),
        ),
      ),
    );
  }
}
