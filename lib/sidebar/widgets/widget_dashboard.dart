// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DashBoardWidget extends StatelessWidget {
  final dynamic child;
  final dynamic child1;
  const DashBoardWidget({
    Key? key,
    required this.child,
    required this.child1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        FractionallySizedBox(
            alignment: Alignment.topCenter,
            heightFactor: 0.65,
            child: Container(
              child: child1(),
            )),
        FractionallySizedBox(
          alignment: Alignment.bottomCenter,
          heightFactor: 0.30,
          child: Container(
              color: Color.fromRGBO(187, 153, 107, 1),
              // decoration: const BoxDecoration(

              //     borderRadius: BorderRadius.only(
              //         topLeft: Radius.circular(50),
              //         topRight: Radius.circular(50))
              //   ),
              child: child),
        ),
      ],
    );
  }
}
