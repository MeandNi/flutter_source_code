import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class WinGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}

class WinGestureSample extends StatefulWidget {
  @override
  _WinGestureSampleState createState() => _WinGestureSampleState();
}

class _WinGestureSampleState extends State<WinGestureSample> {
  Map<Type, GestureRecognizerFactory> gesturesParent =
      <Type, GestureRecognizerFactory>{
    WinGestureRecognizer:
        GestureRecognizerFactoryWithHandlers<WinGestureRecognizer>(
      () => WinGestureRecognizer(), //constructor
      (WinGestureRecognizer instance) {
        //initializer
        instance.onTap = () => print('父容器响应');
      },
    )
  };

  Map<Type, GestureRecognizerFactory> gesturesChild =
      <Type, GestureRecognizerFactory>{
    WinGestureRecognizer:
        GestureRecognizerFactoryWithHandlers<WinGestureRecognizer>(
      () => WinGestureRecognizer(), //constructor
      (WinGestureRecognizer instance) {
        //initializer
        instance.onTap = () => print('子容器响应');
      },
    )
  };

  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(title: Text('WinGesture'),),
//      body: Center(
//        child: GestureDetector(
//          onTap: () {
//            print("触发外部的探测器的点击事件");
//          },
//          child: Container(
//            color: Colors.blueAccent,
//            width: 400.0,
//            height: 400.0,
//            child: Center(
//              child: GestureDetector(
//                onTap: () {
//                  print("触发内部的探测器点击事件");
//                },
//                child: Container(
//                  width: 150.0,
//                  height: 150.0,
//                  color: Colors.yellowAccent,
//                  child: Center(child: Text('点击')),
//                ),
//              ),
//            ),
//          ),
//        ),
//      ),
//    );
//  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WinGesture'),
      ),
      body: Center(
        child: RawGestureDetector(
          gestures: gesturesParent,
          // 父容器
          child: Container(
            color: Colors.blueAccent,
            child: Center(
              // 内部探测器
              child: RawGestureDetector(
                gestures: gesturesChild,
                // 子容器
                child: Container(
                  color: Colors.yellowAccent,
                  width: 300.0,
                  height: 400.0,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
