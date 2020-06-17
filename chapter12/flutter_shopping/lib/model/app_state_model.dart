import 'package:flutter_shopping/model/product.dart';
import 'package:flutter_shopping/model/products_repository.dart';
import 'package:scoped_model/scoped_model.dart';


double _shippingCostPerItem = 7.0;

class AppStateModel extends Model {
  List<Product> _availableProducts;

  Category _selectedCategory = Category.all;

  final Map<int, int> _productsInCart = <int, int>{};
  Map<int, int> get productsInCart => Map<int, int>.from(_productsInCart);

  int get totalCartQuantity => _productsInCart.values.fold(0, (int v, int e) => v + e);

  Category get selectedCategory => _selectedCategory;

  double get subtotalCost {
    double sum = 0;
    _productsInCart.keys.forEach((id) => sum += _productsInCart[id] * getProductById(id).price);
    return sum;
  }

  double get shippingCost {
    return totalCartQuantity * _shippingCostPerItem;
  }

  double get totalCost => subtotalCost + shippingCost;

  List<Product> getProducts() {
    if (_availableProducts == null) {
      return <Product>[];
    }

    if (_selectedCategory == Category.all) {
      return List<Product>.from(_availableProducts);
    } else {
      return _availableProducts
        .where((Product p) => p.category == _selectedCategory)
        .toList();
    }
  }

  void addProductToCart(int productId) {
    if (!_productsInCart.containsKey(productId)) {
      _productsInCart[productId] = 1;
    } else {
      _productsInCart[productId]++;
    }

    notifyListeners();
  }

  void removeItemFromCart(int productId) {
    if (_productsInCart.containsKey(productId)) {
      if (_productsInCart[productId] == 1) {
        _productsInCart.remove(productId);
      } else {
        _productsInCart[productId]--;
      }
    }

    notifyListeners();
  }

  Product getProductById(int id) {
    return _availableProducts.firstWhere((Product p) => p.id == id);
  }

  List<Product> getProductBySearch(String query) {
    return _availableProducts.where((Product p) => p.name.startsWith(query)).toList();
  }

  void clearCart() {
    _productsInCart.clear();
    notifyListeners();
  }

  void loadProducts() {
    _availableProducts = ProductsRepository.loadProducts(Category.all);
    notifyListeners();
  }

  void setCategory(Category newCategory) {
    _selectedCategory = newCategory;
    notifyListeners();
  }

  @override
  String toString() {
    return 'AppStateModel(totalCost: $totalCost)';
  }
}
