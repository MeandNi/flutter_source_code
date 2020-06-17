import 'package:flutter/material.dart';

class GridViewSample extends StatelessWidget {

  final List<String> items = <String>['Text', 'Button', 'Image', 'Icon', 'TextField', 'Form', 'TextFormField',
  'DropdownButtonFormField', 'Switch', 'CheckBox', 'Radio', 'Container', 'Padding', 'Align'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("ListView"),
        ),
        body: Container(
          child: GridView.builder(
//              scrollDirection: Axis.horizontal,
              primary: false,
              padding: const EdgeInsets.all(20),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2, //每列
                  childAspectRatio: 1.0 //显示区域宽高相等
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: const EdgeInsets.all(8),
                  child: Center(child: Text('Widget ${items[index]}')),
                  color: Colors.teal,
                );
              }
          ),
//          child: GridView.count(
//            padding: const EdgeInsets.all(20),
//            crossAxisSpacing: 10,
//            mainAxisSpacing: 10,
//            crossAxisCount: 2,
//            children: <Widget>[
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: Center(child: const Text('Item A')),
//                color: Colors.teal,
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: Center(child: const Text('Item B')),
//                color: Colors.teal,
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: Center(child: const Text('Item C')),
//                color: Colors.teal,
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: Center(child: const Text('Item D')),
//                color: Colors.teal,
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: Center(child: const Text('Item E')),
//                color: Colors.teal,
//              ),
//              Container(
//                padding: const EdgeInsets.all(8),
//                child: Center(child: const Text('更多')),
//                color: Colors.teal,
//              ),
//            ],
//          )
        )
    );
  }
}