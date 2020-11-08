import 'package:flutter/material.dart';
import 'package:flutter_shopping/utils/MoneyUtil.dart';
import 'package:scoped_model/scoped_model.dart';

import 'package:flutter_shopping/model/app_state_model.dart';
import 'package:flutter_shopping/model/product.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({@required this.product});

  final Product product;
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    final Image imageWidget = Image.asset(
      product.assetName,
      width: 200,
      height: 200.0,
      fit: BoxFit.cover,
    );

    final snackBar = SnackBar(
      content: Text('已加入购物车！'),
      action: SnackBarAction(
        label: '查看',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );

    return ScopedModelDescendant<AppStateModel>(
      builder: (BuildContext context, Widget child, AppStateModel model) {
        return GestureDetector(
          onTap: () {
            model.addProductToCart(product.id);
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: child,
        );
      },
      child: Stack(
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              imageWidget,
              SizedBox(height: 4.0),
              Text(
                product == null ? '' : product.name,
                style: theme.textTheme.button,
                softWrap: false,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
              Container(
                child: Text(
                  product == null ? '' : MoneyUtil.withPrefix(product.price),
                  style: theme.textTheme.caption,
                ),
              ),
            ],
          ),
          Positioned(
            top: 18.0,
            left: 10.0,
            child: Icon(Icons.add_shopping_cart),
          ),
        ],
      ),
    );
  }
}
