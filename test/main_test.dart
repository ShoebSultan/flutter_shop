import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('main ...', (tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: Scaffold(),
    ));
    final findWidget = find.byType(Scaffold);
    expect(findWidget, findsOneWidget);
  });
}
