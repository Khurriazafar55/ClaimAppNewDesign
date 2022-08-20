// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class FilesClaims extends StatefulWidget {
  static const routeName = "/files";

  final TabController controller;
  const FilesClaims({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FilesClaims> createState() => _FilesClaimsState();
}

class _FilesClaimsState extends State<FilesClaims> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
