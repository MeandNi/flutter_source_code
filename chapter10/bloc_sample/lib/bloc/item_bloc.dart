import 'dart:async';

import 'package:bloc_sample/bloc/items_bloc.dart';

class ItemBloC {

  ItemsBloC _itemsBloC;

  ItemBloC(ItemsBloC itemsBloC) {
    _itemsBloC = itemsBloC;
  }

  List<Item> items = <Item>[];
  StreamController _addItemStreamController = new StreamController<List<Item>>();

  Stream<List<Item>> get itemsStream => _addItemStreamController.stream;

  void addItem(Item item)
  {
    items.add(item);    
    _addItemStreamController.add(items);
  }

  void removeItem(Item item) {
    print("remve");
    items.removeWhere((entity) => entity.title == item.title);
  }

  void close() {
    _addItemStreamController.close();
  }
}

class Item {
   String title;
   Item(this.title);
}