import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

  const SplashScreen({
    Key? key,
  }) : super(key: key);
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  Animation<double>? animation;
  AnimationController? animationController;

  @override
  void initState() {
    super.initState();

    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3))
          ..forward();
    animation = Tween<double>(begin: 0, end: -300).animate(animationController!)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: ThemeColors.background_color1,
      body: Stack(
        children: <Widget>[
          Align(
            alignment: const AlignmentDirectional(0, 1),
            child: Transform.translate(
              offset: Offset(0, animation!.value),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/ClaimCore_Logo.png',
                  scale: 1,
                ),
              ),
            ),
          ),
          // Align(
          //   alignment: AlignmentDirectional.bottomCenter,
          //   child: RaisedButton(
          //     onPressed: () {
          //       animationController!.forward();
          //     },
          //     color: Colors.red,
          //     textColor: Colors.yellowAccent,
          //     shape: const BeveledRectangleBorder(
          //         borderRadius: BorderRadius.all(Radius.circular(20))),
          //     child: const Text('Go'),
          //   ),
          // )
        ],
      ),
    );
  }
}
