import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('vertical divider ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: VerticalDivider(),
    ));

    final finder = find.byType(Container);
    expect(finder, findsOneWidget);
  });
}
