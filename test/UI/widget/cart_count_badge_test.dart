import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_shop/UI/views/product_list_view.dart';
import 'package:flutter_shop/UI/widget/cart_count_badge.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Widget makeTestAbleWidget({Widget? child}) {
    return const MaterialApp(
      home: Scaffold(
        body: ProductListView(),
      ),
    );
  }

  testWidgets('cart count badge ...', (tester) async {
    const testKey = Key('K');
    await tester.pumpWidget(makeTestAbleWidget());

    // await tester.pumpWidget(const CartCountBadge(testKey, 0));

    // c"reate the finders
    //final cartSizeFinder = find.text("0");
    final cartSizeFinder = find.byKey(ValueKey("cartSize"));

    // verify the widget using matcher
    expect(cartSizeFinder, findsOneWidget);
  });
}
