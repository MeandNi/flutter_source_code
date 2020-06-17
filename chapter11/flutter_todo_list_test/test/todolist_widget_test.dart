import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_todo_list_test/main.dart';
import 'package:flutter_todo_list_test/todo_list.dart';

void main() {

  Widget makeTestableWidget({Widget child}) {
    return MaterialApp(
      home: child,
    );
  }
  testWidgets('组件测试', (WidgetTester tester) async {
    await tester.pumpWidget(makeTestableWidget(child: TodoList()));

    // 在输入框中输入 “hi”
    await tester.enterText(find.byType(TextField), 'hi');

    // 点击添加按钮
    await tester.tap(find.byType(FloatingActionButton));

    // 重建 Widget
    await tester.pump();

    // 测试是否添加成功
    expect(find.text('hi'), findsOneWidget);
  });
}