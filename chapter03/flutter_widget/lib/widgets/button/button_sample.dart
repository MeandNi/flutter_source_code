
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Button"),
        ),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                textColor: Colors.black,
                child: const Text(
                  'RaisedButton 按钮',
//                    style: TextStyle(fontSize: 20)
                ),
              ),
              SizedBox(height: 20,),
              RaisedButton(
                onPressed: null,
                child: Text(
                  'RaisedButton 按钮',
//                    style: TextStyle(fontSize: 20)
                ),
              ),
              FlatButton(
                color: Colors.blue,
                textColor: Colors.white,
                disabledColor: Colors.grey,
                disabledTextColor: Colors.black,
                onPressed: () {},
                child: Text(
                  "Flat Button",
                ),
              ),
              DropdownButton<String>(
                // value 属性设置下拉列表默认显示的值
                value: 'One',
                // 用户选择列表项时触发该回调事件
                onChanged: (String newValue) {

                },
                // 所含列表项，每项为一个 DropdownMenuItem 组件，使用泛化类型，这里为 String
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
              FloatingActionButton(
                // 设置点击事件回调函数
                onPressed: (){},
                tooltip: 'Increment',
                // 设置子组件
                child: Icon(Icons.add),
              ),
              SizedBox(height: 20,),
              IconButton(
                // icon 属性用于显示在按钮内部的图标
                icon: Icon(Icons.favorite),
                color: Colors.red,
                // 设置点击事件回调函数
                onPressed: () {},
              ),SizedBox(height: 20,),
              CupertinoButton(
                color: Colors.blue,
                child: Text("Button"),
                onPressed: () {},
              )
            ],
          ),
        )
    );
  }
}
