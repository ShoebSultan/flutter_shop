import 'package:flutter/material.dart';
import 'package:flutter_shop/UI/views/base_view.dart';
import 'package:flutter_shop/UI/views/cart_view.dart';
import 'package:flutter_shop/UI/widget/cart_count_badge.dart';
import 'package:flutter_shop/UI/widget/product_list.dart';
import 'package:flutter_shop/core/enums/view_state.dart';
import 'package:flutter_shop/core/viewmodels/cart_model.dart';
import 'package:flutter_shop/core/viewmodels/product_list_model.dart';
import 'package:flutter_shop/helpers/constants.dart';

// ignore: use_key_in_widget_constructors
class ProductListView extends StatelessWidget {
  Widget _buildCartButton(BuildContext context, CartModel cartModel) {
    return Stack(
      key: const ValueKey("widget"),
      children: [
        IconButton(
          onPressed: () {
            // TODO 21: Navigate to cart
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => CartView(cartModel: cartModel)),
            );
          },
          icon: const Icon(Icons.shopping_cart),
          color: Colors.white,
        ),

        // TODO 16: Call get CartSize
        cartModel.cartSize != 0
            ? CartCountBadge(cartModel.cartSize)
            : Container()
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO 14: wrap widget with cart Model
    return BaseView<CartModel>(
      onModelReady: (cartModel) => cartModel.getCart(),
      builder: (context, cartModel, child) => BaseView<ProductListModel>(
        onModelReady: (model) => model.getProducts(),
        builder: (context, model, child) => Scaffold(
          key: ValueKey("widget"),
          backgroundColor: Colors.grey.shade50,
          appBar: AppBar(
            title: const Text(ViewTitle.ProductList),
            actions: <Widget>[
              _buildCartButton(
                context,
                cartModel,
              )
            ],
          ),
          body: model.state == ViewState.busy
              ? const Center(child: CircularProgressIndicator())
              : ProductList(model.products, cartModel),
        ),
      ),
    );
  }
}
