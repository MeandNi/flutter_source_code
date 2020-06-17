
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sample/item_list_model.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count;


  @override
  void initState() {
    _count = 0;

    super.initState();
  }

  @override
  void dispose() {

    super.dispose();
  }

  void _addItem() {
    _count++;
    Provider.of<ItemListModel>(context, listen: false).addItem(new Item('item $_count'));
  }

  @override
  Widget build(BuildContext context) {

    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: <Widget>[
          FlatButton(
            child: Text(Provider.of<int>(context).toString(), style: TextStyle(fontSize: 20.0, color: Colors.white)), 
            onPressed: null
          )
        ],
      ),
      body: Container(
        child: _buildList(context),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addItem,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildList(BuildContext context) {

    // ItemListModel itemListModel = Provider.of<ItemListModel>(context);
    // List<Item> items = itemListModel.items;


    return Consumer<ItemListModel>(
      builder: (context, itemListModel, child) => ListView.builder(
        itemCount: itemListModel.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = itemListModel.items[index];
          return ItemView(
            item: item,
            onDismissed: (direction) {
              
            },
            onTap: () {
              _showUndoSnackbar(context, item);
            }
          );
        },
      ),
    );

    // return ListView.builder(
    //   itemCount: items.length,
    //   itemBuilder: (BuildContext context, int index) {
    //     final item = items[index];
    //     return ItemView(
    //       item: item,
    //       onDismissed: (direction) {
            
    //       },
    //       onTap: () {
    //         _showUndoSnackbar(context, item);
    //       }
    //     );
    //   },
    // );
  }

  void _showUndoSnackbar(BuildContext context, Item item) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 2),
      content: Text(
        item.title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
      ),
    );

    Scaffold.of(context).showSnackBar(snackBar);
  }
}

class ItemView extends StatelessWidget {
  final DismissDirectionCallback onDismissed;
  final GestureTapCallback onTap;
  final Item item;

  ItemView({
    @required this.onDismissed,
    @required this.onTap,
    @required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: ValueKey(item.title),
      onDismissed: onDismissed,
      child: ListTile(
        onTap: onTap,
        leading: Checkbox(
          value: item.checked,
          onChanged: (checked) {
            Provider.of<ItemListModel>(context, listen: false)
                .updateTodo(item.copy(checked: checked));
          },
        ),
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.title,
        )
      ),
    );
  }
}