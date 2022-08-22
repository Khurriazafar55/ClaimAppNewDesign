// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:io';

import 'package:claim_core/app_theme_work/theme_colors.dart';
import 'package:claim_core/claim/screens/file_claim.dart';
import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:file_picker/file_picker.dart';

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart';

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
  String nameId = "";
  bool name = false;

  @override
  Widget build(BuildContext context) {
    final double _w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      BackGroundColor1(),
      Container(
          child: Column(
        children: [
          //                 width: _w,
          //                 height: MediaQuery.of(context).size.height * 0.4,
          //                 child: _pickedImage != null
          //                     ? Image.file(
          //                         _pickedImage,
          //                         fit: BoxFit.fill,
          //                       )
          //                     : Container()
          //                 //FileImage(_pickedImage!),
          //                 ),
        ],
      ))
    ]));
  }
//  functionToUploadToServer(multiformData){

//                       Dio dio = Dio();

//                       final response = await dio.post(
//                         url,
//                         data: multiformData,
//                         options: Options(
//                             contentType: 'multipart/form-data',
//                             headers: {},
//                             followRedirects: false,
//                             validateStatus: (status) {
//                               return status! <= 500;
//                             }),
//                       );
//                       print(response.statusCode);

//                 }

}
