import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_compass/flutter_compass.dart';

import 'compass_logic.dart';

class CompassScreen extends StatefulWidget {
  const CompassScreen({Key? key}) : super(key: key);

  @override
  State<CompassScreen> createState() => _CompassScreenState();
}

class _CompassScreenState extends State<CompassScreen> {
  double? _bearing = 0;

  void _setBearing(double heading) {
    setState(() {
      _bearing = heading;
    });
  }
  // double? heading = 0;

  @override
  initState() {
    SystemChrome.setPreferredOrientations([
      // DeviceOrientation.landscapeLeft,
      DeviceOrientation.portraitUp,
    ]);
    FlutterCompass.events!.listen((event) {
      setState(() {
        _bearing = event.heading;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<CompassEvent>(
      stream: FlutterCompass.events,
      builder: (context, snapshot) {
        final heading = snapshot.data?.heading ?? 0;

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 41, 38, 38),
          body: Align(
            alignment: const Alignment(0, -0.2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CompassLogic(
                  bearing: _bearing,
                  heading: heading,
                ),
                const SizedBox(height: 12),
                _bearing! >= 0 && _bearing! <= 90
                    ? Text(
                        '${_bearing?.ceil()}°NE',
                        style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            color: Colors.white),
                      )
                    : _bearing! >= 90 && _bearing! <= 180
                        ? Text(
                            '${_bearing?.ceil()}°ES',
                            style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.w800,
                                color: Colors.white),
                          )
                        : _bearing! >= 180 && _bearing! <= 270
                            ? Text(
                                '${_bearing?.ceil()}°SW',
                                style: const TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white),
                              )
                            : _bearing! >= 270 && _bearing! <= 360
                                ? Text(
                                    '${_bearing?.ceil()}°WN',
                                    style: const TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w800,
                                        color: Colors.white),
                                  )
                                : const Text(''),
              ],
            ),
          ),
        );
      },
    );

    // Scaffold(
    //   backgroundColor: const Color.fromARGB(221, 57, 56, 56),
    //   appBar: AppBar(
    //     title: const Text('Compass'),
    //     centerTitle: true,
    //     backgroundColor: const Color.fromARGB(96, 108, 102, 102),
    //   ),
    //   body: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     crossAxisAlignment: CrossAxisAlignment.center,
    //     children: [
    //       Text(
    //         '${heading?.ceil()}°',
    //         style: const TextStyle(
    //             fontSize: 18, fontWeight: FontWeight.w400, color: Colors.white),
    //       ),
    //       const SizedBox(height: 4),
    //       Padding(
    //         padding: const EdgeInsets.all(12),
    //         child: Stack(
    //           alignment: Alignment.center,
    //           children: [
    //             Image.asset('assets/cadrant.png'),
    //             Transform.rotate(
    //               angle: ((heading ?? 0) * (pi / 180) * -1),
    //               child: Image.asset(
    //                 'assets/compass.png',
    //                 scale: 1.1,
    //               ),
    //             ),
    //           ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
  }
}
