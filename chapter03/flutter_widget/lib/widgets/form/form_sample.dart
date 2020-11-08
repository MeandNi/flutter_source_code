import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class FormSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Form"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: MyCustomForm(),
        ));
  }
}

// 定义一个自己的有状态组件
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// 定义对应的对象类型
// 该类用于管理表单中的各个数据
class MyCustomFormState extends State<MyCustomForm> {
  // 创建一个 GlobalKey 对象作为该 Form 组件的唯一标识，
  // 这里，GlobalKey 的范型被设置为了 Form 组件对应的状态对象 FormState
  final _formKey = GlobalKey<FormState>();

  String username = '';
  static const SEX = ["男", "女"];

  @override
  Widget build(BuildContext context) {
    // 构建控件树，并将 Form 作为根控件，使用它时需要传入一个 GlobalKey 对象
    return Form(
        key: _formKey,
        child: Column(
            children: <Widget>[
              // 加入表单控件，如 TextFormFields、RaisedButton 等
              TextFormField(
                decoration: const InputDecoration(
                  hintText: '请速入用户名',
                ),
                onSaved: (value) => username = value,
                validator: (value) {
                  if (value.isEmpty) {
                    return "用户名不能为空！";
                  }
                },
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                child: DropdownButtonFormField<String>(
//                  isExpanded: true,
                  // 装饰该表单控件
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Sex",
                  ),
                  // 设置默认值
                  value: "男",
                  // 用户选择子项后回调该函数
                  onChanged: (String newSelection) {
                    print(newSelection);
                    setState((){});
                  },
                  // 传入可选项
                  items: SEX.map((String sex) {
                    return DropdownMenuItem(value: sex, child: Text(sex));
                  }).toList(),
                ),
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
