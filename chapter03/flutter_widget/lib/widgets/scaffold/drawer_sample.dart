import 'package:flutter/material.dart';

class DrawerSample extends StatefulWidget {
  @override
  _DrawerSampleState createState() => _DrawerSampleState();
}

class _DrawerSampleState extends State<DrawerSample> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
//        automaticallyImplyLeading: false,
        title: const Text('Drawer Demo'),
      ),
      body: Center(
        child: RaisedButton(
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
          child: Text('打开抽屉栏'),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              '菜单头部',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.message),
            title: Text('消息'),
          ),
          ListTile(
            leading: Icon(Icons.account_circle),
            title: Text('我的'),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('设置'),
          ),
        ],
      ),
    );
  }
}
