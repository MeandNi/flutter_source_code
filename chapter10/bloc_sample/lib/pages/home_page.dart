import 'package:bloc_sample/bloc/bloc_provider.dart';
import 'package:bloc_sample/bloc/items_bloc.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _count;

  // StreamSubscription streamSubscription;
  @override
  void initState() {
    _count = 0;
    // streamSubscription = MyApp.bloc.itemsStream.listen((items) => setState(() {
    //     }));
    super.initState();
  }

  @override
  void dispose() {
    // streamSubscription?.cancel();
    super.dispose();
  }

  void _addItem() {
    _count++;
    // MyApp.bloc.addItem(new Item('item $_count'));
    BlocProvider.of(context).addItem(new Item('item $_count'));
  }

  @override
  Widget build(BuildContext context) {

    print("build");
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
    return StreamBuilder<List<Item>>(
      // stream: MyApp.bloc.itemsStream,
      stream: BlocProvider.of(context).itemsStream,
      initialData: <Item>[],
      builder: (context, snappShot) {
        if (snappShot != null && snappShot.hasData) {
          List<Item> items = snappShot.data;
          return ListView.builder(
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              final item = items[index];
              return ItemView(
                item: item,
                onDismissed: (direction) {
                  BlocProvider.of(context).removeItem(item);
                },
                onTap: () {
                  _showUndoSnackbar(context, item);
                }
              );
            },
          );
        }

        // 流数据没到达之前显示加载框
        return CircularProgressIndicator ();
    },);

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
        title: Text(
          item.title,
          style: Theme.of(context).textTheme.title,
        )
      ),
    );
  }
}