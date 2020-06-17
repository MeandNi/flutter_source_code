import 'package:flutter/material.dart';

class TableSample extends StatefulWidget {
  @override
  _TableSampleState createState() => _TableSampleState();
}

class _TableSampleState extends State<TableSample> {
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
        title: Text('Table'),
      ),
      body: Container(
        alignment: Alignment.center,
        height: 500,
        padding: EdgeInsets.only(left: 8.0, right: 8.0),
        child: Table(
          border: TableBorder.all(width: 2.0, color: Colors.blue),
          defaultVerticalAlignment: TableCellVerticalAlignment.middle,
          defaultColumnWidth: FixedColumnWidth(80.0),
          columnWidths: {
            0: FixedColumnWidth(100.0),
            2: FixedColumnWidth(50.0),
          },
          children: [
            TableRow(children: [
              buildItem("Row11", Colors.redAccent),
              buildItem("Row12", Colors.orangeAccent),
              buildItem("Row13", Colors.yellowAccent),
//              buildItem("Row14", Colors.greenAccent),
              TableCell(
                verticalAlignment: TableCellVerticalAlignment.bottom,
                child: Container(
                  height: 50.0,
                  color: Colors.greenAccent,
                  alignment: Alignment.center,
                  child: Text(
                    "Row14",
                  ),
                ),
              )
            ]),
            TableRow(children: [
              buildItem("Row21", Colors.redAccent),
              buildItem("Row22", Colors.orangeAccent),
              buildItem("Row23", Colors.yellowAccent),
              buildItem("Row24", Colors.greenAccent),
            ])
          ],
        ),
      ),
    );
  }
}
