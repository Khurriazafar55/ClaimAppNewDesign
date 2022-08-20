// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class NotesClaims extends StatefulWidget {
  static const routeName = "/login";

  final TabController controller;
  const NotesClaims({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<NotesClaims> createState() => _NotesClaimsState();
}

class _NotesClaimsState extends State<NotesClaims> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
