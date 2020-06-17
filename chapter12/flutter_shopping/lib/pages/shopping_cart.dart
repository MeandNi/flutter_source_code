import 'package:flutter/material.dart';
import 'package:flutter_shopping/style/colors.dart';
import 'package:flutter_shopping/model/app_state_model.dart';
import 'package:flutter_shopping/model/product.dart';
import 'package:flutter_shopping/utils/MoneyUtil.dart';
import 'package:scoped_model/scoped_model.dart';

const double _leftColumnWidth = 60.0;

class ShoppingCartPage extends StatefulWidget {
  @override
  _ShoppingCartPageState createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<Widget> _createShoppingCartRows(AppStateModel model) {
    return model.productsInCart.keys
        .map(
          (int id) => ShoppingCartRow(
            product: model.getProductById(id),
            quantity: model.productsInCart[id],
            onPressed: () {
              model.removeItemFromCart(id);
            },
          ),
        )
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final ThemeData localTheme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: Text('购物车'),
          centerTitle: false,
        ),
        backgroundColor: ShoppingColors.green200,
        body: ScopedModelDescendant<AppStateModel>(
            builder: (BuildContext context, Widget child, AppStateModel model) {
          return model.totalCartQuantity == 0
              ? Center(
                  child: Text(
                    '你的购物车是空的！',
                    style: localTheme.textTheme.title
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                )
              : Column(children: <Widget>[
                  Expanded(
                      child: ListView(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: _leftColumnWidth,
                          ),
                          Text('共计 ${model.totalCartQuantity} 件商品'),
                        ],
                      ),
                      SizedBox(height: 16.0),
                      Column(
                        // 商品列表
                        children: _createShoppingCartRows(model),
                      ),
                      SizedBox(height: 100.0),
                    ],
                  )),
                  // 底部价格，购物车清空按钮组件
                  Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        ShoppingCartSummary(model: model),
                        RaisedButton(
                          shape: BeveledRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(7.0)),
                          ),
                          color: ShoppingColors.green400,
                          splashColor: ShoppingColors.brown600,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 12.0),
                            child: Text('清空购物车'),
                          ),
                          onPressed: () {
                            model.clearCart();
                          },
                        )
                      ])
                ]);
        }));
  }
}

class ShoppingCartSummary extends StatelessWidget {
  const ShoppingCartSummary({this.model});

  final AppStateModel model;

  @override
  Widget build(BuildContext context) {
    final TextStyle smallAmountStyle = Theme.of(context)
        .textTheme
        .body1
        .copyWith(color: ShoppingColors.brown600);
    final TextStyle largeAmountStyle = Theme.of(context).textTheme.display1;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: <Widget>[
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: Text('总价'),
              ),
              Text(
                MoneyUtil.withPrefix(model.totalCost),
                style: largeAmountStyle,
              ),
            ],
          ),
          SizedBox(height: 16.0),
          Row(
            children: <Widget>[
              const Expanded(
                child: Text('商品价格:'),
              ),
              Text(
                MoneyUtil.withPrefix(model.subtotalCost),
                style: smallAmountStyle,
              ),
            ],
          ),
          SizedBox(height: 4.0),
          Row(
            children: <Widget>[
              const Expanded(
                child: Text('运费:'),
              ),
              Text(
                MoneyUtil.withPrefix(model.shippingCost),
                style: smallAmountStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ShoppingCartRow extends StatelessWidget {
  const ShoppingCartRow({
    @required this.product,
    @required this.quantity,
    this.onPressed,
  });

  final Product product;
  final int quantity;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final ThemeData localTheme = Theme.of(context);

    return Padding(
        padding: EdgeInsets.only(bottom: 16.0),
        child: Row(
            key: ValueKey<int>(product.id),
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                width: _leftColumnWidth,
                child: IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: onPressed,
                ),
              ),
              Expanded(
                  child: Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Column(children: <Widget>[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Image.asset(
                              product.assetName,
                              fit: BoxFit.cover,
                              width: 75.0,
                              height: 75.0,
                            ),
                            SizedBox(width: 16.0),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    children: <Widget>[
                                      Expanded(
                                        child: Text('数量: $quantity'),
                                      ),
                                      Text(
                                          'x ${MoneyUtil.withPrefix(product.price)}'),
                                    ],
                                  ),
                                  Text(
                                    product.name,
                                    style: localTheme.textTheme.subhead
                                        .copyWith(fontWeight: FontWeight.w600),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 16.0),
                        Divider(
                          color: ShoppingColors.brown900,
                          height: 10.0,
                        )
                      ])))
            ]));
  }
}
