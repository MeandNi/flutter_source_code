import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_list_test/counter.dart';

void main() {
  group('Counter 类测试', () {
    final counter = Counter();
    test('初始值为 0', () {
      expect(counter.value, 0);
    });

    test('increment 方法测试', () {
      counter.increment();
      expect(counter.value, 1);
    });

    test('decrement 方法测试', () {

      counter.decrement();
      expect(counter.value, 0);
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}