import 'package:flutter/material.dart';

class RowColumnSample extends StatefulWidget {
  @override
  _RowColumnSampleState createState() => _RowColumnSampleState();
}

class _RowColumnSampleState extends State<RowColumnSample> {
  buildItem(String content, Color backgroundColor) {
    return Container(
      width: 100,
      height: 100.0,
      alignment: Alignment.center,
      color: backgroundColor,
      child: Text(content),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Row、Column'),
      ),
      body: Container(
        height: 500.0,
        color: Colors.lightBlue,
        child: Row(
//            textDirection: TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            buildItem("Row11", Colors.redAccent),
            buildItem("Row12", Colors.orangeAccent),
            buildItem("Row13", Colors.yellowAccent),
          ],
        ),
//          child: Column(
//            verticalDirection: VerticalDirection.up,
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              buildItem("Column11", Colors.redAccent),
//              buildItem("Column21", Colors.orangeAccent),
//              buildItem("Column31", Colors.yellowAccent),
//              buildItem("Column41", Colors.greenAccent),
//            ],
//          ),
//          child: Row(
//            mainAxisAlignment: MainAxisAlignment.center,
//            crossAxisAlignment: CrossAxisAlignment.center,
//            children: <Widget>[
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  buildItem("11", Colors.redAccent),
//                  buildItem("21", Colors.orangeAccent),
//                  buildItem("31", Colors.yellowAccent),
//                  buildItem("41", Colors.greenAccent),
//                ],
//              ),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  buildItem("12", Colors.redAccent),
//                  buildItem("22", Colors.orangeAccent),
//                  buildItem("32", Colors.yellowAccent),
//                  buildItem("42", Colors.greenAccent),
//                ],
//              ),
//              Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                crossAxisAlignment: CrossAxisAlignment.center,
//                children: <Widget>[
//                  buildItem("13", Colors.redAccent),
//                  buildItem("23", Colors.orangeAccent),
//                  buildItem("33", Colors.yellowAccent),
//                  buildItem("43", Colors.greenAccent),
//                ],
//              ),
//            ],
//          ),
      ),
    );
  }
}
