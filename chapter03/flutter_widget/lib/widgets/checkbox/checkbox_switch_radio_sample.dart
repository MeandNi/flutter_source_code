import 'package:flutter/cupertino.dart';

import "package:flutter/material.dart";

class CheckBoxSample extends StatefulWidget {
  @override
  CheckBoxSampleState createState() => CheckBoxSampleState();
}

enum Sex { boy, girl }

class CheckBoxSampleState extends State<CheckBoxSample> {
  bool _value = false;
  Sex _radioValue = Sex.boy;

  Widget _checkBox() => Checkbox(
        value: _value,
        onChanged: (value) {
          setState(() {
            _value = value;
          });
        },
        activeColor: Colors.red,
      );

  Widget _radio() => Row(
        children: <Widget>[
          Radio(
            value: Sex.boy,
            groupValue: _radioValue,
            onChanged: (value) {
              print("value = $value");
              setState(() {
                _radioValue = value;
              });
            },
          ),
          Radio(
            value: Sex.girl,
            groupValue: _radioValue,
            onChanged: (value) {
              setState(() {
                _radioValue = value;
              });
            },
          )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      );

  Widget _switch() => Switch(
      value: _value, // 默认值
      activeColor: Colors.lightBlue, // 开关打开的状态下的颜色
      activeTrackColor: Colors.redAccent, // 开关滑块的颜色
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      });

  Widget _cupertinoswitch() => CupertinoSwitch(
      value: _value, // 默认值
      activeColor: Colors.lightBlue, // 开关打开的状态下的颜色
      onChanged: (value) {
        setState(() {
          _value = value;
        });
      });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckBox'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _checkBox(),
              SizedBox(height: 50.0),
              _radio(),
              SizedBox(height: 50.0),
              _switch(),
              SizedBox(height: 50.0),
              _cupertinoswitch(),
              SizedBox(height: 50.0),
              MyCustomForm()
            ],
          ),
        ));
  }
}

class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

class MyCustomFormState extends State<MyCustomForm> {
  // Form 控件上的 Key 对象
  final _formKey = GlobalKey<FormState>();
  // FormField 控件上的 Key 对象
  final _checkedFormKey = GlobalKey<FormFieldState>();

  // 用来存放被选中多选项的集合
  Set<String> hobbys = <String>{};

  // 判断多选项是否被选中（是否在集合中）
  bool get _footballChecked => hobbys.contains('football');
  bool get _basketballChecked => hobbys.contains('basketball');

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        // Column 可以将传入 children 属性的子控件在垂直方向排列
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // 由于不能直接使用 Checkbox 控件，所以使用 FormField 包裹
              // 这里还需要使用范型指定表单控件中校验函数与值保存函数中的值类型
              FormField<Set<String>>(
                key: _checkedFormKey,
                initialValue: hobbys,         // 初始值，空集合表示默认不选中
                onSaved: (val) => print(val), // 值保存函数
                validator: (value) {          // 校验函数
                  if (value.isEmpty) return '爱好为空！';
                  return null;
                },
                builder: (context) {
                  // Row 可以将传入 children 属性的子控件在水平方向排列
                  return Row(
                    children: <Widget>[
                      Text("爱好："),
                      Checkbox(
                        value: _footballChecked,
                        onChanged: (val) {
                          // 根据 val 值确定 football 加入集合或从集合中移除，并重建组件更新状态
                          setState(() {
                            if (val) {
                              hobbys.add('football');
                            } else {
                              hobbys.removeWhere((item) => item == 'football');
                            }
                          });
                        },
                      ),
                      Text("足球"),
                      Checkbox(
                        value: _basketballChecked,
                        onChanged: (val) {
                          setState(() {
                            if (val) {
                              hobbys.add('basketball');
                            } else {
                              hobbys
                                  .removeWhere((item) => item == 'basketball');
                            }
                          });
                        },
                      ),
                      Text("篮球"),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        // 通过 _checkedFormKey 得到 FormField 对应的状态对象
                        // errorText 表示校验函数返回的错误提示信息
                        child: Text(
                          _checkedFormKey.currentState.errorText ?? '',
                          style: TextStyle(color: Colors.redAccent),
                        ),
                      )
                    ],
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: RaisedButton(
                  onPressed: () {
                    // 如果表单有效则返回 true，否则返回 false
                    if (_formKey.currentState.validate()) {
                      print("表单验证成功");
                      _formKey.currentState.save();
                    }
                  },
                  child: Text('提交'),
                ),
              ),
            ]));
  }
}
