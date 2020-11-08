import 'package:flutter/material.dart';

class ConstrainedBoxSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ConstrainedBox'),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 50.0,
            maxWidth: 150.0,
            minHeight: 50.0,
            maxHeight: 70.0,
          ),
          child: Container(
            color: Colors.lightBlue,
          ),
        ),
      ),
    );
  }
}
