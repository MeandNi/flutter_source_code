import 'package:flutter/material.dart';

class IconSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Icon"),
        ),
        body: Center(
          child: Container(
            width: 200.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Icon(
                  Icons.favorite,
                  color: Colors.pink,
                  size: 24.0,
                ),
              ],
            ),
          ),
        )
    );
  }
}