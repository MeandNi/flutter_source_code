import 'package:flutter/material.dart';
import 'package:flutter_shopping/pages/home.dart';
import 'package:flutter_shopping/pages/login.dart';
import 'package:flutter_shopping/model/app_state_model.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_shopping/style/theme.dart';

class ShoppingApp extends StatefulWidget {
  @override
  _ShoppingAppState createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  AppStateModel model;

  @override
  void initState() {
    super.initState();
    model = AppStateModel()..loadProducts();
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModel<AppStateModel>(
      model: model,
      child: MaterialApp(
        title: '在线商城',
        home: HomePage(),
        initialRoute: '/login',
        onGenerateRoute: _getRoute,
        theme: appTheme,
      ),
    );
  }
}

Route<dynamic> _getRoute(RouteSettings settings) {

  switch (settings.name) {
    case '/login':
      return MaterialPageRoute<void>(
        settings: settings,
        builder: (BuildContext context) => LoginPage(),
        fullscreenDialog: true,
      );
    default:
      return MaterialPageRoute(
        builder: (context) => Scaffold(
          body: Center(child: Text('没有找到这个页面：${settings.name}')),
        ),
      );
  }
}

final ThemeData appTheme = buildTheme();