import 'package:flutter/material.dart';
import 'package:provider_sample/utils/uuid.dart';

class ItemListModel extends ChangeNotifier {
  List<Item> items = <Item>[];

  void addItem(Item item) {
    items.add(item);
    notifyListeners();
  }

  void removeTodo(Item item) {
    items.removeWhere((it) => it.id == item.id);
    notifyListeners();
  }

  void updateTodo(Item item) {

    var oldTodo = items.firstWhere((it) => it.id == item.id);
    var replaceIndex = items.indexOf(oldTodo);
    items.replaceRange(replaceIndex, replaceIndex + 1, [item]);
    notifyListeners();
  }

  void clearChecked() {
    items.removeWhere((item) => item.checked);
    notifyListeners();
  }
}

class Item {
  final String id;
  final String title;
  final bool checked;

  Item(this.title, {this.checked = false, String id})
      : id = id ?? Uuid().generateV4();

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Item &&
          runtimeType == other.runtimeType &&
          checked == other.checked &&
          title == other.title &&
          id == other.id;

  Item copy({String title, bool checked, String id}) {
    return Item(
      title ?? this.title,
      checked: checked ?? this.checked,
      id: id ?? this.id,
    );
  }
}