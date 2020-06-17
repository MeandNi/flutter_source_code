import 'package:flutter/material.dart';

class AlignSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Align"),
        ),
        body: Center(
          child: Container(
            width: 200.0,
            height: 200.0,
            color: Colors.green,
//            child: Padding(
//                padding: EdgeInsets.fromLTRB(30, 30, 35, 40) ,
//                child: Container(
//                  color: Colors.cyanAccent,
////                  width: 80.0,
////                  height: 80.0,
//                )),
            child: Align(
                alignment: Alignment.center,
                child: Container(
                  padding: const EdgeInsets.all(0.0),
                  color: Colors.cyanAccent,
                  width: 80.0,
                  height: 80.0,
                )),

          ),
        )
    );
  }
}