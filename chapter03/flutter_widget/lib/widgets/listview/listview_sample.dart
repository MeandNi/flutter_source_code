import 'package:flutter/material.dart';

class ListViewSample extends StatelessWidget {

  final List<String> items = <String>['Text', 'Button', 'Image', 'Icon', 'TextField', 'Form', 'TextFormField',
  'DropdownButtonFormField', 'Switch', 'CheckBox', 'Radio', 'Container', 'Padding', 'Align'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: Container(
          child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: items.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(title: Text('Widget ${items[index]}'));
              }
          )
//          child: ListView(
//            scrollDirection: Axis.vertical,
//            padding: const EdgeInsets.all(8),
//            itemExtent: 100.0,
////            shrinkWrap: true,
//            children: <Widget>[
//              Container(
//                height: 50,
//                color: Colors.green,
//                child: const Center(child: Text('A')),
//              ),
//              Container(
//                height: 50,
//                color: Colors.red,
//                child: const Center(child: Text('B')),
//              ),
//              Container(
//                height: 50,
//                color: Colors.lightBlue,
//                child: const Center(child: Text('C')),
//              ),
//            ],
//          ),
        )
    );
  }
}