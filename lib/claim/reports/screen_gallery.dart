import 'package:flutter/material.dart';

class ScreenGallery extends StatefulWidget {
  const ScreenGallery({Key? key}) : super(key: key);

  @override
  State<ScreenGallery> createState() => _ScreenGalleryState();
}

class _ScreenGalleryState extends State<ScreenGallery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(top: AppBar().preferredSize.height),
        child: Column(
          children: [GetAppBar()],
        ),
      ),
    );
  }

  Widget GetAppBar() {
    return Row(
      children: [
        InkWell(
          onTap: () => Navigator.of(context).pop(),
          child: Container(
            // padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(left: 15),
            child: Icon(
              Icons.arrow_back,
              size: 30,
            ),
          ),
        ),
        Expanded(
          child: Text(
            "Gallery",
            style: Theme.of(context).textTheme.headline1,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
