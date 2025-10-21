import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:organiza_metro_flutter/src/widgets/password_field.dart';

void main() {
  testWidgets('PasswordField renderiza e aceita entrada de senha',
      (WidgetTester tester) async {
    final controller = TextEditingController();

    await tester.pumpWidget(
      MaterialApp(
        home: PasswordField(
          fadePassword: false,
          passwordController: controller,
        ),
      ),
    );

    expect(find.byType(TextField), findsOneWidget);

    await tester.enterText(find.byType(TextField), '123456');
    expect(controller.text, '123456');
  });
}
