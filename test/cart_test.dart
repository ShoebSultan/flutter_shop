// TODO 8: Declare Mock Products

import 'package:flutter_shop/core/models/product.dart';
import 'package:flutter_shop/core/viewmodels/cart_model.dart';
import 'package:flutter_shop/helpers/dependency_assembly.dart';
import 'package:flutter_test/flutter_test.dart';

List<Product> mockProducts = [
  Product(id: 1, name: "Product1", price: 111, imageUrl: "imageUrl"),
  Product(id: 2, name: "Product2", price: 222, imageUrl: "imageUrl"),
  Product(id: 3, name: "Product3", price: 333, imageUrl: "imageUrl"),
  Product(id: 4, name: "Product4", price: 444, imageUrl: "imageUrl"),
];

void main() {
  // TODO 9: Call Dependency Injector
  setupDependencyAssembler();

  // TODO 10: Inject View Model
  var cartViewModel = dependencyAssembler<CartModel>();

  // TODO 11: Add Mock Products
  cartViewModel.addToCart(mockProducts[0]);
  cartViewModel.addToCart(mockProducts[1]);
  cartViewModel.addToCart(mockProducts[2]);
  cartViewModel.addToCart(mockProducts[3]);
  cartViewModel.addToCart(mockProducts[0]);
  cartViewModel.addToCart(mockProducts[1]);

  // TODO 12: Write Cart Page Test Cases
  group('Given Cart Page Loads', () {
    test('Page Should laod list of products added to cart', () async {
      expect(cartViewModel.cartSize, 6);
      expect(cartViewModel.getCartSummary().keys.length, 4);
    });

    test(
        'Page should consolidate products in cart and show accurate summary data',
        () {
      cartViewModel.getCartSummary();
      expect(cartViewModel.getProduct(0).id, 1);
      expect(cartViewModel.getProduct(1).id, 2);
      expect(cartViewModel.getProduct(2).id, 3);
      expect(cartViewModel.getProduct(3).id, 4);

      expect(cartViewModel.getProductQuantity(0), 2);
      expect(cartViewModel.getProductQuantity(1), 2);
      expect(cartViewModel.getProductQuantity(2), 1);
      expect(cartViewModel.getProductQuantity(3), 1);
    });
  });

  // TODO 13: Write Checkout Test Cases
  test('When user checkout the product, it should show total costs', () {
    cartViewModel.totalCost;
    expect((cartViewModel.totalCost), 1443);
  });

  // TODO 14: Write test case to clear the cart after check out
  test('When user finished the purchase, it should clear the cart', () {
    cartViewModel.clearCart();
    expect(cartViewModel.cartSize, 0);
  });
}
