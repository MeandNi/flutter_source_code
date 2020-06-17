import 'package:bloc_sample/bloc/bloc_provider.dart';
import 'package:bloc_sample/bloc/items_bloc.dart';
import 'package:bloc_sample/pages/home_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: ItemsBloC(),
      child: MaterialApp(
        title: 'BloC Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MyHomePage(title: 'BloC Sample'),
      ),
    );
  }
}

