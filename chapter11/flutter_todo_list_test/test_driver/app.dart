import 'package:flutter_driver/driver_extension.dart';
import 'package:flutter_todo_list_test/main.dart' as app;

void main() {
  // 这行代码可以使驱动插件生效
  enableFlutterDriverExtension();

  // 调用 main.dart 中应用程旭的入口，
  // 这里也可以直接调用 runApp 方法并传入想要测试的 Widget 去测试
  app.main();
}