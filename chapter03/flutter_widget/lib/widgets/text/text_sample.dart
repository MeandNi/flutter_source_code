///
/// Created by NieBin on 2019/1/14
/// Github: https://github.com/nb312
/// Email: niebin312@gmail.com
///
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class TextSample extends StatefulWidget {
  @override
  _TextState createState() => _TextState();
}

class _TextState extends State<TextSample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Text"),
        ),
        body: ListView(
          padding: EdgeInsets.all(12.0),
          children: <Widget>[
            Text(
              'Hello Flutter' * 5, // 必要属性，是我们需要显示的字符串的值
              maxLines: 1, // 指定文本显示的最大行数
              textAlign: TextAlign.center, // 用于设置文本内容在 Text 组件中的水平对其方式
              overflow: TextOverflow.ellipsis, // 超出范围的省略样式
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20.0), // 文本样式
            ),
            Text(
              'Meandni' * 5,
              style: TextStyle(
                color: Colors.blue, // 设置文本显示的颜色
                fontSize: 20.0, // 文本显示的大小
                height: 5.0, // 文本每行高度
                fontWeight: FontWeight.bold, // 指定文本的粗细
                fontStyle: FontStyle.italic, // 文本样式，这里将文本设为斜体
                decoration: TextDecoration.underline, // 装饰文本，添加下划线
                letterSpacing: 4, // 文字间隔
                decorationStyle:
                    TextDecorationStyle.dashed, // 装饰类型，这里使用虚线类型的下划线
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Text.rich(
              TextSpan(
                  text: 'Hello', // 默认样式
                  children: <TextSpan>[
                    TextSpan(
                        text: ' interesting ',
                        style: TextStyle(
                            fontSize: 20.0, fontStyle: FontStyle.italic)),
                    TextSpan(
                        text: 'flutter',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                  style: TextStyle(fontSize: 40.0)),
            ),
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Text(
                'Meandni',
                style: TextStyle(fontFamily: 'Lobster', fontSize: 50.0),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Text(
                'Meandni',
                style: TextStyle(fontFamily: 'DancingScript', fontSize: 50.0),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
            Center(
              child: Text(
                'Google Fonts',
                style: GoogleFonts.lato(
                  textStyle: TextStyle(color: Colors.blue, letterSpacing: .5),
                ),
              ),
            ),
            Center(
              child: Text(
                'Google Fonts',
                style: GoogleFonts.lato(
                  fontSize: 48,
                  fontWeight: FontWeight.w700,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            SizedBox(
              height: 80.0,
            ),
          ],
        ));
  }
}
