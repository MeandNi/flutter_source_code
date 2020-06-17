import 'package:flutter/material.dart';

class SelfNavigator extends StatelessWidget {
  SelfNavigator({@required this.home, this.routes});

  final Widget home;
  final Map<String, WidgetBuilder> routes;


  Route<dynamic> _onGenerateRoute(RouteSettings settings) {
    final String name = settings.name;
    WidgetBuilder pageContentBuilder;

    if (name == Navigator.defaultRouteName && home != null) {
      pageContentBuilder = (context) => home;
    } else if (routes != null) {
      pageContentBuilder = routes[name];
    }

    if (pageContentBuilder != null) {
      return MaterialPageRoute(builder: pageContentBuilder);
    }

    return MaterialPageRoute(
        builder: (_) => Scaffold(
              body:
                  Center(child: Text('没有找到这个页面： ${settings.name}')),
            ));
  }

  @override
  Widget build(BuildContext context) {

    return Navigator(
      key: GlobalObjectKey<NavigatorState>(this),
      onGenerateRoute: _onGenerateRoute,
    );
  }
}
