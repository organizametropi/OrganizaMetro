import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

Future<void> pumpWidgetWithMaterial(
  WidgetTester tester,
  Widget widget,
) async {
  await tester.pumpWidget(
    MaterialApp(
      home: Scaffold(body: widget),
    ),
  );
  await tester.pumpAndSettle();
}
