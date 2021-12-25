import 'package:flutter/material.dart';
import 'package:flutter_shop/UI/views/base_view.dart';
import 'package:flutter_shop/core/viewmodels/cart_model.dart';
import 'package:flutter_shop/core/viewmodels/product_list_model.dart';
import 'package:flutter_shop/helpers/constants.dart';

class ProductListView extends StatelessWidget {
  const ProductListView({Key? key}) : super(key: key);

  Widget _buildCartButton(BuildContext context, CartModel? cartModel) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            // TODO 21: Navigate to cart
          },
          icon: const Icon(Icons.shopping_cart),
          color: Colors.blue,
        ),

        // TODO 16: Call get CartSize
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO 14: wrap widget with cart Model
    return BaseView<ProductListModel>(
      // TODO 5: call get product
      onModelReady: (model) => {},
      builder: (context, model, child) => Scaffold(
        backgroundColor: Colors.grey.shade50,
        appBar: AppBar(
          title: const Text(ViewTitle.ProductList),
          actions: [_buildCartButton(context, null)],
        ),
        // TODO 9: check model state and pass products data
        body: Container(),
      ),
    );
  }
}
