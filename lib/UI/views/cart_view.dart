import 'package:flutter/material.dart';
import 'package:flutter_shop/UI/widget/cart_item_card.dart';

import 'package:flutter_shop/core/viewmodels/cart_model.dart';
import 'package:flutter_shop/helpers/constants.dart';

class CartView extends StatelessWidget {
  final CartModel cartModel;
  const CartView({
    Key? key,
    required this.cartModel,
  }) : super(key: key);

  _showConfirmationAlertDialog(BuildContext context) {
    Widget confirmButton = TextButton(
      child: const Text("Confirm"),
      onPressed: () {
        Navigator.of(context).pop(true);
      },
    );
    Widget cancelButton = TextButton(
      child: const Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop(false);
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Confirm Purchase?"),
      content: Text("Grant Total: \$${cartModel.totalCost}"),
      actions: [
        cancelButton,
        confirmButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((confirmedPurchased) {
      if (confirmedPurchased) {
        _showConfirmedAlertDialog(context);
      }
    });
  }

  _showConfirmedAlertDialog(BuildContext context) {
    Widget okButton = TextButton(
      child: const Text("Ok"),
      onPressed: () {
        cartModel.clearCart();
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: const Text("Ordered Confirmed"),
      actions: [
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    ).then((_) {
      Navigator.of(context).pop();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(ViewTitle.Cart),
        actions: <Widget>[
          cartModel.cartSize > 0
              ? IconButton(
                  icon: const Icon(Icons.done),
                  onPressed: () async {
                    _showConfirmationAlertDialog(context);
                  },
                )
              : Container()
        ],
      ),
      body: cartModel.cartSize > 0
          ? ListView.builder(
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: <Widget>[
                    Padding(
                      child: CartItemCard(cartModel.getProduct(index),
                          cartModel.getProductQuantity(index)),
                      padding: const EdgeInsets.all(10.0),
                    ),
                  ],
                );
              },
              itemCount: cartModel.getCartSummary().keys.length,
            )
          : Center(
              child: Text(
                'Your cart is empty',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ),
    );
  }
}
