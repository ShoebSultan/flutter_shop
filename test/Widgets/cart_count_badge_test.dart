/* import 'package:flutter/cupertino.dart';
import 'package:flutter_shop/UI/widget/cart_count_badge.dart';
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
  setupDependencyAssembler();
  var cartViewModel = dependencyAssembler<CartModel>();
  cartViewModel.addToCart(mockProducts[0]);
  cartViewModel.addToCart(mockProducts[1]);
  cartViewModel.addToCart(mockProducts[2]);
  cartViewModel.addToCart(mockProducts[3]);
  cartViewModel.addToCart(mockProducts[0]);
  cartViewModel.addToCart(mockProducts[1]);
  //cartViewModel.clearCart();

  testWidgets('cart count badge test has cartSize',
      (WidgetTester tester) async {
    await tester.pumpWidget(CartCountBadge(cartViewModel.cartSize));

    // c"reate the finders
    final cartSizeFinder = find.text("6");

    // verify the widget using matcher
    expect(cartSizeFinder, findsOneWidget);
    // await tester.enterText(cartSizeFinder, 0.toString());
    // expect(find.text("0"), findsOneWidget);
  });
}
 */