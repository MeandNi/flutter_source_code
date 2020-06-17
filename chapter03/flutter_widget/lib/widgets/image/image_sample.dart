import 'package:flutter/material.dart';

class ImageSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        body: ListView(
          children: <Widget>[
            Image.network(
              "https://meandni.com/img/avatar.jpg",
              width: 200.0,
              height: 200.0,
            ),
            Image.asset(
              'images/flutter.jpg',
              height: 300.0,
              width: 100.0,
//              fit: BoxFit.fill,
            ),
          ],
        )
    );
  }
}