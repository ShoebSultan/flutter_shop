// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_shop/UI/widget/product_image.dart';
import 'package:flutter_shop/core/models/product.dart';

class CartItemCard extends StatelessWidget {
  const CartItemCard(this.product, this.quantity);

  final Product product;
  final int quantity;

  List<Widget> _getProductDetails(BuildContext context) {
    return [
      Text(product.name,
          maxLines: 2, style: Theme.of(context).textTheme.subtitle2),
      Text('\$${product.price.toString()}.00',
          style: Theme.of(context).textTheme.subtitle1),
      // ignore: unnecessary_string_escapes
      Text('\Qty: ${quantity.toString()}',
          style: Theme.of(context).textTheme.subtitle2)
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 6.0),
      child: Container(
        height: 150.0,
        decoration: const BoxDecoration(color: Colors.white),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _getProductDetails(context),
                  ),
                ),
              ),
              const VerticalDivider(),
              ProductImage(product.imageUrl),
            ],
          ),
        ),
      ),
    );
  }
}
