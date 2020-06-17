import 'package:flutter/material.dart';
import 'package:flutter_route/self_navigator/data/local_veggie_provider.dart';

class DetailsScreen extends StatefulWidget {
  final int id;
  DetailsScreen(this.id);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {

  @override
  Widget build(BuildContext context) {
    final veggie = LocalVeggieProvider.veggies.singleWhere((v) => v.id == widget.id);
    return Scaffold(
      appBar: AppBar(title: Text('水果详情页'),),
      body: Center(
        child: Text(veggie.name, style: TextStyle(fontSize: 30.0),),
      ),
    );
  }
}