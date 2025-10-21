import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/entrar_button.dart';

void main() {
  testWidgets('GetStartedButton renderiza corretamente',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: GetStartedButton(
          emailController: TextEditingController(),
          passwordController: TextEditingController(),
        ),
      ),
    );

    expect(find.byType(ElevatedButton), findsOneWidget);
  });
}
