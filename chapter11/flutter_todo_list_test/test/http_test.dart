// 使用 Mockito 包中的 Mock 类创建一个 MockClient 类，该类实现的 http 包 Client 类并且继承了 Mock 类。
// 每次测试需要创建一个该类的实例
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_todo_list_test/models/todo.dart';
import 'package:flutter_todo_list_test/services.dart';
import 'package:http/http.dart';
import 'package:mockito/mockito.dart';

class MockClient extends Mock implements Client {}

void main() {
  group('getTodos', () {
    HttpServices services = new HttpServices();
    test('http 请求完成后返回一个 Todo 列表', () async {
      // 创建 MockClient 类的实例
      final client = MockClient();

      // 使用 Mockito 模拟一个成功的请求
      // mockito 中的 when 方法会拦截 MockClient 发起的网络请求，并返回一个我们指定的响应值，这里返回了一个带有 JSON 字符串的 Respose 对象表示请求成功。
      when(client.get('https://jsonplaceholder.typicode.com/todos'))
          .thenAnswer((_) async => Response('[]', 200));

      // 比较返回结果与预期结果
      expect(await services.getTodos(client), isInstanceOf<List<Todo>>());
    });

    test('当 http 请求失败时抛出异常', () {
      final client = MockClient();

      // 模拟网络请求失败的情况
      when(client.get('https://jsonplaceholder.typicode.com/todos'))
          .thenAnswer((_) async => Response('Not Found', 404));

      expect(services.getTodos(client), throwsException);
    });
  });
}