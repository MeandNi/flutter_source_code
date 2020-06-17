import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogSample extends StatefulWidget {
  @override
  _DialogSampleState createState() => _DialogSampleState();
}

class _DialogSampleState extends State<DialogSample> {
  var _options = ['是', '不是'];
  var selected = '是';

  _showDialog() {
    showDialog(
        // 设置点击 dialog 外部不取消 dialog，默认能够取消
        barrierDismissible: true,
        context: context,
        builder: (context) => Dialog(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    alignment: Alignment.center,
                    height: 100.0,
                    color: Colors.white,
                    child: Text('弹窗内容'),
                  ),
                  FlatButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("确认"),
                  )
                ],
              ),
            ));
  }

  _showAlertDialog() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => AlertDialog(
              title: Text('弹窗标题'),
              content: Text('主体内容'),
              backgroundColor: Colors.white,
              elevation: 8.0,
              shape: Border.all(width: 1.0),
              actions: <Widget>[
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("取消"),
                ),
                FlatButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text("确认"),
                )
              ],
            ));
  }

  _showSimpleDialog() {
    Future<String> result = showDialog<String>(
        barrierDismissible: false,
        context: context,
        builder: (context) => SimpleDialog(
            title: Text('弹窗标题',style: TextStyle(),),
            // 这里传入一个选择器列表即可
            children: _options
                .map((option) => SimpleDialogOption(
                      onPressed: () => Navigator.of(context).pop(option),
                      child: Center(child: Text(option)),
                    ))
                .toList()));
    result.then((result) {
      setState(() {
        selected = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dialog'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('你在 SimpleDialog 选择： $selected'),
            RaisedButton(
              onPressed: _showDialog,
              child: Text('打开 Dialog 对话框'),
            ),
            RaisedButton(
              onPressed: _showAlertDialog,
              child: Text('打开 AlertDialog 对话框'),
            ),
            RaisedButton(
              onPressed: _showSimpleDialog,
              child: Text('打开 SimpleDialog 对话框'),
            ),
          ],
        ),
      ),
    );
  }
}

/// Future<void> _askedToLead() async {
///   switch (await showDialog<Department>(
///     context: context,
///     builder: (BuildContext context) {
///       return SimpleDialog(
///         title: const Text('Select assignment'),
///         children: <Widget>[
///           SimpleDialogOption(
///             onPressed: () { Navigator.pop(context, Department.treasury); },
///             child: const Text('Treasury department'),
///           ),
///           SimpleDialogOption(
///             onPressed: () { Navigator.pop(context, Department.state); },
///             child: const Text('State department'),
///           ),
///         ],
///       );
///     }
///   )) {
///     case Department.treasury:
///       // Let's go.
///       // ...
///     break;
///     case Department.state:
///       // ...
///     break;
///   }
/// }
