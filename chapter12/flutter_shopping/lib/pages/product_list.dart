import 'package:flutter/material.dart';
import 'package:flutter_shopping/model/product.dart';
import 'package:flutter_shopping/widgets/product_card.dart';
import 'package:flutter_shopping/widgets/product_card.dart';

class ProductList extends StatelessWidget {
  const ProductList({Key key, this.products}) : super(key: key);

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: products.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            color: Colors.white,
            alignment: Alignment.center,
            child: ProductCard(
              product: products[index],
            ),
          );
        });
  }
}
