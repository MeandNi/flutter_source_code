import 'package:flutter/material.dart';
import 'package:flutter_route/self_navigator/data/local_veggie_provider.dart';
import 'package:flutter_route/self_navigator/data/veggie.dart';
import 'package:flutter_route/self_navigator/screen/details.dart';
import 'package:flutter_route/self_navigator/self_navigator.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final List<Veggie> items = LocalVeggieProvider.veggies;

  @override
  Widget build(BuildContext context) {
    return SelfNavigator(
      home: Scaffold(
        appBar: AppBar(title: Text('水果列表'),),
        body: ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: items.length,
            itemBuilder: (BuildContext context, int index) {
              Veggie item = items[index];
              return GestureDetector(
                  onTap: () {
//                        Navigator.of(context).pop()
                    Navigator.of(context).push<void>(MaterialPageRoute(
                      builder: (context) => DetailsScreen(item.id),
//                          fullscreenDialog: false,
                    ));
                  },
                  child: ListTile(title: Text('${item.name}')));
            }),
      ),
    );
  }
}