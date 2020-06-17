import 'package:flutter/material.dart';

class TextFieldSample extends StatefulWidget {
  @override
  _TextFieldSampleState createState() => _TextFieldSampleState();
}

class _TextFieldSampleState extends State<TextFieldSample> {

  String inputString = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TextField'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            TextField(),
            SizedBox(
              height: 50.0,
            ),
            TextField(
//                obscureText: true,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.airplanemode_active),
                fillColor: Colors.red,
                labelText: '请输入用户名',
              ),
              onChanged: (value) {
                setState(() {
                  // 更新状态
                  inputString = value;
                });
              },
            ),
            SizedBox(
              height: 50.0,
            ),
            TextFieldStateSample(),
            SizedBox(
              height: 50.0,
            ),
            TextField(
              controller: TextEditingController(text: "Hello"),
              decoration: InputDecoration(
                  labelText: "World",
                  helperText: "AAA",
                  hintText: "HHH",
//            errorText: "What?",
                  hasFloatingPlaceholder: true,
                  isDense: false,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
//            prefixText: "name:",
                  prefixIcon: Icon(Icons.airplanemode_active),
                  suffixText: "Suf",
                  suffixIcon: Icon(Icons.forward),
                  counterText: "1000",
                  filled: false,
                  fillColor: Colors.red,
                  errorBorder: UnderlineInputBorder(
                      borderRadius: BorderRadius.circular(100)),
                  semanticCounterText: "semati",
                  alignLabelWithHint: true),
              keyboardType: TextInputType.url,
              onTap: () {
                print("Tab");
              },
              onChanged: (value) {
                print("value: $value");
              },
              onSubmitted: (v) {
                print("v: $v");
              },
            ),
          ],
        ),
      ),
    );
  }
}


class TextFieldStateSample extends StatefulWidget {
  @override
  _TextFieldStateSampleState2 createState() => _TextFieldStateSampleState2();
}

class _TextFieldStateSampleState extends State<TextFieldStateSample> {

  String inputString = '';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
//                obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.airplanemode_active),
            fillColor: Colors.red,
            labelText: '请输入用户名',
          ),
          onChanged: (value) {
            setState(() {
              // 更新状态
              inputString = value;
            });
          },
        ),
        Text(
          inputString,
          style: TextStyle(fontSize: 30.0),
        ),
      ],
    );
  }
}

class _TextFieldStateSampleState2 extends State<TextFieldStateSample> {

  TextEditingController _controller = new TextEditingController();

  String inputString;

  // 初始化状态
  void initState() {
    _controller.addListener((){
      setState(() {
        inputString = _controller.text;
      });
    });

    _controller.text = "Meandni!";
    _controller.selection = TextSelection(
        baseOffset: 2,
        extentOffset: _controller.text.length
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        TextField(
          controller: _controller,
//                obscureText: true,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.airplanemode_active),
            fillColor: Colors.red,
            labelText: '请输入用户名',
          ),
        ),
        Text(
          inputString,
          style: TextStyle(fontSize: 30.0),
        ),
      ],
    );
  }
}
