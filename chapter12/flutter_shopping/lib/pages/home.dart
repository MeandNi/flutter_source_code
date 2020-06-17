import 'package:flutter/material.dart';
import 'package:flutter_shopping/widgets/backdrop.dart';
import 'package:flutter_shopping/pages/category_menu_page.dart';
import 'package:flutter_shopping/style/colors.dart';
import 'package:flutter_shopping/model/app_state_model.dart';
import 'package:flutter_shopping/model/product.dart';
import 'package:flutter_shopping/pages/shopping_cart.dart';
import 'package:flutter_shopping/widgets/card_button.dart';
import 'package:flutter_shopping/pages/product_list.dart';
import 'package:scoped_model/scoped_model.dart';

class ProductPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<AppStateModel>(
        builder: (BuildContext context, Widget child, AppStateModel model) {
      return ProductList(products: model.getProducts());
    });
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  int _curIndex;

  @override
  void initState() {
    super.initState();
    _curIndex = 0;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
      value: 0.0,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Backdrop backdrop = Backdrop(
      frontLayer: ProductPage(),
      backLayer: CategoryMenuPage(onCategoryTap: () => _controller.reverse()),
      frontTitle: Text('首页'),
      backTitle: Text('菜单'),
      controller: _controller,
    );

    return Scaffold(
      body: _curIndex == 0 ? backdrop : ShoppingCartPage(),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: ShoppingColors.green200,
        selectedItemColor: Colors.pink,
//        unselectedItemColor: Colors.grey,
        onTap: (index) {
          setState(() {
            _curIndex = index;
          });
        },
        currentIndex: _curIndex,
        showSelectedLabels: true,
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('首页')),
          BottomNavigationBarItem(
              icon: ScopedModelDescendant<AppStateModel>(
                builder:
                    (BuildContext context, Widget child, AppStateModel model) {
                  return CartButton(itemCount: model.totalCartQuantity,);
                },
              ),
              title: Text('购物车'))
        ],
      ),
    );
  }
}
