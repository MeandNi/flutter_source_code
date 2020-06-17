import 'package:flutter_shopping/model/product.dart';

class ProductsRepository {
  static List<Product> loadProducts(Category category) {
    const List<Product> allProducts = <Product>[
      Product(
        category: Category.clothing,
        id: 28,
        name: '运动鞋',
        price: 800,
      ),
      Product(
        category: Category.clothing,
        id: 0,
        name: '旅游背包',
        price: 120,
      ),
      Product(
        category: Category.clothing,
        id: 29,
        name: '长裤',
        price: 500,
      ),
      Product(
        category: Category.digital,
        id: 25,
        name: '苹果笔记本',
        price: 12000,
      ),
      Product(
        category: Category.clothing,
        id: 1,
        name: '太阳镜',
        price: 58,
      ),
      Product(
        category: Category.clothing,
        id: 2,
        name: '腰带',
        price: 35,
      ),
      Product(
        category: Category.digital,
        id: 26,
        name: '平板电脑',
        price: 2000,
      ),
      Product(
        category: Category.digital,
        id: 24,
        name: 'iphone',
        price: 7400,
      ),
      Product(
        category: Category.clothing,
        id: 3,
        name: '项链',
        price: 98,
      ),
      Product(
        category: Category.clothing,
        id: 4,
        name: '耳环',
        price: 34,
      ),
      Product(
        category: Category.digital,
        id: 27,
        name: '鼠标',
        price: 300,
      ),
      Product(
        category: Category.clothing,
        id: 5,
        name: '长筒袜',
        price: 12,
      ),
      Product(
        category: Category.clothing,
        id: 6,
        name: '钥匙环',
        price: 16,
      ),
      Product(
        category: Category.clothing,
        id: 7,
        name: '帽子',
        price: 40,
      ),
      Product(
        category: Category.clothing,
        id: 8,
        name: '耸肩袋',
        price: 198,
      ),
      Product(
        category: Category.home,
        id: 9,
        name: '办公桌三件套',
        price: 58,
      ),
      Product(
        category: Category.home,
        id: 10,
        name: '储物架',
        price: 18,
      ),
      Product(
        category: Category.home,
        id: 11,
        name: '陶瓷套装',
        price: 28,
      ),
      Product(
        category: Category.home,
        id: 12,
        name: '茶具',
        price: 34,
      ),
      Product(
        category: Category.home,
        id: 13,
        name: '蓝宝石杯',
        price: 18,
      ),
      Product(
        category: Category.home,
        id: 14,
        name: '雨水盘',
        price: 27,
      ),
      Product(
        category: Category.home,
        id: 15,
        name: '布餐巾',
        price: 16,
      ),
      Product(
        category: Category.home,
        id: 16,
        name: '播种机',
        price: 16,
      ),
      Product(
        category: Category.home,
        id: 17,
        name: '四方桌',
        price: 175,
      ),
      Product(
        category: Category.home,
        id: 18,
        name: '厨房',
        price: 129,
      ),
      Product(
        category: Category.clothing,
        id: 19,
        name: '粘土毛衣',
        price: 48,
      ),
      Product(
        category: Category.clothing,
        id: 20,
        name: '外套',
        price: 45,
      ),
      Product(
        category: Category.clothing,
        id: 21,
        name: '石膏外衣',
        price: 38,
      ),
      Product(
        category: Category.clothing,
        id: 22,
        name: '条纹衬衫',
        price: 70,
      ),
      Product(
        category: Category.clothing,
        id: 23,
        name: '布衬衫',
        price: 70,
      ),
    ];
    if (category == Category.all) {
      return allProducts;
    } else {
      return allProducts.where((Product p) => p.category == category).toList();
    }
  }
}
