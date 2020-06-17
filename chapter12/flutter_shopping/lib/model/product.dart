import 'package:flutter/foundation.dart';

enum Category {
  all,
  digital,
  clothing,
  home,
}

class Product {
  const Product({
    @required this.category,
    @required this.id,
    @required this.name,
    @required this.price,
  });

  final Category category;
  final int id;
  final String name;
  final int price;

  String get assetName => 'images/$id-0.jpg';

  @override
  String toString() => '$name (id=$id)';
}
