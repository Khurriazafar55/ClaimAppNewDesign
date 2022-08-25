// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:claim_core/dashboard/screens/dashboard2.dart';
import 'package:flutter/material.dart';

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
  List<String> linkPaths = [
    'https://images.hive.blog/768x0/https://tripsteem-en.s3.us-west-1.amazonaws.com/origin/IMG20190723WA0011-1563920266115.jpg',
    'https://cdn.wallpapersafari.com/34/5/VpFhQc.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    final double w = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Stack(children: [
      BackGroundColor1(),
      Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 150,
                  childAspectRatio: 4 / 4,
                  crossAxisSpacing: 4,
                  mainAxisSpacing: 4),
              itemCount: linkPaths.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Image.network(linkPaths[index], fit: BoxFit.cover),
                );
              },
            ),
          )
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
      )
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
