import 'package:flutter/material.dart';

class StackSample extends StatefulWidget {
  @override
  _StackSampleState createState() => _StackSampleState();
}

class _StackSampleState extends State<StackSample> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stack'),
      ),
      body: Center(
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage('images/pic.jpg'),
              radius: 100,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.black45,
              ),
              child: Text(
                'Meandni',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 20.0,
              left: 20.0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.amber,
                ),
                child: Text(
                  'VIP',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
