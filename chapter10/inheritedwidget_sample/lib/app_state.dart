class AppState {
  List<Item> items = <Item>[];

  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AppState &&
          runtimeType == other.runtimeType &&
          items == other.items;

}

class Item {
   String title;
   Item(this.title);
}