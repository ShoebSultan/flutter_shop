import 'package:flutter_shop/core/models/product.dart';
import 'package:flutter_shop/core/viewmodels/base_model.dart';

class CartModel extends BaseModel {
  List<Product> cart = [];
  Map<String, List<Product>> cartSummary = {};

  int get cartSize {
    // ignore: unnecessary_null_comparison
    if (cart != null) {
      return cart.length;
    } else {
      return 0;
    }
  }

  void addToCart(Product product) {
    cart.add(product);
    notifyListeners();
  }

  List<Product> getCart() {
    return cart;
  }

  Map<String, List<Product>> getCartSummary() {
    cartSummary = {};
    for (var product in cart) {
      if (!cartSummary.keys.contains(product.name)) {
        cartSummary[product.name] = [product];
      } else {
        var currentProducts = cartSummary[product.name];
        currentProducts!.add(product);
        cartSummary[product.name] = currentProducts;
      }
    }
    return cartSummary;
  }

  Product getProduct(int index) {
    var name = cartSummary.keys.elementAt(index);
    return cartSummary[name]!.first;
  }

  int getProductQuantity(int index) {
    var name = cartSummary.keys.elementAt(index);
    return cartSummary[name]!.length;
  }

  int get totalCost {
    var cost = 0;
    for (var productName in cartSummary.keys) {
      cost += (cartSummary[productName]!.first.price *
          cartSummary[productName]!.length);
    }
    return cost;
  }

  void clearCart() {
    cart = [];
    notifyListeners();
  }
}
