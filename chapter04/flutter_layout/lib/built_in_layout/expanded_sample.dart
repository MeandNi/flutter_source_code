import 'package:flutter/material.dart';

class ExpandedSample extends StatefulWidget {
  @override
  _ExpandedSampleState createState() => _ExpandedSampleState();
}

class _ExpandedSampleState extends State<ExpandedSample> {

  buildItem(String content, Color backgroundColor) {
    return Container(
      width: 80,
      height: 80.0,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildItem("Row11", Colors.redAccent),
            Expanded(
                flex: 1,
                child: buildItem("Expanded 1", Colors.greenAccent)),
            Expanded(
                flex: 2,
                child: buildItem("Expanded 2", Colors.blueAccent))
          ],
        ),
      ),
    );
  }
}
