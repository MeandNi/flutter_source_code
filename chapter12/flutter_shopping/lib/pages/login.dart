import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_shopping/style/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static const ShapeDecoration _decoration = ShapeDecoration(
    shape: BeveledRectangleBorder(
      side: BorderSide(color: ShoppingColors.brown900, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(7.0)),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
          const SizedBox(height: 80.0),
          Column(
            children: <Widget>[
              FlutterLogo(
                size: 100.0,
                colors: Colors.pink,
              ),
              const SizedBox(height: 16.0),
              Text(
                'Flutter Shopping',
                style: Theme.of(context).textTheme.headline,
              ),
            ],
          ),
          const SizedBox(height: 120.0),
          PrimaryColorOverride(
            color: ShoppingColors.brown900,
            child: TextField(
              controller: _usernameController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person),
                labelText: '输入用户名',
              ),
            ),
          ),
          const SizedBox(height: 12.0),
          PrimaryColorOverride(
            color: ShoppingColors.brown900,
            child: TextField(
              controller: _passwordController,
              decoration: const InputDecoration(
                  prefixStyle: TextStyle(color: Colors.green),
                  prefixIcon: Icon(Icons.lock),
                  labelText: '请输入密码',
                  hoverColor: Colors.green),
            ),
          ),
          ButtonBar(children: <Widget>[
            FlatButton(
              child: const Text('取消'),
              shape: const BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(7.0)),
              ),
              onPressed: () {
                print("dd");
                SystemNavigator.pop();
              },
            ),
            RaisedButton(
                child: Text('登陆'),
                elevation: 8.0,
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {
                  Navigator.pop(context);
                })
          ])
        ])));
  }
}

class PrimaryColorOverride extends StatelessWidget {
  const PrimaryColorOverride({Key key, this.color, this.child})
      : super(key: key);

  final Color color;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Theme(
      child: child,
      data: Theme.of(context).copyWith(primaryColor: color),
    );
  }
}
