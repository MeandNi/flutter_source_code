
import 'package:flutter/material.dart';
import 'package:inheritedwidget_sample/state_container.dart';
import 'package:inheritedwidget_sample/widgets/item_list.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return HomeScreenState();
  }
}

class HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final container = StateContainer.of(context);
    final state = container.state;

    return Scaffold(
      appBar: AppBar(
        title: Text('InheritedWidget Sample'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed('/addItem');
            },
          )
        ],
      ),
      body: ItemList(),
      
    );
  }
}
