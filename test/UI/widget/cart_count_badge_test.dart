import 'package:flutter/material.dart';
import 'package:flutter_shop/UI/widget/cart_count_badge.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    "cart count badge test",
    (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Stack(
            children: const [CartCountBadge(0)],
          ),
        ),
      );
      // up and running
      final findText = find.byType(Text);
      expect(findText, findsOneWidget);
      expect(find.byType(Icon), findsNothing);
      final text = find.text("0");
      expect(text, findsOneWidget);
    },
  );
}
