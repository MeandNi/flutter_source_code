import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('TodoList 驱动测试', () {
    // 首先，需要定义能够定位到 Widget 的查找器
    // byValueKey 传入 WIdget 的 Key 对象的字符串名称
    final counterTextFinder = find.byValueKey('counter');
    final buttonFinder = find.byValueKey('increment');

    final textFieldFinder = find.byValueKey('todo-text_field');
    final addButtonFinder = find.byValueKey('add-button');
    final lastTodoFinder = find.byValueKey("todo9");

    FlutterDriver driver;

    // 启动驱动器
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // 测试完成后关闭驱动器
    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

//    test('添加待办事项', () async {
//      driver.tap(textFieldFinder);
//      await Future.delayed(Duration(seconds: 1));
//      for (int i=0; i<10; i++) {
//        await driver.enterText('todo$i');
//        await driver.tap(addButtonFinder);
//      }
//      await Future.delayed(Duration(seconds: 1));
//      expect(await driver.getText(lastTodoFinder), isNot("0"));
//    });

    test('测试列表滚动', () async {
      // 创建组件查找器，这里我们都通过 Key 对象的名称查询
      final listFinder = find.byValueKey('list-view');
      final itemFinder = find.byValueKey('todo29');

      driver.tap(textFieldFinder);
      for (int i = 0; i < 30; i++) {
        await driver.enterText('todo$i');
        await driver.tap(addButtonFinder);
      }

      final timeline = await driver.traceAction(() async {
        await driver.scrollUntilVisible(
          // 指定滚动的列表
          listFinder,
          // 滚到到某个具体的 item
          itemFinder,
          // 这个参数指定驱动程序每一次需要滚动多少像素，
          // 这里为了避免错过需要查找的项应当指定一个足够小的数值
          // 为 dyScroll 指定负值代表向下滚动，同时我们也可以指定 dxScroll 做水平滚动
          dyScroll: -150.0,
        );

        // 验证是否文本内容正确
        expect(await driver.getText(itemFinder), 'todo29');
      });

      final summary = new TimelineSummary.summarize(timeline);

      summary.writeSummaryToFile('scrolling_summary', pretty: true);

      summary.writeTimelineToFile('scrolling_timeline', pretty: true);
    });
  });
}
