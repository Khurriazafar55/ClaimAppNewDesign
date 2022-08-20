// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PhotoClaims extends StatefulWidget {
  static const routeName = "/photo";

  final TabController controller;
  const PhotoClaims({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<PhotoClaims> createState() => _PhotoClaimsState();
}

class _PhotoClaimsState extends State<PhotoClaims> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
